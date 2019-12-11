import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  email: string;
  password: string;
  messages: string;

  constructor(private router: Router) { }

  ngOnInit() { }

  login() {
    this.messages = null;
    if (this.validateEmail()) {
      if (this.email === 'test@test.com' && this.password === 'test') {
        this.router.navigate(['/add']);
      } else {
        this.messages = 'Correo o usuario invalido!';
      }
    }
  }

  validateEmail(): boolean {
    if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(this.email)) {
      return true;
    } else {
      this.messages = 'Correo Inválido';
      return false;
    }
  }
}
