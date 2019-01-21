declare global {
  interface PluginRegistry {
    TwitterPlugin?: ITwitterPlugin;
  }
}

export interface ITwitterPlugin {
  isLogged(): Promise<{ in: boolean; out: boolean }>;

  login(): Promise<{
    authToken: string;
    authTokenSecret: string;
    userName: string;
    userID: string;
  }>;

  logout(): Promise<void>;
}
