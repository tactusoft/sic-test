
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { EncuestaListComponent } from './list-encuesta/encuesta-list.component';
import { LoginComponent } from './login/login.component';
import { CreateEncuestaComponent } from './create-encuesta/create-encuesta.component';

const routes: Routes = [
  { path: '', redirectTo: 'login', pathMatch: 'full' },
  { path: 'login', component: LoginComponent },
  { path: 'list', component: EncuestaListComponent },
  { path: 'add', component: CreateEncuestaComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
