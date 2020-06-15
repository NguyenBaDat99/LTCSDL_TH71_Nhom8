import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ListeningLevelComponent } from './listening-level.component';

describe('ListeningLevelComponent', () => {
  let component: ListeningLevelComponent;
  let fixture: ComponentFixture<ListeningLevelComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ListeningLevelComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ListeningLevelComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
