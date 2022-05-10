import { registerPlugin } from "@capacitor/core";
import { TwitterPlugin } from "./definitions";

const Twitter = registerPlugin<TwitterPlugin>("Twitter", {
  web: () => import("./web").then((m) => new m.TwitterWeb()),
});

// export * from './web'; // @todo
export * from "./definitions";
export { Twitter };
