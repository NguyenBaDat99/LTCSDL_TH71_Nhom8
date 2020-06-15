import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ListeningContentComponent } from './listening-content.component';

describe('ListeningContentComponent', () => {
  let component: ListeningContentComponent;
  let fixture: ComponentFixture<ListeningContentComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ListeningContentComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ListeningContentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
