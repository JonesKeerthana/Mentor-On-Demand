import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { UserauthService } from './userauth.service';
import { Router } from '@angular/router';
import { skills } from '../models/skills';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AdminService {
  readonly Url="http://localhost:8219/api/Admin";
  constructor(private http: HttpClient,private _authService:UserauthService,private router:Router) { }
  listtechad():Observable<skills[]>
  {{{debugger}}
    return this.http.get<skills[]>(this.Url+'/'+'Getskills');
  }
}
