import { Component, OnInit, Inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { CookieService } from 'ngx-cookie-service';
import 'bootstrap';
import 'jquery';
import * as bcrypt from 'bcryptjs';

import $ from "jquery";
// declare var $:any;
// declare var require: any;

@Component({
  selector: 'app-nav-menu',
  templateUrl: './nav-menu.component.html',
  styleUrls: ['./nav-menu.component.css']
})
export class NavMenuComponent  implements OnInit{
  ngOnInit(){
    if(this.cookieService.get('isLogged')){
      this.isLoged = true;
    }
    else{
      this.isLoged = false;
    }

    this.http.post('https://localhost:44318/' + 'api/NguoiDung/get-all', null).subscribe(result => {
      var res: any = result;
      this.dsNguoiDung.data = res.data;
      console.log(this.dsNguoiDung.data);
    }, error => console.error(error));

  }

  dsNguoiDung:any={
    data:[]
  };

  
  isLoged: boolean = false; 
  errorMessage: string = "";
  
  constructor(private http: HttpClient, @Inject('BASE_URL') baseUrl: string, private cookieService: CookieService) {
    // http.post('https://localhost:44318/' + 'api/NguoiDung/get-all', null).subscribe(result => {
    //   var res: any = result;
    //   this.dsNguoiDung.data = res.data;
    //   console.log(this.dsNguoiDung.data);
    // }, error => console.error(error));
  }

  login(){  
    var tenDN = $('#tenDangNhap').val();
    // var tenDN = document.getElementById("tenDangNhap").value;
    var matKhau = $('#matKhau').val();
    // var matKhau = document.getElementById("matKhau").value;
    this.dsNguoiDung.data.forEach(nguoiDung => {
      if(nguoiDung.tenDangNhap == tenDN){
        bcrypt.compare(matKhau, nguoiDung.matKhau).then((result)=>{
          if(result){
            this.cookieService.set('maNguoiDung', nguoiDung.maNguoiDung);
            this.cookieService.set('tenDangNhap', nguoiDung.tenDangNhap);
            this.cookieService.set('tenNguoiDung', nguoiDung.tenNguoiDung);
            this.cookieService.set('isLogged', 'true');
            this.isLoged = true;
            // alert("Đăng nhập thành công!");
            $('#modalSignIn').modal('hide');
            this.errorMessage = "";
            // location.reload();
            
            return;
          }          
        });
        this.isLoged = false;
        // alert("Đăng nhập thất bại!");        
        return;
      }
      this.errorMessage = "Sai tên đăng nhập hoặc mật khẩu!";
    });
  }

  logout(){
    this.cookieService.deleteAll();
    this.isLoged = false;
    // location.reload();
  }

  setEmptyErrorMsg(){
    this.errorMessage = "";
  }

  signUp(){
    this.errorMessage = "";
    var maNguoiDung = 1;
    var tenDangNhap = $('#tenDangNhapSignUp').val();
    var matKhau = $('#matKhauSignUp').val();
    var xacNhanMatKhau = $('#xacNhanMatKhauSignUp').val();
    var tenNguoiDung = $('#tenNguoiDungSignUp').val();
    var email = $('#emailSignUp').val();    
    var ngaySinh = $('#ngaySinhSignUp').val();    
    var gioiTinh = null;

    if(matKhau != xacNhanMatKhau){
      this.errorMessage = "Mật khẩu xác nhận không chính xác!";
      return;
    }

    this.dsNguoiDung.data.forEach(nguoidung => {
      if(tenDangNhap == nguoidung.tenDangNhap){
        this.errorMessage = "Tên đăng nhập đã tồn tại!";
        return;
      }

      if(maNguoiDung == nguoidung.maNguoiDung){
        maNguoiDung++;
      }
    });

    
    if(tenDangNhap == ""){
      this.errorMessage = "Thiếu thông tin Tên đăng nhập!";
      return;
    }
    if(tenNguoiDung == ""){
      this.errorMessage = "Thiếu thông tin Tên người dùng!";
      return;
    }
    if(matKhau == ""){
      this.errorMessage = "Thiếu thông tin Mật khẩu";
      return;
    }

    // var bcrypt = require('bcrypt');
    const saltRounds = 10;
    var matKhauDaBam = bcrypt.hashSync(matKhau, saltRounds);
    // console.log(matKhauDaBam);

    if($('#male').checked){
      gioiTinh = "Nam";
    }else if($('#female').checked){
      gioiTinh = "Nữ";
    }else{
      gioiTinh = "Khác";
    }

    var nguoidung: any ={
      maNguoiDung: maNguoiDung,
      tenDangNhap: tenDangNhap,
      matKhau: matKhauDaBam,
      tenNguoiDung: tenNguoiDung,
      gioiTinh: gioiTinh,
      ngaySinh: ngaySinh,
      email: email
    }

    if(this.errorMessage == ""){
      this.http.post('https://localhost:44318/' + 'api/NguoiDung/create-NguoiDung', nguoidung).subscribe(result => {
        var res: any = result;
        alert("Tạo tài khoản thành công!");
        // $('#modalSignUp').modal("hide");
        location.reload();
      }, error => console.error(error));
      
      
    }    
  }
  
  isExpanded = false;  

  collapse() {
    this.isExpanded = false;
  }

  toggle() {
    this.isExpanded = !this.isExpanded;
  }


}
