<p align="center"><br><img src="https://user-images.githubusercontent.com/236501/85893648-1c92e880-b7a8-11ea-926d-95355b8175c7.png" width="128" height="128" /></p>
<h3 align="center">Capacitor Twitter</h3>
<p align="center"><strong><code>@capacitor-community/twitter</code></strong></p>
<p align="center">
  Capacitor community plugin for enabling TwitterKit capabilities
</p>

<p align="center">
  <img src="https://img.shields.io/maintenance/yes/2020?style=flat-square" />
  <a href="https://www.npmjs.com/package/@capacitor-community/twitter"><img src="https://img.shields.io/npm/l/@capacitor-community/twitter?style=flat-square" /></a>
<br>
  <a href="https://www.npmjs.com/package/@capacitor-community/twitter"><img src="https://img.shields.io/npm/dw/@capacitor-community/twitter?style=flat-square" /></a>
  <a href="https://www.npmjs.com/package/@capacitor-community/twitter"><img src="https://img.shields.io/npm/v/@capacitor-community/twitter?style=flat-square" /></a>
  <!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
<a href="#contributors"><img src="https://img.shields.io/badge/all%20contributors-2-orange?style=flat-square" /></a>
<!-- ALL-CONTRIBUTORS-BADGE:END -->

</p>

## Maintainers

| Maintainer   | GitHub                                | Social                                          |
| ------------ | ------------------------------------- | ----------------------------------------------- |
| Stewan Silva | [stewwan](https://github.com/stewwan) | [@StewanSilva](https://twitter.com/StewanSilva) |

## Notice 🚀

We're starting fresh under an official org. If you were using the previous npm package `capacitor-twitter`, please update your package.json to `@capacitor-community/twitter`. Check out [changelog](/CHANGELOG.md) for more info.

## Installation

Using npm:

```bash
npm install @capacitor-community/twitter
```

Using yarn:

```bash
yarn add @capacitor-community/twitter
```

Sync native files:

```bash
npx cap sync
```

## API

- Login
- Logout
- isLogged

## Usage

```js
import { Twitter } from '@capacitor-community/twitter';
const twitter = new Twitter();

twitter
  .login()
  .then((r) => console.log(r)) // { authToken:string, authTokenSecret:string, userName:string, userID:string }
  .catch((err) => console.log(err));

twitter
  .isLogged()
  .then((r) => console.log(r)) // returns { in: boolean, out: boolean }
  .catch((err) => console.log(err));

twitter.logout();
```

## iOS setup

- `ionic start my-cap-app --capacitor`
- `cd my-cap-app`
- `npm install —-save @capacitor-community/twitter`
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
- also at twitter developer site, add a new callback url in the same format: `twitterkit-your_consumer_api_key://` (with nothing behind it)

Then you should be set to go. Run `ionic cap run ios --livereload` to start the server and play it through xcode

> Important Notice: every time you change a native code you may need to clean the cache (Product > Clean build folder) and then run the app again.

## Android setup

- `ionic start my-cap-app --capacitor`
- `cd my-cap-app`
- `npm install —-save @capacitor-community/twitter`
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

- at twitter developer site, add this callback url: `twittersdk://` (with nothing behind it)
- `[extra step]` in android case we need to tell Capacitor to initialise the plugin:

> on your `MainActivity.java` file add `import com.getcapacitor.community.twitter.TwitterPlugin;` and then inside the init callback `add(TwitterPlugin.class);`

Now you should be set to go. Try `ionic cap run android --livereload` to start the server and play/debug it through Android Studio

> Important Notice: every time you change a native code you may need to clean the cache (Build > Clean Project | Build > Rebuild Project) and then run the app again.

## Example

- https://github.com/capacitor-community/twitter/blob/master/example

## License

MIT

## Contributors ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://twitter.com/StewanSilva"><img src="https://avatars1.githubusercontent.com/u/719763?v=4?s=75" width="75px;" alt=""/><br /><sub><b>Stew</b></sub></a><br /><a href="https://github.com/capacitor-community/twitter/commits?author=stewwan" title="Code">💻</a> <a href="https://github.com/capacitor-community/twitter/commits?author=stewwan" title="Documentation">📖</a></td>
    <td align="center"><a href="https://github.com/mesqueeb"><img src="https://avatars.githubusercontent.com/u/3253920?v=4?s=75" width="75px;" alt=""/><br /><sub><b>Luca Ban</b></sub></a><br /><a href="https://github.com/capacitor-community/twitter/commits?author=mesqueeb" title="Documentation">📖</a></td>
  </tr>
</table>

<!-- markdownlint-enable -->
<!-- prettier-ignore-end -->
<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!
