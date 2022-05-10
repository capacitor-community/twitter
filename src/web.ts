import { WebPlugin } from "@capacitor/core";
import { TwitterPlugin } from "./definitions";

export class TwitterWeb extends WebPlugin implements TwitterPlugin {
  constructor() {
    super({
      name: "Twitter",
      platforms: ["web"],
    });
  }

  isLogged(): Promise<{ in: boolean; out: boolean }> {
    throw this.unimplemented("Not implemented on web.");
  }
  login(): Promise<{
    authToken: string;
    authTokenSecret: string;
    userName: string;
    userID: string;
  }> {
    throw this.unimplemented("Not implemented on web.");
  }
  logout(): Promise<void> {
    throw this.unimplemented("Not implemented on web.");
  }
}

const Twitter = new TwitterWeb();

export { Twitter };
