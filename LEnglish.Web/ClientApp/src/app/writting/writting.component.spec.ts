import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { WrittingComponent } from './writting.component';

describe('WrittingComponent', () => {
  let component: WrittingComponent;
  let fixture: ComponentFixture<WrittingComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ WrittingComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(WrittingComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
