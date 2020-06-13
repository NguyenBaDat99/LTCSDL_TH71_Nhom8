import { Component, OnInit, Inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';

import 'jquery';
import 'bootstrap';

import $ from "jquery";

@Component({
  selector: 'app-admin-cauhoi',
  templateUrl: './admin-cauhoi.component.html',
  styleUrls: ['./admin-cauhoi.component.css']
})
export class AdminCauhoiComponent implements OnInit {

  constructor(private http: HttpClient, @Inject('BASE_URL') baseUrl: string) { }

  pagePresent: number;

  dscauhoi: any = {
    data: [],
    totalRecord: 0,
    page: 0,
    size: 7,
    TotalPage: 0
  }

  dsbaitap: any = {
    data: []
  }

  cauhoi: any = {
    maCauHoi: "",
    noiDungCauHoi: "",
    cauTraLoi: "",
    dapAn: "",
    baiTap: "",
    ghiChu: ""
  }

  isEdit: boolean = true;
  isShowNoiDung: boolean = false;

  ngOnInit() {
    $('#searchKeyword').val("");
    this.pagePresent = 1;
    this.searchProduct(this.pagePresent, "");

    this.http.post('https://localhost:44318/api/BaiTap/get-all', null).subscribe(result => {
      this.dsbaitap = result;
    }, error => console.error(error));
  }

  searchProduct(cPage, key) {
    var k = key;
    if ($('#searchKeyword').val() != "") {
      k = $('#searchKeyword').val();
    }

    let x = {
      page: cPage,
      size: 7,
      keyword: $('#searchKeyword').val()
    }

    this.http.post('https://localhost:44318/' + 'api/CauHoi/search-cauhoi', x).subscribe(result => {
      this.dscauhoi = result;
      this.dscauhoi = this.dscauhoi.data;
      this.pagePresent = this.dscauhoi.page;
    }, error => console.error(error));

  }
  searchNext() {
    if (this.dscauhoi.page < this.dscauhoi.totalPage) {
      let nextPage = this.dscauhoi.page + 1;
      this.searchProduct(nextPage, "");
    } else {
      alert("Bạn đang ở trang cuối!");
    }
  }
  searchPrevious() {
    if (this.dscauhoi.page > 1) {
      let nextPage = this.dscauhoi.page - 1;
      this.searchProduct(nextPage, "");
    } else {
      alert("Bạn đang ở trang đầu tiên!");
    }
  }
  searchByKeyWord() {
    // var keyword = nghy;
    var keyword = $('#searchKeyword').val();
    this.searchProduct(1, keyword);
  }

  openModalCreateUpdate(isNew, index) {
    if (isNew) {
      this.isEdit = false;
      this.cauhoi = {
        maDanhMuc: "",
        tenDanhMuc: "",
        capBac: "",
        moTa: "",
        ghiChu: ""
      }
    }
    else {
      this.isEdit = true;
      this.cauhoi = index;
    }
    $('#modalCreateUpdate').modal("show");
  }

  openModalRemove(index) {
    this.cauhoi = index;
    $('#modalRemove').modal("show");
  }

  openModalNoiDungCH(index){
    this.cauhoi = index;
    $('#modalNoiDungCH').modal("show");
  }

  changeShowNoiDung(){
    if(this.isShowNoiDung){
      this.isShowNoiDung = false;
    }else{
      this.isShowNoiDung = true;
    }
  }

  createCauHoi() {
    var x = this.cauhoi;
    this.http.post('https://localhost:44318/' + 'api/CauHoi/create-cauhoi', x).subscribe(result => {
      var res: any = result;
      if (res.success) {
        this.isEdit = true;
        this.searchProduct(this.pagePresent, "");   
      }
    }, error => console.error(error));
    $('#modalCreateUpdate').modal('hide')
  }
  updateCauHoi() {
    var x = this.cauhoi;
    this.http.post('https://localhost:44318/' + 'api/CauHoi/update-cauhoi', x).subscribe(result => {
      var res: any = result;
      if (res.success) {
        this.isEdit = true;
        this.searchProduct(this.pagePresent, "");
      }
    }, error => console.error(error));
    $('#modalCreateUpdate').modal('hide')
  }

  removeCauHoi(index) {
    var para: any = {
      id: 0,
      keyword: index.maCauHoi
    }
    this.http.post('https://localhost:44318/' + 'api/CauHoi/remove-cauhoi', para).subscribe(result => {
      var res: any = result;
      if (res.success) {
        this.searchProduct(this.pagePresent, "");
      }
    }, error => console.error(error));
    $('#modalRemove').modal('hide')
  }

}
