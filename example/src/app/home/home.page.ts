import { Component, OnInit } from '@angular/core';
import { Twitter } from '@capacitor-community/twitter';

const twitter = new Twitter();

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage implements OnInit {
  session: any;

  isLogged: boolean = false;

  constructor() {}

  ngOnInit() {
    this.update();
  }

  logout() {
    twitter.logout().then((r) => {
      this.session = {};
      this.isLogged = false;
    });
  }

  login() {
    twitter.login().then((r) => {
      this.isLogged = true;
      // this.update();
      console.log('SUCCESS', JSON.stringify(r));
      this.session = r;
      // twitter.isLogged().then(r => console.log(JSON.stringify(r)));
    });
  }

  update() {
    twitter
      .isLogged()
      .then((r) => (r.in ? (this.isLogged = true) : (this.isLogged = false)));
  }
}
