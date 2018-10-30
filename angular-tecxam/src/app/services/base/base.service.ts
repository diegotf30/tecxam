import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../../environments/environment';
// import { ServerResponse, CoursesResponse } from '../../interfaces/server-response';

@Injectable({
  providedIn: 'root'
})
export class BaseService {

  constructor(private _http: HttpClient) { }

  get(url: string) {
    // return this._http.get<ServerResponse>(environment.apiEndpoint + url);
    return this._http.get(environment.apiEndpoint + url);
  }

  post(url: string, body: any) {
    // return this._http.post<ServerResponse>(environment.apiEndpoint + url, body);
    return this._http.post(environment.apiEndpoint + url, body);
  }

  // put(url: string, body: any) {
  //   const token = this.tokenExtractor.getToken() as string;
  //   if (token) {
  //     // This is because the request needs the X-CSRFToken header, and it needs to be added manually
  //     const headers = new HttpHeaders(
  //       {
  //         'X-CSRFToken': token,
  //       }
  //     );
  //
  //     return this._http.put<ServerResponse>(environment.apiEndpoint + url, body, { withCredentials: true, headers: headers });
  //   }
  //   return this._http.put<ServerResponse>(environment.apiEndpoint + url, body, { withCredentials: true });
  // }
  //
  // delete(url: string, body: any) {
  //   const token = this.tokenExtractor.getToken() as string;
  //   const httpOptions = {
  //     withCredentials: true,
  //     body: body,
  //     headers: null
  //   };
  //   if (token) {
  //     // This is because the request needs the X-CSRFToken header, and it needs to be added manually
  //     const headers = new HttpHeaders(
  //       {
  //         'X-CSRFToken': token,
  //       }
  //     );
  //     httpOptions.headers = headers;
  //     return this._http.delete(environment.apiEndpoint + url, httpOptions);
  //   }
  //   return this._http.delete(environment.apiEndpoint + url, httpOptions);
  // }
}