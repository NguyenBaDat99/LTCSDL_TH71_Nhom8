import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { FrameTranslateComponent } from './frame-translate.component';

describe('FrameTranslateComponent', () => {
  let component: FrameTranslateComponent;
  let fixture: ComponentFixture<FrameTranslateComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ FrameTranslateComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(FrameTranslateComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
