import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AdminDanhmucComponent } from './admin-danhmuc.component';

describe('AdminDanhmucComponent', () => {
  let component: AdminDanhmucComponent;
  let fixture: ComponentFixture<AdminDanhmucComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AdminDanhmucComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AdminDanhmucComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
