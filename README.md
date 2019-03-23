# capacitor-twitter

Capacitor plugin to enable some native twitter features

## API

- Login
- Logout
- isLogged

## iOS Setup

- `ionic start my-cap-app --capacitor`
- `cd my-cap-app`
- `npm install —save capacitor-twitter`
- `mkdir www && touch www/index.html`
- `npx cap add ios`
- add the consumer keys at `capacitor.config.json`

```
{
 …
  "plugins": {
   "TwitterPlugin": {
      "consumerKey": "xxx",
      "consumerSecret": "yyy"
    }
  }
…
}
```

- npx cap open ios
- sign your app at xcode (general tab)
- add a new url type at Xcode (info tab) and make sure the url scheme follows the format `twitterkit-your_consumer_api_key` (grab a key at twitter developer site)
- also at twitter developer site, add a new callback url in the same format: `twitterkit-your_consumer_api_key`

Then you should be set to go. Run `ionic cap run ios --livereload` to start the server and play it through xcode

> Important Notice: every time you change a native code you may need to clean the cache (Product > Clean build folder) and then run the app again.

## Android Setup

- `ionic start my-cap-app --capacitor`
- `cd my-cap-app`
- `npm install —save capacitor-twitter`
- `mkdir www && touch www/index.html`
- `npx cap add android`
- add the consumer keys at `capacitor.config.json`

```
{
 …
  "plugins": {
   "TwitterPlugin": {
      "consumerKey": "xxx",
      "consumerSecret": "yyy"
    }
  }
…
}
```

- at twitter developer site, add the callback url in the following format: `twittersdk://`
- `[extra step]` in android case we need to tell Capacitor to initialise the plugin:

> on your `MainActivity.java` file add to the header `import cap.twitter.plugin.TwitterPlugin;` and then inside the init callback `add(TwitterPlugin.class);`

Now you should be set to go. Try `ionic cap run android --livereload` to start the server and play/debug it through Android Studio

> Important Notice: every time you change a native code you may need to clean the cache (Build > Clean Project | Build > Rebuild Project) and then run the app again.

## Sample app

Check it out on the [sample app](https://github.com/stewwan/capacitor-twitter-example) using this plugin.

Follow me [@Twitter](https://twitter.com/StewanSilva)

Cheers 🍻

## License

MIT
