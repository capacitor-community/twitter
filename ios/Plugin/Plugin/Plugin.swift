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
//, UIApplicationDelegate, TWTRComposerViewControllerDelegate
{
    
    //    weak var i2gTweet: UIImageView!
    //    weak var txtTweet: UITextView!
    
    //    private func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
    //        // Called when the app was launched with a url. Feel free to add additional processing here,
    //        // but if you want the App API to support tracking app url opens, make sure to keep this call
    //        if TWTRTwitter.sharedInstance().application(app, open: url, options: options) {
    //            return true
    //        }
    //
    //    return true
    //    }
    
    var window: UIWindow?
    //@todo
    //
    //    private func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    //        // Override point for customization after application launch.
    //
    //
    //        TWTRTwitter.sharedInstance().start(withConsumerKey: "xxx", consumerSecret: "yyy")
    //        return true
    //    }
    //
    //    private func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
    //        if TWTRTwitter.sharedInstance().application(app, open: url, options: options) {
    //            return true
    //        }
    //        // Your other open URL handlers follow […]
    //        return true
    //    }
    //
    //    // @todo
    //    func postTweetWith(imgIn:UIImage, withText textIn:String){
    //        let rootVC = self.window?.rootViewController
    //
    //        let composer = TWTRComposerViewController.init(initialText:textIn , image: imgIn, videoURL: nil)
    //        composer.delegate = self
    //        rootVC?.present(composer, animated: true, completion: nil)
    //    }
    //
    //    //MARK:- TWTRComposerViewControllerDelegate
    //
    //    private func composerDidCancel(_ controller: TWTRComposerViewController) {
    //        print("composerDidCancel, composer cancelled tweet")
    //    }
    //
    //    private func composerDidSucceed(_ controller: TWTRComposerViewController, with tweet: TWTRTweet) {
    //        print("composerDidSucceed tweet published")
    //    }
    //    private func composerDidFail(_ controller: TWTRComposerViewController, withError error: Error) {
    //        print("composerDidFail, tweet publish failed == \(error.localizedDescription)")
    //    }
    
    private func configure() {
        let consumerKey = getConfigValue("consumerKey") as? String ?? ""
        let consumerSecret = getConfigValue("consumerSecret") as? String ?? ""
        
        TWTRTwitter.sharedInstance().start(withConsumerKey: consumerKey, consumerSecret: consumerSecret)
    }
    
    @objc func isLogged(_ call: CAPPluginCall) {
        DispatchQueue.main.async {
            self.configure();
            if (TWTRTwitter.sharedInstance().sessionStore.hasLoggedInUsers()) {
                call.success(["in": true, "out": false])
            } else {
                call.success(["in": false, "out": true])
            }
        }
    }
    
    @objc func login(_ call: CAPPluginCall) {
        DispatchQueue.main.async {
            self.configure();
//            TWTRTwitter.sharedInstance().logIn(with: self.bridge.bridgeDelegate.bridgedViewController) { session, error in
            TWTRTwitter.sharedInstance().logIn(completion: { (session, error) in
                if session != nil { // Log in succeeded
                    print("SESSION TOKEN: \(String(describing: session?.authToken))")
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
            self.configure();
            let store = TWTRTwitter.sharedInstance().sessionStore
            
            if let userId = store.session()?.userID {
                store.logOutUserID(userId)
                call.success();
            }
        }
    }
}
