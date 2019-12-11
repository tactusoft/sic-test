import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class MarcaPCService {

  private baseUrl = 'http://localhost:8080/backend/api/v1/marcapc';

  constructor(private http: HttpClient) { }

  getTodosList(): Observable<any> {
    return this.http.get(`${this.baseUrl}`);
  }
}
