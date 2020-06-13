import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AdminCapbacComponent } from './admin-capbac.component';

describe('AdminCapbacComponent', () => {
  let component: AdminCapbacComponent;
  let fixture: ComponentFixture<AdminCapbacComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AdminCapbacComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AdminCapbacComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
