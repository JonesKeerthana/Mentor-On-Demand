import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { LoginComponent } from './login/login.component';
import { AdminhomeComponent } from './adminhome/adminhome.component';
import { UserhomeComponent } from './userhome/userhome.component';
import { MentorhomeComponent } from './mentorhome/mentorhome.component';
import { RegisterComponent } from './register/register.component';


const routes: Routes = [
  {
    path:"home", component:HomeComponent
  },

    {
      path:"login", component:LoginComponent
    },
    {
      path:"adminhome", component:AdminhomeComponent
    },
    {
      path:"userhome", component:UserhomeComponent
    },
    {
      path:"mentorhome", component:MentorhomeComponent
    },
    {
      path:"register", component:RegisterComponent
    },
  ];
@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
  
})
export class AppRoutingModule { }
