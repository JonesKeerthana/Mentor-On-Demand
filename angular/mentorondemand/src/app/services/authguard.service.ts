import { Injectable } from '@angular/core';
import { Router, ActivatedRouteSnapshot, CanActivate } from '@angular/router';
import { UserauthService } from './userauth.service';

@Injectable({
  providedIn: 'root'
})
export class AuthguardService implements CanActivate {
  isLoggedIn = false;
    
  constructor(private _router : Router, private _authService :UserauthService){
  }

  canActivate(route: ActivatedRouteSnapshot): boolean
  {        
      this.isLoggedIn = this._authService.loggedIn;
      console.log("isLoggedIn: " + this.isLoggedIn);
      if(this.isLoggedIn)
      {
          return true;
      }
      else{
          this._router.navigate(['login']);
          return false;
      }        
  }
}
