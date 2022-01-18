import { Component, OnInit, ViewChild } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { DictionaryService } from 'src/app/services/dictionary.service';
import { ExhibitService } from 'src/app/services/exhibit.service';
import { PointService } from 'src/app/services/point.service';



@Component({
  selector: 'app-single-exhibit',
  templateUrl: './single-exhibit.component.html',
  styleUrls: ['./single-exhibit.component.scss']
})
export class SingleExhibitComponent implements OnInit {

  files: File[] = [];

  modules = {
    toolbar: [
      ['bold', 'italic', 'underline'],//, 'strike'],        
      ['blockquote'],
      [{ 'header': 1 }, { 'header': 2 }],
      //    [{ 'list': 'ordered'}, { 'list': 'bullet' }],
      //   [{ 'header': [1, 2, 3, 4, 5, 6, false] }],
      [{ 'color': [] }],
      //, { 'background': [] }],          
      //   [{ 'font': [] }],
      [{ 'align': [] }],
      ['link', 'image', 'video']
    ]
  };
htmlContent="";
  constructor(private route: ActivatedRoute, private router: Router, private exhibitService:ExhibitService,
    private dictionaryService:DictionaryService, private pointService:PointService) { }

  ngOnInit(): void {
    this.exhibitService.getById("1").subscribe(res=>{
      console.log(res)
    })
  }
  activateRTL(editor) {
    editor.format('align', 'left')
    editor.format('direction', 'ltr')
  }
  
  onCancelClick(){
    this.router.navigate(['/filters']);
  }
  onSaveClick(){
    this.router.navigate(['/filters']);
  }

  onSelect(event) {
    console.log(event);
    this.files.push(...event.addedFiles);
  }
  
  onRemove(event) {
    console.log(event);
    this.files.splice(this.files.indexOf(event), 1);
  }

}

