import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Router } from '@angular/router';
import { UserauthService } from './userauth.service';
import { Observable } from 'rxjs';
import { mentordtls } from '../models/mentordtls';
import { admin } from '../models/admin';
import { userdtls } from '../models/userdtls';
import { mentorregister } from '../models/mentorregister';

@Injectable({
  providedIn: 'root'
})
export class LogregService {
  readonly Url="http://localhost:8219/api/loginregister";
  readonly root="http://localhost:59513/api/Auth"
  activeusername:string;
  activeuserid:number;
  status:boolean;
  constructor(private http: HttpClient,private _authService:UserauthService,private router:Router) { }
loginadmin(uname:string,pass:string):Observable<admin>
{
return this.http.get<admin>(this.Url+'/'+'GetAdmin'+'/'+uname+'/'+pass);
}
GetTokenAdmin(username:string)
  {
    if(this.status==true)
    {{{debugger}}
      this.http.get(this.root+'/GetAdminToken/'+username).
      subscribe((res:any)=>{
        localStorage.setItem('token1',res.token);
        console.log(res.token);
       
      })
    }
  }

loginmentor(uname:string,pass:string):Observable<mentordtls>
{
return this.http.get<mentordtls>(this.Url+'/'+'GetMentor'+'/'+uname+'/'+pass);
}
GetTokenMentor(username:string)
{
  if(this.status==true)
  {
    this.http.get(this.root+'/GetMentorToken/'+username).
    subscribe((res:any)=>{
      localStorage.setItem('token3',res.token);
      console.log(res.token);
      this.router.navigateByUrl('/Admin/TechList');
    })
  }
}

loginuser(uname:string,pass:string):Observable<userdtls>
{
return this.http.get<userdtls>(this.Url+'/'+'GetUser'+'/'+uname+'/'+pass);
}
GetTokenUser(username:string)
{
  if(this.status==true)
  {
    this.http.get(this.root+'/GetUserToken/'+username).
    subscribe((res:any)=>{
      localStorage.setItem('token2',res.token);
      console.log(res.token);
      this.router.navigateByUrl('/Admin/TechList');
    })
  }
}

regmentor(mentor:mentorregister)
{
  {{debugger}}
return this.http.post(this.Url+'/'+'PostMentor',mentor,{headers: new HttpHeaders({ 'Content-Type': 'application/json'})} );
}
reguser(user:userdtls)
{
  {{debugger}}
return this.http.post(this.Url+'/'+'PostUser',user,{headers: new HttpHeaders({ 'Content-Type': 'application/json'})} );
}
}

