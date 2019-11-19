import { Component, OnInit } from '@angular/core';
import { mentordtls } from '../models/mentordtls';
import { LogregService } from '../services/logreg.service';
import { admin } from '../models/admin';
import { userdtls } from '../models/userdtls';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  adminlogin:admin;
  mentorlogin:mentordtls;
  userlogin:userdtls;
  msg:string;
  constructor(private logregservice:LogregService,private router:Router) { }

  ngOnInit() {
  }
  onSubmit(email:string,password:string,role:string)
  {
  if(role=='Admin')
  {
    this.logregservice.loginadmin(email,password).subscribe((x:admin)=>
    {this.adminlogin= x 
      if(this.adminlogin==null)
    {
     this.msg="Incorrect UserId or Password"
   }
 else{
   this.msg="";
   this.router.navigate(['/adminhome'])
 }

    });
  }
  else
  if(role=='User')
  {
    this.logregservice.loginmentor(email,password).subscribe((x:mentordtls)=>
    {
      this.mentorlogin= x 
      if(this.adminlogin==null)
      {
       this.msg="Incorrect UserId or Password"
     }
   else{
     this.msg="";
     this.router.navigate(['/mentorhome'])
   }
  
    });
  }
  else{
    this.logregservice.loginuser(email,password).subscribe((x:userdtls)=>
      {
        this.userlogin= x
        if(this.userlogin==null)
        {
         this.msg="Incorrect UserId or Password"
        }
     else
     {
       this.msg="";
       this.router.navigate(['/userhome'])
     }
    
      });
  }
  }
  
}
