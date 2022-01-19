import { HttpClient, HttpErrorResponse, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { catchError } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class RestService {
  constructor(private http: HttpClient) { }

  public get<T>(url: string) {
    return this.http.get<T>(url).pipe(
      catchError(this.handleError)
    );
  }

  public delete<T>(url: string) {
    return this.http.delete<T>(url).pipe(
      catchError(this.handleError)
    );
  }

  public post(url: string, body) {
    return this.http.post(url, body).pipe(
      catchError(this.handleError)
    );
  }

  public postFile(url: string, body) {
    let httpOptions = {
      headers: new HttpHeaders({
      // "Content-Type": "multipart/form-data" 
      })
    };
    return this.http.post(url, body, httpOptions).pipe(
      catchError(this.handleError)
    );
  }

  public put(url: string, body) {
    return this.http.put(url, body).pipe(
      catchError(this.handleError)
    );
  }

  private handleError(error: HttpErrorResponse) {
    console.log("Error: ", error)
    return [];
  }
}
