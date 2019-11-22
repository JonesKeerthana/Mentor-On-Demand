import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { UserauthService } from './userauth.service';
import { Router } from '@angular/router';
import { LogregService } from './logreg.service';
import { Observable } from 'rxjs';
import { dispuser } from '../models/dispuser';
import { skills } from '../models/skills';


@Injectable({
  providedIn: 'root'
})
export class UserService {

  readonly Url="http://localhost:8784/api/user";
  readonly Url1="http://localhost:8219/api/Admin/Getskills";
  
  constructor(private http: HttpClient,private _authService:UserauthService,private router:Router,private logregservice:LogregService) { }

  gettechmentor():Observable<{}>
  {{{debugger}}
return this.http.get<dispuser[]>(this.Url+'/'+'dispmentor');
  }
  uid:number=this.logregservice.activeuserid
  bookslots(mid:number,sid:number,)
  {
    {{debugger}}
 return this.http.post(this.Url+'/'+'bookslot'+'/'+this.uid+'/'+mid+'/'+sid,{headers: new HttpHeaders({ 'Content-Type': 'application/json'})})
  }
  getskills():Observable<skills[]>
{
  {{debugger}}
  return this.http.get<skills[]>(this.Url1);  
}


getspecificmentor(id:number)
{
  {{debugger}}
  return this.http.get<dispuser[]>(this.Url+'/'+'search'+'/'+id);  
}
}
