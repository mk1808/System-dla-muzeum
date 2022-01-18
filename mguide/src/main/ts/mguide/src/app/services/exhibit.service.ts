import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { Exhibit } from './api';
import { RestService } from './rest.service';
const url="api/exhibits";
@Injectable({
  providedIn: 'root'
})
export class ExhibitService {
public exhibits:BehaviorSubject<Exhibit[]> = new BehaviorSubject([]);
public filteredExhibits:BehaviorSubject<Exhibit[]> = new BehaviorSubject([]);
public filteredExhibitsConnections:BehaviorSubject<Exhibit[]> = new BehaviorSubject([]);

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

  getExhibitsByName(name:String){
    let empty:String="";
    this.restService.get(`${url}?name=${name||empty}`).subscribe(resp =>{
      this.filteredExhibits.next(resp);
    })
  }

  getExhibitsByNameAndConnection(name:String, connected:boolean, disconnected:boolean){
    let empty:String="";
    this.restService.get(`${url}/withConnections?name=${name||empty}&connected=${connected}&disconnected=${disconnected}`).subscribe(resp =>{
      this.filteredExhibitsConnections.next(resp);
    })
  }

  deleteById(id:String):Observable<any>{
    return this.restService.delete(`${url}/${id}`);
  }

  create(exhibit:Exhibit){
    return this.restService.post(`${url}`, exhibit);
  }

  update(exhibit:Exhibit){
    return this.restService.put(`${url}`, exhibit);
  }
}
