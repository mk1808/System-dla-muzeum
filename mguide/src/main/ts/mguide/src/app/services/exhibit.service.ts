import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { RestService } from './rest.service';
const url="api/exhibits";
@Injectable({
  providedIn: 'root'
})
export class ExhibitService {
public exhibits:BehaviorSubject<any[]> = new BehaviorSubject([]);
  constructor(private restService:RestService) { 
  
  }


  getById(id:String):Observable<any>{
    return this.restService.get(`${url}/${id}`);
  }

  getExhibits(){
    this.restService.get(`${url}/2`).subscribe(resp =>{
 
      this.exhibits.next([resp]);
    })
  }
}
