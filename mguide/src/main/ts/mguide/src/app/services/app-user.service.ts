import { Injectable } from '@angular/core';
import { AppUser, Login } from './api';
import { RestService } from './rest.service';

const URL = "api/users";
@Injectable({
  providedIn: 'root'
})
export class AppUserService {

  constructor(private restService: RestService) { }

  login(login: Login) {
    return this.restService.post(`${URL}/login`, login);
  }

  register(user: AppUser) {
    return this.restService.post(`${URL}/register`, user);
  }
}
