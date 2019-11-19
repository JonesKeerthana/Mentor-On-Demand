import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class UserauthService {
  loggedIn=false;
  logIn()
  {
    this.loggedIn=true;
  }
  logOut()
  {
    this.loggedIn=false;
  }
    constructor() { }
  }
  
