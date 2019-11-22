import { Component, OnInit } from '@angular/core';
import { dispmentortech, mentoraccept } from '../models/dispmentortech';
import { MentorService } from '../services/mentor.service';
import { Observable } from 'rxjs';
import { LogregService } from '../services/logreg.service';
import { UserauthService } from '../services/userauth.service';
import { Router } from '@angular/router';
import { training } from '../models/training';
import { mentorskills, mentorskillsadd } from '../models/skills';

@Component({
  selector: 'app-mentorhome',
  templateUrl: './mentorhome.component.html',
  styleUrls: ['./mentorhome.component.css']
})
export class MentorhomeComponent implements OnInit {
check:boolean=false
mentortech:dispmentortech[]=[];
requested:Observable<mentoraccept[]>;
mentor:mentorskillsadd={};
  constructor(private authservice:UserauthService,private router:Router,private mentorservice:MentorService,private logregservice:LogregService) { }

  ngOnInit() {
  this.mentor={
  
    msSid:null,
    msSelfrating:null,
    msYearsofexperience:null

  }
 
    {{debugger}}
this.mentorservice.gettechmentor().subscribe(x=>{
  {{debugger}}
  this.mentortech=x as dispmentortech[]});
console.log(this.mentortech);
this.requested=this.mentorservice.getuserrequest();
  }
  addskillmentor(mentor:mentorskillsadd)
  {
this.mentorservice.addmentorskill(mentor).subscribe(()=>this.check=true);
  }
  logOut():void
  {
    this.authservice.logOut();
    localStorage.removetoken('token3');
    this.router.navigate(['/']);
  }
}
