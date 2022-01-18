import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { BehaviorSubject } from 'rxjs';
import { Exhibit } from '../services/api';
import { ExhibitService } from '../services/exhibit.service';

@Component({
  selector: 'app-filters',
  templateUrl: './filters.component.html',
  styleUrls: ['./filters.component.scss']
})
export class FiltersComponent implements OnInit {
  exhibits: BehaviorSubject<any[]>;
  exhibitsNew: BehaviorSubject<Exhibit[]>;
  searchFrom: FormGroup;
  constructor(private route: ActivatedRoute, private router: Router, private exhibitService: ExhibitService) { }

  ngOnInit(): void {
    this.initForm();
    this.exhibitService.getExhibitsByNameAndNumber("","");
    this.exhibits = this.exhibitService.filteredExhibits;
    this.exhibits.getValue();
    this.exhibits.subscribe(res => {
    })

  


  }

  initForm(){
    this.searchFrom = new FormGroup({
      name: new FormControl(''),
      number: new FormControl('')
    });
  }

  onSubmit(form){
    console.log(form)
    this.exhibitService.getExhibitsByNameAndNumber(form.value.name,form.value.number);
    this.exhibits = this.exhibitService.filteredExhibits;
    this.exhibits.subscribe(res => {
      console.log(res)
    })
  }

}
