import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { Room } from './api';
import { RestService } from './rest.service';
const URL = "api/dictionaries";
@Injectable({
  providedIn: 'root'
})
export class DictionaryService {
  public rooms: BehaviorSubject<Room[]> = new BehaviorSubject([]);

  constructor(private restService: RestService) { }

  getRooms() {
    this.restService.get(`${URL}/rooms`).subscribe(resp => {
      this.rooms.next(resp);
    })
  }

  create(room: Room) {
    return this.restService.post(`${URL}/rooms`, room);
  }
}
