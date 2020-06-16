import { Component, OnInit, Inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { CookieService } from 'ngx-cookie-service';
import 'bootstrap';
import 'jquery';
import * as bcrypt from 'bcryptjs';

import $ from "jquery";

@Component({
  selector: 'app-nav-menu',
  templateUrl: './nav-menu.component.html',
  styleUrls: ['./nav-menu.component.css']
})
export class NavMenuComponent implements OnInit {
  ngOnInit() {
    if (this.cookieService.get('isLogged')) {
      if (this.cookieService.get('tenDangNhap') == "admin") {
        this.isAdmin = true;
      }
      this.isLoged = true;
    }
    else {
      this.isLoged = false;
    }

    this.nguoidung.maNguoiDung = this.cookieService.get('maNguoiDung');
    this.nguoidung.tenDangNhap = this.cookieService.get('tenDangNhap');
    this.nguoidung.tenNguoiDung = this.cookieService.get('tenNguoiDung');
    this.nguoidung.gioiTinh = this.cookieService.get('gioiTinh');
    this.nguoidung.ngaySinh = this.cookieService.get('ngaySinh');
    this.nguoidung.email = this.cookieService.get('email');

  }

  dsNguoiDung: any = {
    data: []
  };

  nguoidung: any = {
    maNguoiDung: 0,
    tenDangNhap: "",
    matKhau: "",
    tenNguoiDung: "",
    gioiTinh: "",
    ngaySinh: "",
    email: "",
  }

  bangDiemCaNhan: any = {
    data:[]
  }

  isAdmin: boolean = false;
  isLoged: boolean = false;
  errorMessage: string = "";

  constructor(private http: HttpClient, @Inject('BASE_URL') baseUrl: string, private cookieService: CookieService) {

  }

  login() {
    var tenDN = $('#tenDangNhap').val();
    var matKhau = $('#matKhau').val();

    this.dsNguoiDung.data.forEach(nguoiDung => {
      if (nguoiDung.tenDangNhap.toLowerCase() == tenDN.toLowerCase()) {
        bcrypt.compare(matKhau, nguoiDung.matKhau).then((result) => {
          if (result) {
            this.cookieService.set('maNguoiDung', nguoiDung.maNguoiDung);
            this.cookieService.set('tenDangNhap', nguoiDung.tenDangNhap);
            this.cookieService.set('matKhau', nguoiDung.matKhau);
            this.cookieService.set('tenNguoiDung', nguoiDung.tenNguoiDung);
            this.cookieService.set('gioiTinh', nguoiDung.gioiTinh);
            this.cookieService.set('ngaySinh', nguoiDung.ngaySinh);
            this.cookieService.set('email', nguoiDung.email);

            this.cookieService.set('isLogged', 'true');
            this.isLoged = true;
            if (nguoiDung.tenDangNhap == "admin") {
              this.isAdmin = true;
            }
            // alert("Đăng nhập thành công!");
            // $('#modalSignIn').modal('hide');
            this.errorMessage = "";
            if (this.isAdmin) {
              location.replace('/admin');
            } else {
              location.replace('/');
            }
          }
        });
        this.isLoged = false;
        // alert("Đăng nhập thất bại!");        
        return;
      }
      this.errorMessage = "Sai tên đăng nhập hoặc mật khẩu!";
    });
  }

  logout() {
    this.cookieService.deleteAll();
    this.isLoged = false;
    // location.reload();
    location.replace('/');
  }

  setEmptyErrorMsg() {
    this.errorMessage = "";
  }

  signUp() {
    this.errorMessage = "";
    var maNguoiDung = 1;
    var matKhau = $('#matKhauSignUp').val();
    var xacNhanMatKhau = $('#xacNhanMatKhauSignUp').val();
    var ngaySinh = $('#ngaySinhSignUp').val();

    if (this.nguoidung.tenDangNhap == "") {
      this.errorMessage = "Thiếu thông tin Tên đăng nhập!";
      return;
    }
    if (this.nguoidung.tenNguoiDung == "") {
      this.errorMessage = "Thiếu thông tin Tên người dùng!";
      return;
    }
    if (this.nguoidung.email == "") {
      this.errorMessage = "Thiếu thông tin email";
      return;
    } else if (!this.validateEmail(this.nguoidung.email)) {
      this.errorMessage = "Email không hợp lệ";
      return;
    }
    if (this.nguoidung.gioiTinh == "") {
      this.errorMessage = "Chọn giới tính";
      return;
    }
    if (matKhau == "") {
      this.errorMessage = "Thiếu thông tin Mật khẩu";
      return;
    }

    if (matKhau != xacNhanMatKhau) {
      this.errorMessage = "Mật khẩu xác nhận không chính xác!";
      return;
    }

    this.dsNguoiDung.data.forEach(nguoidung => {
      if (this.nguoidung.tenDangNhap == nguoidung.tenDangNhap) {
        this.errorMessage = "Tên đăng nhập đã tồn tại!";
        return;
      }
      if (maNguoiDung == nguoidung.maNguoiDung) {
        maNguoiDung++;
      }
    });

    const saltRounds = 10;
    var matKhauDaBam = bcrypt.hashSync(matKhau, saltRounds);
    // console.log(matKhauDaBam);

    this.nguoidung.maNguoiDung = maNguoiDung;
    this.nguoidung.matKhau = matKhauDaBam;
    this.nguoidung.ngaySinh = ngaySinh;

    if (this.errorMessage == "") {
      this.http.post('https://localhost:44318/' + 'api/NguoiDung/create-NguoiDung', this.nguoidung).subscribe(result => {
        var res: any = result;
        alert("Tạo tài khoản thành công!");
        // $('#modalSignUp').modal("hide");
        location.reload();
      }, error => console.error(error));
    }
  }

  openModalSignIn() {
    this.http.post('https://localhost:44318/' + 'api/NguoiDung/get-all', null).subscribe(result => {
      var res: any = result;
      this.dsNguoiDung.data = res.data;
    }, error => console.error(error));
    this.errorMessage = "";
    $('#modalSignIn').modal('show');
  }
  openModalSignUp() {
    this.http.post('https://localhost:44318/' + 'api/NguoiDung/get-all', null).subscribe(result => {
      var res: any = result;
      this.dsNguoiDung.data = res.data;
    }, error => console.error(error));
    this.errorMessage = "";
    $('#modalSignUp').modal('show');
  }
  openModalInfo() {
    this.errorMessage = "";
    $('#modalChangeInfo').modal('show');
  }
  openModalChangePass() {
    this.errorMessage = "";
    $('#modalChangePass').modal('show');
  }
  openModalBangDiem(){
    var para: any = {
      id: 0,
      keyword: this.nguoidung.tenDangNhap
    }
    this.http.post('https://localhost:44318/api/BangDiem/search-bangDiemCaNhan', para).subscribe(result => {
      var res: any = result;
      this.bangDiemCaNhan.data = res.data;
    }, error => console.error(error));
    $('#modalBangDiem').modal('show');
  }

  changeInfo() {
    this.errorMessage = "";

    var xacNhanMatKhau = $('#xacNhanMatKhauChangeInfo').val();

    if (this.nguoidung.tenNguoiDung == "") {
      this.errorMessage = "Thiếu thông tin tên người dùng";
      return;
    }
    if (this.nguoidung.email == "") {
      this.errorMessage = "Thiếu thông tin email";
      return;
    } else if (!this.validateEmail(this.nguoidung.email)) {
      this.errorMessage = "Email không hợp lệ";
      return;
    }
    if (xacNhanMatKhau == "") {
      this.errorMessage = "Nhập mật khẩu xác nhận!";
      return;
    }

    var integer = parseInt(this.nguoidung.maNguoiDung, 10);
    this.nguoidung.maNguoiDung = integer;

    if (this.errorMessage == "") {
      bcrypt.compare(xacNhanMatKhau, this.cookieService.get('matKhau')).then((result) => {
        if (result) {
          this.nguoidung.matKhau = this.cookieService.get('matKhau');
          this.http.post('https://localhost:44318/api/NguoiDung/update-nguoiDung', this.nguoidung).subscribe(result => {
            var res: any = result;
            alert("Sửa thông tin tài khoản thành công!");

            this.cookieService.set('tenNguoiDung', this.nguoidung.tenNguoiDung);
            this.cookieService.set('gioiTinh', this.nguoidung.gioiTinh);
            this.cookieService.set('email', this.nguoidung.email);
            this.ngOnInit();

            // $('#modalChangeInfo').modal('hide');
            location.reload();
          }, error => console.error(error));
          return;
        } else {
          this.errorMessage = "Mật khẩu không chính xác!";
          return;
        }
      });
    }
  }

  changePass() {
    this.errorMessage = "";
    var matKhauCu = $('#matKhauCuChangePass').val();
    var matKhauMoi = $('#matKhauMoiChangePass').val();
    var xacNhanMatKhauMoi = $('#xacNhanMatKhauMoiChangePass').val();

    if (matKhauCu == "") {
      this.errorMessage = "Thiếu thông tin Mật khẩu cũ";
      return;
    }
    if (matKhauMoi == "") {
      this.errorMessage = "Thiếu thông tin Mật khẩu mới";
      return;
    }
    if (xacNhanMatKhauMoi == "") {
      this.errorMessage = "Thiếu thông tin Xác nhận mật khẩu mới";
      return;
    }

    bcrypt.compare(matKhauCu, this.cookieService.get('matKhau')).then((result) => {
      if (result) {
        if (matKhauMoi == xacNhanMatKhauMoi) {
          var integer = parseInt(this.nguoidung.maNguoiDung, 10);
          this.nguoidung.maNguoiDung = integer;

          const saltRounds = 10;
          this.nguoidung.matKhau = bcrypt.hashSync(matKhauMoi, saltRounds);

          this.http.post('https://localhost:44318/api/NguoiDung/update-nguoiDung', this.nguoidung).subscribe(result => {
            var res: any = result;
            alert("Sửa mật khẩu thành công!");

            this.cookieService.set('matKhau', this.nguoidung.matKhau);
            this.ngOnInit();

            // $('#modalChangePass').modal('hide');
            location.reload();
          }, error => console.error(error));
          return;
        } else {
          this.errorMessage = "Xác nhận mật khẩu mới không chính xác!";
          return;
        }
      } else {
        this.errorMessage = "Mật khẩu cũ không chính xác!";
        return;
      }
    });
  }

  isExpanded = false;

  collapse() {
    this.isExpanded = false;
  }

  toggle() {
    this.isExpanded = !this.isExpanded;
  }

  validateEmail(email) {
    const re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(String(email).toLowerCase());
  }

}
