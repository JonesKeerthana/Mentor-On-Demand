import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { UserauthService } from './userauth.service';
import { Router } from '@angular/router';
import { Observable } from 'rxjs';
import { dispmentortech, mentoraccept } from '../models/dispmentortech';
import { LogregService } from './logreg.service';
import { mentorskills, mentorskillsadd } from '../models/skills';


@Injectable({
  providedIn: 'root'
})
export class MentorService {
  readonly Url="http://localhost:8784/api/mentor";
  constructor(private http: HttpClient,private _authService:UserauthService,private router:Router,private logregservice:LogregService) { }
  id:number=this.logregservice.activeuserid;
  gettechmentor():Observable<dispmentortech[]>
  {
    {{debugger}}
return this.http.get<dispmentortech[]>(this.Url+'/'+'GetMentorTech'+'/'+this.id);
  }
  mid:number=this.logregservice.activeuserid;
getuserrequest():Observable<mentoraccept[]>
{
return this.http.get<mentoraccept[]>(this.Url+'/'+'acceptusers'+'/'+this.id)
}
addmentorskill(mentor:mentorskillsadd):Observable<{}>
{
  {{debugger}}
return this.http.post(this.Url+'/'+'AddSkill'+'/'+ this.mid,mentor,{headers: new HttpHeaders({ 'Content-Type': 'application/json'})})
}
}
