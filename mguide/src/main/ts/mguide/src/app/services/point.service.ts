import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { Point } from './api';
import { RestService } from './rest.service';
const URL = "api/points";
@Injectable({
  providedIn: 'root'
})
export class PointService {
  public points: BehaviorSubject<Point[]> = new BehaviorSubject([]);
 
  constructor(private restService: RestService) { }
  
  create(point: Point) {
    return this.restService.post(`${URL}`, point);
  }
  
  getExhibits() {
    this.restService.get(`${URL}`).subscribe(resp => {
      this.points.next(resp);
    })
  }

  update(point: Point) {
    return this.restService.put(`${URL}`, point);
  }
}
