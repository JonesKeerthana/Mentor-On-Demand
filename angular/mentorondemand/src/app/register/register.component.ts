import { Component, OnInit } from '@angular/core';
import { mentordtls } from '../models/mentordtls';
import { LogregService } from '../services/logreg.service';
import { mentorregister } from '../models/mentorregister';
import { userregister } from '../models/userregister';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {

  constructor(private logregservice:LogregService) { }
mentor:mentorregister;
user:userregister;

check1:boolean=false;
check:Boolean=false;

  ngOnInit() {
    this.mentor={
     
      mName:null,
      mUsername:null,
      mPassword:null,
      mLinkedinurl:null,
      mYearsofexperience:null
 
    }
    this.user={
      username:null,
      password:null,
      firstname:null,
      lastname:null,
      contactnumber:null
    };
  }
  registeruser(user:userregister)
  {
    this.logregservice.reguser(user).subscribe(()=>
    {
      {{debugger}}
this.check1=true;

    });
  }
  registermentor(mentor:mentorregister)
  {
    this.logregservice.regmentor(mentor).subscribe(()=>
    {{{debugger}}
      this.check=true;

    });
  }

}
