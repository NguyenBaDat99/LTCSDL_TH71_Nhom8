import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ReadingContentComponent } from './reading-content.component';

describe('ReadingContentComponent', () => {
  let component: ReadingContentComponent;
  let fixture: ComponentFixture<ReadingContentComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ReadingContentComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ReadingContentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
