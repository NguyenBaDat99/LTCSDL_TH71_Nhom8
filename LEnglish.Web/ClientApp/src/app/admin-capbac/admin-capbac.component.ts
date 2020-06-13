import { Component, OnInit, Inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';

import 'jquery';
import 'bootstrap';

import $ from "jquery";

@Component({
  selector: 'app-admin-capbac',
  templateUrl: './admin-capbac.component.html',
  styleUrls: ['./admin-capbac.component.css']
})
export class AdminCapbacComponent implements OnInit {

  constructor(private http: HttpClient, @Inject('BASE_URL') baseUrl: string) { }

  pagePresent: number;

  dscapbac: any = {
    data: [],
    totalRecord: 0,
    page: 0,
    size: 5,
    TotalPage: 0
  }

  capbac: any = {
    maCapBac: "",
    tenCapBac: "",
    moTa: "",
    ghiChu: ""
  }

  isEdit: boolean = true;

  ngOnInit() {
    $('#searchKeyword').val("");
    this.pagePresent = 1;
    this.searchProduct(this.pagePresent, "");
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

    this.http.post('https://localhost:44318/' + 'api/CapBac/search-capbac', x).subscribe(result => {
      this.dscapbac = result;
      this.dscapbac = this.dscapbac.data;
      this.pagePresent = this.dscapbac.page;
    }, error => console.error(error));

  }
  searchNext() {
    if (this.dscapbac.page < this.dscapbac.totalPage) {
      let nextPage = this.dscapbac.page + 1;
      this.searchProduct(nextPage, "");
    } else {
      alert("Bạn đang ở trang cuối!");
    }
  }
  searchPrevious() {
    if (this.dscapbac.page > 1) {
      let nextPage = this.dscapbac.page - 1;
      this.searchProduct(nextPage, "");
    } else {
      alert("Bạn đang ở trang đầu tiên!");
    }
  }
  searchByKeyWord(){
    var keyword = $('#searchKeyword').val();
    this.searchProduct(1, keyword);
  }

  openModalCreateUpdate(isNew, index) {
    if (isNew) {
      this.isEdit = false;
      this.capbac = {
        maCapBac: "",
        tenCapBac: "",
        moTa: "",
        ghiChu: ""
      }
    }
    else {
      this.isEdit = true;
      this.capbac = index;
    }
    $('#modalCreateUpdate').modal("show");
  }

  openModalRemove(index) {
    this.capbac = index;
    $('#modalRemove').modal("show");
  }

  createCapbac() {
    var x = this.capbac;
    this.http.post('https://localhost:44318/' + 'api/CapBac/create-capbac', x).subscribe(result => {
      var res: any = result;
      if (res.success) {
        this.isEdit = true;
        this.searchProduct(this.pagePresent, "");
      }
    }, error => console.error(error));
    $('#modalCreateUpdate').modal('hide')
  }
  updateCapbac() {
    var x = this.capbac;
    this.http.post('https://localhost:44318/' + 'api/CapBac/update-capbac', x).subscribe(result => {
      var res: any = result;
      if (res.success) {
        this.isEdit = true;
        this.searchProduct(this.pagePresent, "");
      }
    }, error => console.error(error));
    $('#modalCreateUpdate').modal('hide')
  }

  removeCapBac(index) {
    var para: any = {
      id: 0,
      keyword: index.maCapBac
    }
    this.http.post('https://localhost:44318/' + 'api/CapBac/remove-capBac', para).subscribe(result => {
      var res: any = result;
      if (res.success) {
        this.searchProduct(this.pagePresent, "");
      }
    }, error => console.error(error));
    $('#modalRemove').modal('hide')
  }

}
