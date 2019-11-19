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
check:Boolean=false;
msg:string="";
  ngOnInit() {
    this.mentor={
     
      mName:null,
      mUsername:null,
      mPassword:null,
      mLinkedinurl:null,
      mYearsofexperience:null
 
    }
    this.user=null;
  }
  registeruser(user:userregister)
  {
    
  }
  registermentor(mentor:mentorregister)
  {
    this.logregservice.regmentor(mentor).subscribe(()=>
    {{{debugger}}
      this.check=true;
      this.msg="Registered successfully"
    });
  }

}
