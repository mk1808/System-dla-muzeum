import { Component, OnInit, ViewChild } from '@angular/core';
import { FormBuilder, FormControl, FormGroup } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { Exhibit } from 'src/app/services/api';
import { DictionaryService } from 'src/app/services/dictionary.service';
import { ExhibitService } from 'src/app/services/exhibit.service';
import { FileService } from 'src/app/services/file.service';
import { PointService } from 'src/app/services/point.service';


 const P_TAG = `<p><br></p>`;
 const P_TAG_WITH_CLASS = /<p .*\"><br><\/p>/;
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
  existingFiles:any;
  editorContent="";
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
    private dictionaryService:DictionaryService, private pointService:PointService, private fb:FormBuilder,
    private fileService:FileService) { }
    exhibitForm: FormGroup;
  ngOnInit(): void {
    debugger;
    this.initEmptyForm()
    this.getExhibitId();
    if (this.id) {
      this.initFormWithExisitingValues();
      this.getFile(31);
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
    debugger;
    this.files.push(...event.addedFiles);
    this.upload();
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
      room: {}, 
      description: '',
      photo: '',
      link:'',
      id:null
    });
  }

  initFormWithExisitingValues(){
    this.exhibitService.getById(this.id).subscribe(res=>{
      console.log(res)
      this.exisitingExhibit = res;
     this.exhibitForm =  this.fb.group({
      name: this.exisitingExhibit.name,
      number:  this.exisitingExhibit.number,
      room: null, 
      description: this.exisitingExhibit.description,
      id:this.exisitingExhibit.id,
      link:this.exisitingExhibit.link,
      photo: this.exisitingExhibit.photo
    });

    })

    
  }

  onSubmit(form){
    debugger;
    console.log(form)
    let exhibit:Exhibit = this.exhibitForm.value;
    exhibit.description=this.changeDescription(exhibit.description);
    if(exhibit.id){
      this.update(exhibit)
    }else {
      this.create(exhibit)
    }
    
  }

  onEditorChanged($event){
    console.log(this.exhibitForm.value.description)
  }

  create(exhibit){
    this.exhibitService.create(exhibit).subscribe(resp=>{
      console.log(resp)
      this.router.navigate(['/filters']);
    })
  }
  update(exhibit){
    this.exhibitService.update(exhibit).subscribe(resp=>{
      console.log(resp)
      this.router.navigate(['/filters']);
    })
  }

  upload() {
    this.fileService.upload(this.files[0]).subscribe(resp => {
      this.exhibitForm.value.photo="/api/files/"+resp.extraContent;
      console.log(resp)
    })

  }

  getFile(id) {
    this.fileService.getFile(id).subscribe(resp => {
      this.existingFiles = resp;
    })

  }

  changeDescription(text){


var textSplited= text.split(P_TAG);
var textJoined = textSplited.join("");

var textSplited2= textJoined.split(P_TAG_WITH_CLASS);
var finalText = textSplited2.join("");
return finalText;

}

}

