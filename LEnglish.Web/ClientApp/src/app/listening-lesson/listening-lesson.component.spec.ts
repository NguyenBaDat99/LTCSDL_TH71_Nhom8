import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ListeningLessonComponent } from './listening-lesson.component';

describe('ListeningLessonComponent', () => {
  let component: ListeningLessonComponent;
  let fixture: ComponentFixture<ListeningLessonComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ListeningLessonComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ListeningLessonComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
