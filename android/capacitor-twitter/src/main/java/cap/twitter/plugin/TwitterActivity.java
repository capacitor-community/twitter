package cap.twitter.plugin;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import com.twitter.sdk.android.core.DefaultLogger;
import com.twitter.sdk.android.core.Twitter;
import com.twitter.sdk.android.core.TwitterAuthConfig;
import com.twitter.sdk.android.core.TwitterConfig;

//
// @todo trying with a separate activity for the plugin
public class TwitterActivity extends AppCompatActivity {
    private static final String TAG = "Twitter Activity";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Log.v(TAG, "WEEE TWITTER ACTIVITY");


        super.onCreate(savedInstanceState);

        //
        // initialize twitter
        TwitterConfig config = new TwitterConfig.Builder(this)
                .logger(new DefaultLogger(Log.DEBUG))
                .twitterAuthConfig(new TwitterAuthConfig("xxx", "yyy"))
                .debug(true)
                .build();
        Twitter.initialize(config);



    }
}