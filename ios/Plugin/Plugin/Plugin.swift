import Foundation
import Capacitor

import TwitterKit
import TwitterCore

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitor.ionicframework.com/docs/plugins/ios
 */
@objc(TwitterPlugin)
public class TwitterPlugin: CAPPlugin
{
    var window: UIWindow?
    
    public override func load() {
        let consumerKey = getConfigValue("consumerKey") as? String ?? "ADD_IN_CAPACITOR_CONFIG_JSON"
        let consumerSecret = getConfigValue("consumerSecret") as? String ?? "ADD_IN_CAPACITOR_CONFIG_JSON"
        
        TWTRTwitter.sharedInstance().start(withConsumerKey: consumerKey, consumerSecret: consumerSecret)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.didTwitterRespond(notification:)), name: Notification.Name(CAPNotifications.URLOpen.name()), object: nil)
    }
    
 
    @objc func didTwitterRespond(notification: NSNotification) {
        let app = UIApplication.shared
        
        guard let object = notification.object as? [String:Any?] else {
            return
        }

        TWTRTwitter.sharedInstance().application(app, open: object["url"] as! URL, options: object["options"] as! [AnyHashable : Any])
    }
    
    
    @objc func isLogged(_ call: CAPPluginCall) {
        DispatchQueue.main.async {
            if (TWTRTwitter.sharedInstance().sessionStore.hasLoggedInUsers()) {
                call.success(["in": true, "out": false])
            } else {
                call.success(["in": false, "out": true])
            }
        }
    }
    
    @objc func login(_ call: CAPPluginCall) {
        DispatchQueue.main.async {
            TWTRTwitter.sharedInstance().logIn(completion: { (session, error) in
                if session != nil { // Log in succeeded
                    TWTRTwitter.sharedInstance().sessionStore.saveSession(withAuthToken: session!.authToken, authTokenSecret: session!.authTokenSecret) { session, error in
                    }
                    call.success([
                        "authToken": session?.authToken as Any,
                        "authTokenSecret": session?.authTokenSecret as Any,
                        "userName":session?.userName as Any,
                        "userID": session?.userID as Any
                        ])
                } else {
                    print("logIn ERROR: \(String(describing: error))")
                    call.error("error");
                }
            })
        }
    }
    
    @objc func logout(_ call: CAPPluginCall) {
        DispatchQueue.main.async {
            let store = TWTRTwitter.sharedInstance().sessionStore
            
            if let userId = store.session()?.userID {
                store.logOutUserID(userId)
                call.success();
            }
        }
    }
}
