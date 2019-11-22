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
   this.logregservice.activeusername=this.adminlogin.aUsername;
   this.logregservice.activeuserid=this.adminlogin.aId;
   this.logregservice.status=true,this.logregservice.GetTokenAdmin(this.adminlogin.aUsername)
   this.router.navigate(['/adminhome'])

 }

    });
  }
  else if(role=='Mentor')
  {
    this.logregservice.loginmentor(email,password).subscribe((x:mentordtls)=>
    {
      this.mentorlogin= x 
      if(this.mentorlogin==null)
      {
       this.msg="Incorrect UserId or Password"
     }
   else{
     this.msg="";
     this.logregservice.activeusername=this.mentorlogin.mName;
     this.logregservice.activeuserid=this.mentorlogin.mId;
        this.logregservice.status=true,this.logregservice.GetTokenMentor(this.mentorlogin.mName)
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
       this.logregservice.activeusername=this.userlogin.username;
       this.logregservice.activeuserid=this.userlogin.id;
       this.logregservice.status=true,this.logregservice.GetTokenUser(this.userlogin.username)
       this.router.navigate(['/userhome'])
     }
    
      });
  }
  }
  
}
