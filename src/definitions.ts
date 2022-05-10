export interface TwitterPlugin {
  isLogged(): Promise<{ in: boolean; out: boolean }>;

  login(): Promise<{
    authToken: string;
    authTokenSecret: string;
    userName: string;
    userID: string;
  }>;

  logout(): Promise<void>;
}
