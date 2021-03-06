import { Component, OnInit, Inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';

import 'jquery';
import 'bootstrap';

import $ from "jquery";

@Component({
  selector: 'app-admin-baitap',
  templateUrl: './admin-baitap.component.html',
  styleUrls: ['./admin-baitap.component.css']
})
export class AdminBaitapComponent implements OnInit {

  constructor(private http: HttpClient, @Inject('BASE_URL') baseUrl: string) { }

  listBaiTap: [];
  pagePresent: number;

  dsbaitap: any = {
    data: [],
    totalRecord: 0,
    page: 0,
    size: 5,
    TotalPage: 0
  }

  dsdanhmuc: any = {
    data: []
  }

  baitap: any = {
    maBaiTap: "D-ILS7-2",
    tenBaiTap: "Bài đọc 2 ILS7",
    noiDung: "",
    danhMuc: "D-ILS7",
    moTa: "",
    ghiChu: ""
  }

  isEdit: boolean = true;

  ngOnInit() {
    $('#searchKeyword').val("");
    this.pagePresent = 1;
    this.searchProduct(this.pagePresent, "");

    this.http.post('https://localhost:44318/api/DanhMuc/get-all', null).subscribe(result => {
      this.dsdanhmuc = result;
    }, error => console.error(error));
  }

  searchProduct(cPage, key) {
    var k = key;
    if($('#searchKeyword').val() != ""){
      k = $('#searchKeyword').val();
    }
    
    let x = {
      page: cPage,
      size: 5,
      keyword: $('#searchKeyword').val()
    }

    this.http.post('https://localhost:44318/' + 'api/BaiTap/search-baiTap', x).subscribe(result => {
      this.dsbaitap = result;
      this.dsbaitap = this.dsbaitap.data;
      this.pagePresent = this.dsbaitap.page;
    }, error => console.error(error));

  }
  searchNext() {
    if (this.dsbaitap.page < this.dsbaitap.totalPage) {
      let nextPage = this.dsbaitap.page + 1;
      this.searchProduct(nextPage, "");
    } else {
      alert("Bạn đang ở trang cuối!");
    }
  }
  searchPrevious() {
    if (this.dsbaitap.page > 1) {
      let nextPage = this.dsbaitap.page - 1;
      this.searchProduct(nextPage, "");
    } else {
      alert("Bạn đang ở trang đầu tiên!");
    }
  }
  searchByKeyWord(){
    // var keyword = nghy;
    var keyword = $('#searchKeyword').val();
    this.searchProduct(1, keyword);
  }

  openModalCreateUpdate(isNew, index) {
    if (isNew) {
      this.isEdit = false;
      this.baitap = {
        maBaiTap: "",
        tenBaiTap: "",
        noiDung: "",
        danhMuc: "",
        moTa: "",
        ghiChu: ""
      }
    }
    else {
      this.isEdit = true;
      this.baitap = index;
    }
    $('#modalCreateUpdate').modal("show");
  }

  openModalRemove(index) {
    this.baitap = index;
    $('#modalRemove').modal("show");
  }
  openModalNoiDungBT(index) {
    this.baitap = index;
    $('#modalNoiDungBT').modal("show");
  }

  createBaiTap() {
    var x = this.baitap;
    this.http.post('https://localhost:44318/' + 'api/BaiTap/create-baiTap', x).subscribe(result => {
      var res: any = result;
      if (res.success) {
        // this.baitap = res.data;
        this.isEdit = true;
        this.searchProduct(this.pagePresent, "");
        // alert("Thêm bài tập mới thành công!");        
      }
    }, error => console.error(error));
    $('#modalCreateUpdate').modal('hide')
  }
  updateBaitap() {
    var x = this.baitap;
    this.http.post('https://localhost:44318/' + 'api/BaiTap/update-baiTap', x).subscribe(result => {
      var res: any = result;
      if (res.success) {
        // this.dsbaitap = res.data;
        this.isEdit = true;
        this.searchProduct(this.pagePresent, "");
        // alert("Sửa bài tập thành công!");
      }
    }, error => console.error(error));
    $('#modalCreateUpdate').modal('hide')
  }
  removeBaiTap(index) {
    var para: any = {
      id: 0,
      keyword: index.maBaiTap
    }
    this.http.post('https://localhost:44318/' + 'api/BaiTap/remove-baiTap', para).subscribe(result => {
      var res: any = result;
      if (res.success) {
        // alert("Xóa bài tập thành công!");
        this.searchProduct(this.pagePresent, "");
      }
    }, error => console.error(error));
    $('#modalRemove').modal('hide')
  }

}
