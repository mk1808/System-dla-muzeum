import { Component, OnInit, ViewChild } from '@angular/core';



@Component({
  selector: 'app-single-exhibit',
  templateUrl: './single-exhibit.component.html',
  styleUrls: ['./single-exhibit.component.scss']
})
export class SingleExhibitComponent implements OnInit {

  files: File[] = [];

  onSelect(event) {
    console.log(event);
    this.files.push(...event.addedFiles);
  }
  
  onRemove(event) {
    console.log(event);
    this.files.splice(this.files.indexOf(event), 1);
  }

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
  constructor() { }

  ngOnInit(): void {
  }
  activateRTL(editor) {
    editor.format('align', 'left')
    editor.format('direction', 'ltr')
  }
  

}

