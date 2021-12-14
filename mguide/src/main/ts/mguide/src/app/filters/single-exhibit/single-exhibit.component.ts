import { Component, OnInit } from '@angular/core';


@Component({
  selector: 'app-single-exhibit',
  templateUrl: './single-exhibit.component.html',
  styleUrls: ['./single-exhibit.component.scss']
})
export class SingleExhibitComponent implements OnInit {
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
    editor.format('align', 'right')
    editor.format('direction', 'rtl')
  }

}

