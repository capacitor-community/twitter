import { Plugins } from "@capacitor/core";
import { ITwitterPlugin } from "./definitions";

const { TwitterPlugin } = Plugins;

export class Twitter implements ITwitterPlugin {
  isLogged(): Promise<{ in: boolean; out: boolean }> {
    return TwitterPlugin.isLogged();
  }
  login(): Promise<{
    authToken: string;
    authTokenSecret: string;
    userName: string;
    userID: string;
  }> {
    return TwitterPlugin.login();
  }
  logout(): Promise<void> {
    return TwitterPlugin.logout();
  }
}
