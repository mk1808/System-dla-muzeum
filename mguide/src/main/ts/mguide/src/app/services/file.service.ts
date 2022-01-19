import { HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { RestService } from './rest.service';
const URL = "api/files";
@Injectable({
  providedIn: 'root'
})
export class FileService {

  constructor(private restService: RestService) { }

  upload(file){
    const formData = new FormData();
    formData.append("file", file);
    return this.restService.postFile(`${URL}/upload`, formData)
  }

  getAllFiles(){
    
  }

  getFile(id):Observable<any>{
      return this.restService.get(`${URL}/${id}`); 
  }

  delete(){
    
  }
}
