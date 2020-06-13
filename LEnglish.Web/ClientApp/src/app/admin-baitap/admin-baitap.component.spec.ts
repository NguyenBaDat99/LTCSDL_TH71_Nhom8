import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AdminBaitapComponent } from './admin-baitap.component';

describe('AdminBaitapComponent', () => {
  let component: AdminBaitapComponent;
  let fixture: ComponentFixture<AdminBaitapComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AdminBaitapComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AdminBaitapComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
