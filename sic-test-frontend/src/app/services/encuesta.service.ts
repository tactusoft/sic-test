import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class EncuestaService {

  private baseUrl = 'http://localhost:8080/backend/api/v1/encuesta';

  constructor(private http: HttpClient) { }

  getEncuesta(id: number): Observable<any> {
    return this.http.get(`${this.baseUrl}/${id}`);
  }

  createEncuesta(employee: Object): Observable<Object> {
    return this.http.post(`${this.baseUrl}`, employee);
  }

  deleteEncuesta(id: number): Observable<any> {
    return this.http.delete(`${this.baseUrl}/${id}`, { responseType: 'text' });
  }

  getEncuestaList(): Observable<any> {
    return this.http.get(`${this.baseUrl}`);
  }
}
