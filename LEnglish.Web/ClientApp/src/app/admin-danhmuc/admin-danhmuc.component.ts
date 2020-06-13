import { Component, OnInit, Inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';

import 'jquery';
import 'bootstrap';

import $ from "jquery";

@Component({
  selector: 'app-admin-danhmuc',
  templateUrl: './admin-danhmuc.component.html',
  styleUrls: ['./admin-danhmuc.component.css']
})
export class AdminDanhmucComponent implements OnInit {

  constructor(private http: HttpClient, @Inject('BASE_URL') baseUrl: string) { }

  pagePresent: number;

  dsdanhmuc: any = {
    data: [],
    totalRecord: 0,
    page: 0,
    size: 5,
    TotalPage: 0
  }

  dscapbac: any = {
    data: []
  }

  danhmuc: any = {
    maDanhMuc: "",
    tenDanhMuc: "",
    capBac: "",
    moTa: "",
    ghiChu: ""
  }

  isEdit: boolean = true;

  ngOnInit() {
    $('#searchKeyword').val("");
    this.pagePresent = 1;
    this.searchProduct(this.pagePresent, "");

    this.http.post('https://localhost:44318/api/CapBac/get-all', null).subscribe(result => {
      this.dscapbac = result;
    }, error => console.error(error));
  }

  searchProduct(cPage, key) {
    var k = key;
    if ($('#searchKeyword').val() != "") {
      k = $('#searchKeyword').val();
    }

    let x = {
      page: cPage,
      size: 5,
      keyword: $('#searchKeyword').val()
    }

    this.http.post('https://localhost:44318/' + 'api/DanhMuc/search-danhmuc', x).subscribe(result => {
      this.dsdanhmuc = result;
      this.dsdanhmuc = this.dsdanhmuc.data;
      this.pagePresent = this.dsdanhmuc.page;
    }, error => console.error(error));

  }
  searchNext() {
    if (this.dsdanhmuc.page < this.dsdanhmuc.totalPage) {
      let nextPage = this.dsdanhmuc.page + 1;
      this.searchProduct(nextPage, "");
    } else {
      alert("Bạn đang ở trang cuối!");
    }
  }
  searchPrevious() {
    if (this.dsdanhmuc.page > 1) {
      let nextPage = this.dsdanhmuc.page - 1;
      this.searchProduct(nextPage, "");
    } else {
      alert("Bạn đang ở trang đầu tiên!");
    }
  }
  searchByKeyWord() {
    var keyword = $('#searchKeyword').val();
    this.searchProduct(1, keyword);
  }

  openModalCreateUpdate(isNew, index) {
    if (isNew) {
      this.isEdit = false;
      this.danhmuc = {
        maDanhMuc: "",
        tenDanhMuc: "",
        capBac: "",
        moTa: "",
        ghiChu: ""
      }
    }
    else {
      this.isEdit = true;
      this.danhmuc = index;
    }
    $('#modalCreateUpdate').modal("show");
  }

  openModalRemove(index) {
    this.danhmuc = index;
    $('#modalRemove').modal("show");
  }

  createDanhMuc() {
    var x = this.danhmuc;
    this.http.post('https://localhost:44318/' + 'api/DanhMuc/create-danhmuc', x).subscribe(result => {
      var res: any = result;
      if (res.success) {
        this.isEdit = true;
        this.searchProduct(this.pagePresent, ""); 
      }
    }, error => console.error(error));
    $('#modalCreateUpdate').modal('hide')
  }
  updateDanhMuc() {
    var x = this.danhmuc;
    this.http.post('https://localhost:44318/' + 'api/DanhMuc/update-danhmuc', x).subscribe(result => {
      var res: any = result;
      if (res.success) {
        this.isEdit = true;
        this.searchProduct(this.pagePresent, "");
      }
    }, error => console.error(error));
    $('#modalCreateUpdate').modal('hide')
  }

  removeDanhMuc(index) {
    var para: any = {
      id: 0,
      keyword: index.maDanhMuc
    }
    this.http.post('https://localhost:44318/' + 'api/DanhMuc/remove-danhmuc', para).subscribe(result => {
      var res: any = result;
      if (res.success) {
        this.searchProduct(this.pagePresent, "");
      }
    }, error => console.error(error));
    $('#modalRemove').modal('hide')
  }

}
