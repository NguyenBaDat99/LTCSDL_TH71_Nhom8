import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AdminCauhoiComponent } from './admin-cauhoi.component';

describe('AdminCauhoiComponent', () => {
  let component: AdminCauhoiComponent;
  let fixture: ComponentFixture<AdminCauhoiComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AdminCauhoiComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AdminCauhoiComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
