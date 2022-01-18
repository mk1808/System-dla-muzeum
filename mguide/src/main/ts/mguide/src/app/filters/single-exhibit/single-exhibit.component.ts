import { Component, OnInit, ViewChild } from '@angular/core';
import { FormBuilder, FormControl, FormGroup } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { Exhibit } from 'src/app/services/api';
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
  htmlContent="";
  id;
  exisitingExhibit:Exhibit;
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

  constructor(private route: ActivatedRoute, private router: Router, private exhibitService:ExhibitService,
    private dictionaryService:DictionaryService, private pointService:PointService, private fb:FormBuilder) { }
    exhibitForm: FormGroup;
  ngOnInit(): void {
    debugger;
    this.initEmptyForm()
    this.getExhibitId();
    if (this.id) {
      this.initFormWithExisitingValues();
    }
  }
  activateRTL(editor) {
    editor.format('align', 'left')
    editor.format('direction', 'ltr')
  }
  
  onCancelClick(){
    this.router.navigate(['/filters']);
  }
  onSaveClick(){
    
  }

  onSelect(event) {
    console.log(event);
    this.files.push(...event.addedFiles);
  }
  
  onRemove(event) {
    console.log(event);
    this.files.splice(this.files.indexOf(event), 1);
  }

  getExhibitId() {
    this.id = this.route.snapshot.paramMap.get('id');
    console.log(this.id)
  }

  initEmptyForm(){
    this.exhibitForm = this.fb.group({
      name: '',
      number: '',
      room: '', 
      description: '',
      photo: ''
    });
  }

  initFormWithExisitingValues(){
    this.exhibitService.getById(this.id).subscribe(res=>{
      console.log(res)
      this.exisitingExhibit = res;
     this.exhibitForm =  this.fb.group({
      name: this.exisitingExhibit.name,
      number:  this.exisitingExhibit.number,
      room: '', 
      description: '',
      photo: ''
    });

    })

    
  }

  onSubmit(form){
    debugger;
    console.log(form)
    let exhibit:Exhibit = this.createExhibit();
    this.exhibitService.create(exhibit).subscribe(resp=>{
      console.log(resp)
      this.router.navigate(['/filters']);
    })
    
  }

  createExhibit(){
    let exhibit:Exhibit = {
      id: 0,
      name: '',
      number: '',
      description: '',
      room: undefined,
      photo: ''
    };
    exhibit.name = this.exhibitForm.value.name;
    exhibit.description = this.exhibitForm.value.description;
    exhibit.number = this.exhibitForm.value.number;
    exhibit.room = this.exhibitForm.value.room||{};
    exhibit.photo = this.exhibitForm.value.photo;
    return exhibit;

  }


}

