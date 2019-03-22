package cap.twitter.plugin;

import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.util.Log;
import android.view.View;
import android.view.inputmethod.InputMethodManager;

import com.getcapacitor.Config;
import com.getcapacitor.JSObject;
import com.getcapacitor.NativePlugin;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.twitter.sdk.android.core.Callback;
import com.twitter.sdk.android.core.DefaultLogger;
import com.twitter.sdk.android.core.Result;
import com.twitter.sdk.android.core.Twitter;
import com.twitter.sdk.android.core.TwitterAuthConfig;
import com.twitter.sdk.android.core.TwitterConfig;
import com.twitter.sdk.android.core.TwitterException;
import com.twitter.sdk.android.core.TwitterSession;
import com.twitter.sdk.android.core.identity.TwitterAuthClient;

@NativePlugin(requestCodes = {140})
public class TwitterPlugin extends Plugin {
    public static final String CONFIG_KEY_PREFIX = "plugins.TwitterPlugin.";

    private TwitterAuthClient authClient;

    @Override()
    public void load() {
        String consumerKey = Config.getString(CONFIG_KEY_PREFIX + "consumerKey", "");
        String consumerSecret = Config.getString(CONFIG_KEY_PREFIX + "consumerSecret", "");

        //
        // initialize twitter
        TwitterConfig config = new TwitterConfig.Builder(getActivity())
                .logger(new DefaultLogger(Log.DEBUG))
                .twitterAuthConfig(new TwitterAuthConfig(consumerKey, consumerSecret))
                .debug(true)
                .build();
        Twitter.initialize(config);


        //this.bridge.onActivityResult(, , );

        super.load();
    }


    @PluginMethod()
    public void login(final PluginCall call) {

        Log.d("DEBUG", "LOGIN CALL");

        authClient = new TwitterAuthClient();

        authClient.authorize(getActivity(), new Callback<TwitterSession>() {
            @Override
            public void success(Result<TwitterSession> result) {
                Log.d("DEBUG", "LOGIN SUCCESS");
                JSObject ret = new JSObject();
                ret.put("authToken", result.data.getAuthToken().token);
                ret.put("authTokenSecret", result.data.getAuthToken().secret);
                ret.put("userName", result.data.getUserName());
                ret.put("userID", result.data.getUserId());
                Log.d("DEBUG", String.valueOf(ret));

                call.success(ret); // this is never called =(
            }

            @Override
            public void failure(TwitterException exception) {
                Log.d("DEBUG", "OH NO!! THERE WAS AN ERROR");
                call.error("error on auth", exception);
            }
        });

    }

    @PluginMethod()
    public void logout(PluginCall call) {
        new TwitterAuthClient().cancelAuthorize();
        call.success();
    }


    @Override
    protected void handleOnActivityResult(int requestCode, int resultCode, Intent data) {
        
        if (requestCode == 140) {
           authClient.onActivityResult(requestCode, resultCode, data);
        } else {
            super.handleOnActivityResult(requestCode, resultCode, data);
        }

    }

}
