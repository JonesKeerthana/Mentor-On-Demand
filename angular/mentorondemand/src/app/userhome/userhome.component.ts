import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { UserauthService } from '../services/userauth.service';
import { Router } from '@angular/router';
import { MentorService } from '../services/mentor.service';
import { LogregService } from '../services/logreg.service';
import { dispuser } from '../models/dispuser';
import { UserService } from '../services/user.service';
import { skills } from '../models/skills';

@Component({
  selector: 'app-userhome',
  templateUrl: './userhome.component.html',
  styleUrls: ['./userhome.component.css']
})
export class UserhomeComponent implements OnInit {
var2:number
var1:number
  usertech:dispuser[];
  user1:skills[];
  check:boolean;
  filuser:dispuser[];
msg:string=""

  constructor(private authservice:UserauthService,private router:Router,private userservice:UserService,private logregservice:LogregService) { }

  ngOnInit() {
    {{debugger}}
    this.userservice.getskills().subscribe(res=>{this.user1=res as skills[]});
this.userservice.gettechmentor().subscribe(x=>
  {
    {{debugger}}
    this.usertech=x as dispuser[]
    console.log(this.usertech);
    this.filuser=this.usertech
  });


  }
  logOut():void
  {
    this.authservice.logOut();
    localStorage.removetoken('token2');
    this.router.navigate(['/']);
  }
  onChange(id:number)
  {
    {{debugger}}
    this.userservice.getspecificmentor(id).subscribe(res1=>{
      this.filuser=res1 as dispuser[]
    });
    //this.userservice.sid=id
     
  }
  bookslot(mid:number,sid:number)
  {
    {{debugger}}
   this.userservice.bookslots(mid,sid).subscribe(()=>
   {
     {{debugger}}
     this.check=true;
    this.msg="Registered successfully"
    this.var2=mid;
    this.var1=sid;
    });
  }
}
