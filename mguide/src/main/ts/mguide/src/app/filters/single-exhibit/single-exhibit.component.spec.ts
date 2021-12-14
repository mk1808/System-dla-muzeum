import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SingleExhibitComponent } from './single-exhibit.component';

describe('SingleExhibitComponent', () => {
  let component: SingleExhibitComponent;
  let fixture: ComponentFixture<SingleExhibitComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SingleExhibitComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(SingleExhibitComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
