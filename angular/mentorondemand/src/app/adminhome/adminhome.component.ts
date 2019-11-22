import { Component, OnInit } from '@angular/core';
import { UserauthService } from '../services/userauth.service';
import { Router } from '@angular/router';
import { LogregService } from '../services/logreg.service';
import { skills } from '../models/skills';
import { AdminService } from '../services/admin.service';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-adminhome',
  templateUrl: './adminhome.component.html',
  styleUrls: ['./adminhome.component.css']
})
export class AdminhomeComponent implements OnInit {

  constructor(private authservice:UserauthService,private router:Router,private logregservice:LogregService,private adminservice:AdminService) { }
techlist:Observable<skills[]>;
  ngOnInit() {
    {{debugger}}
    this.techlist = this.adminservice.listtechad();
  }
  logOut():void
  {
    this.authservice.logOut();
    localStorage.removetoken('token1');
    this.router.navigate(['/']);
  }


}
