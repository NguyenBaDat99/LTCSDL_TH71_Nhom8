import { Component, OnInit, Inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { ActivatedRoute } from '@angular/router';
import { NgForm } from '@angular/forms';
import { CookieService } from 'ngx-cookie-service';
import * as $ from 'jquery';


@Component({
  selector: 'app-reading-content',
  templateUrl: './reading-content.component.html',
  styleUrls: ['./reading-content.component.css']
})
export class ReadingContentComponent implements OnInit {

  isDone: boolean = false;
  isShowAnswer: boolean = false;

  dsbaiDoc: any = {
    data: []
  }

  baidoc: any = {
    maBaiTap: "",
    tenBaiTap: "",
    noiDung: "",
    moTa: "",
    ghiChu: ""
  }

  dsCauHoi: any = {
    data: []
  }

  cauhoi: any = {
    maCauHoi: "",
    noiDungCauHoi: "",
    cauTraLoi: "",
    dapAn: "",
    baiTap: ""
  }

  bangdiem: any = {
    maBangDiem: 1,
    maBaiTap: "",
    tenDangNhap: "",
    soCauHoi: 0,
    soCauDung: 0,
    diem: 0,
    tinhTrang: "Unfinished",
    ghiChu: ""
  }

  dapAnNguoiDung: any = {
    data: []
  }

  dsBangDiem: any = {
    data: []
  }

  constructor(private route: ActivatedRoute, private http: HttpClient, @Inject('BASE_URL') baseUrl: string, private cookieService: CookieService) {
    this.http.post('https://localhost:44318/' + 'api/BangDiem/get-all', null).subscribe(result => {
      var res: any = result;
      this.dsBangDiem.data = res.data;
      console.log(this.dsBangDiem.data);
    }, error => console.error(error));
  }

  initBangDiem() {
    if (this.cookieService.get('isLogged')) {
      this.bangdiem.tenDangNhap = this.cookieService.get('tenDangNhap');
      this.bangdiem.maBaiTap = this.route.snapshot.params['id'];

      for (let index = 0; index < this.dsBangDiem.data.length; index++) {
        if (this.bangdiem.tenDangNhap == this.dsBangDiem.data[index].tenDangNhap && this.bangdiem.maBaiTap == this.dsBangDiem.data[index].maBaiTap) {
          this.bangdiem.maBangDiem = this.dsBangDiem.data[index].maBangDiem;
          break;
        }
        if (this.bangdiem.maBangDiem == this.dsBangDiem.data[index].maBangDiem) {
          this.bangdiem.maBangDiem++;
        }
      }

      console.log(this.bangdiem);

      this.http.post('https://localhost:44318/' + 'api/BangDiem/create-bangDiem', this.bangdiem).subscribe(result => {
        var res: any = result;
      }, error => console.error(error));
    }
  }

  ngOnInit() {
    let maBaiTap = this.route.snapshot.params['id'];
    this.layDanhSachBaiDoc(maBaiTap);
    this.layDanhSachCauHoi(maBaiTap);

    setTimeout(() => {
      this.initBangDiem();
    }, 1000);

  }

  // resetForm(form: NgForm) {
  //   this.ngOnInit();
  // }

  layDanhSachBaiDoc(key) {
    let x = {
      id: 0,
      keyword: key
    }

    this.http.post('https://localhost:44318/' + 'api/BaiTap/proc_layDanhSachBaiHoc', x).subscribe(result => {
      this.dsbaiDoc = result;
      this.baidoc = this.dsbaiDoc.data;
      this.baidoc = this.baidoc[0];

      // console.log(this.bainghe.ghiChu);
    }, error => console.error(error));
  }

  layDanhSachCauHoi(key) {
    let x = {
      id: 0,
      keyword: key
    }

    this.http.post('https://localhost:44318/' + 'api/CauHoi/pro_layDanhSachCauHoi', x).subscribe(result => {
      this.dsCauHoi = result;
      this.cauhoi = this.dsCauHoi.data;

    })
  }

  tryagain() {
    // location.reload();
    this.ngOnInit();
    this.isDone = false;
    this.isShowAnswer = false;
  }

  showanswer() {
    if (this.isShowAnswer) {
      this.isShowAnswer = false;
    } else {
      this.isShowAnswer = true;
    }
  }

  submit() {

    this.isDone = true;

    var tongCauHoi = 0;
    var tongCauDung = 0;

    this.dsCauHoi.data.forEach(cauhoi => {
      tongCauHoi++;

      if (cauhoi.dapAn.includes(cauhoi.maCauHoi)) {
        tongCauDung++;
      }
    });

    var diem = (10 * (tongCauDung / tongCauHoi)).toFixed(2);;

    this.bangdiem.soCauHoi = tongCauHoi;
    this.bangdiem.soCauDung = tongCauDung;
    this.bangdiem.diem = parseFloat(diem);
    this.bangdiem.tinhTrang = "Finished";

    console.log(this.bangdiem);

    if (this.cookieService.get('isLogged')) {
      this.http.post('https://localhost:44318/' + 'api/BangDiem/update-bangDiem', this.bangdiem).subscribe(result => {
        var res: any = result;
      }, error => console.error(error));
    }

    $('#modalFeedback').modal('show');
  }

  saveCauTL(cauTLForm: NgForm): any {
    // console.log(cauTLForm.value["D-ILS4-1-1"]);
  }



}
