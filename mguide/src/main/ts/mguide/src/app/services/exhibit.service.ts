import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { Exhibit } from './api';
import { RestService } from './rest.service';
const URL = "api/exhibits";
@Injectable({
  providedIn: 'root'
})
export class ExhibitService {
  public exhibits: BehaviorSubject<Exhibit[]> = new BehaviorSubject([]);
  public filteredExhibits: BehaviorSubject<Exhibit[]> = new BehaviorSubject([]);
  public filteredExhibitsConnections: BehaviorSubject<Exhibit[]> = new BehaviorSubject([]);

  constructor(private restService: RestService) {

  }

  getById(id: String): Observable<any> {
    return this.restService.get(`${URL}/${id}`);
  }

  getExhibitsByNameAndNumber(name: String, number:String) {
    let empty: String = "";
    this.restService.get(`${URL}?name=${name || empty}&number=${number || empty}`).subscribe(resp => {
      this.filteredExhibits.next(resp);
    })
  }

  getExhibitsByNameAndConnection(name: String, connected: boolean, disconnected: boolean) {
    let empty: String = "";
    this.restService.get(`${URL}/withConnections?name=${name || empty}&connected=${connected}&disconnected=${disconnected}`).subscribe(resp => {
      this.filteredExhibitsConnections.next(resp);
    })
  }

  deleteById(id: String): Observable<any> {
    return this.restService.delete(`${URL}/${id}`);
  }

  create(exhibit: Exhibit) {
    return this.restService.post(`${URL}`, exhibit);
  }

  update(exhibit: Exhibit) {
    return this.restService.put(`${URL}`, exhibit);
  }

  getExhibits() {
    this.restService.get(`${URL}/5`).subscribe(resp => {
      this.exhibits.next([resp]);
    })
  }
}
