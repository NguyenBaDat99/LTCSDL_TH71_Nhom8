import { Component, OnInit, Inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { ActivatedRoute } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';

@Component({
  selector: 'app-listening-content',
  templateUrl: './listening-content.component.html',
  styleUrls: ['./listening-content.component.css']
})
export class ListeningContentComponent implements OnInit {

  s: String = "";

  dsbaiNghe : any = {
    data: []
  }

  bainghe : any = {
    maBaiTap: "",
    tenBaiTap: "",
    noiDung: "",
    moTa: "",
    ghiChu: ""
  }

  dsCauHoi : any = {
    data: []
  }

  cauhoi : any = {
    maCauHoi: "",
    noiDungCauHoi: "",
    cauTraLoi: "",
    dapAn: "",
    baiTap: ""
  }

  constructor(private route: ActivatedRoute, private http: HttpClient, @Inject('BASE_URL') baseUrl: string, private cookieService: CookieService) { }

  ngOnInit() {
    let maBaiTap = this.route.snapshot.params['id'];
    this.layDanhSachBaiNghe(maBaiTap);
    this.layDanhSachCauHoi(maBaiTap);
    
  }
  
  layDanhSachBaiNghe(key) {
    let x = {
      id : 0,
      keyword: key
    }

    this.http.post('https://localhost:44318/' + 'api/BaiTap/proc_layDanhSachBaiHoc', x).subscribe(result => {
      this.dsbaiNghe = result;
      this.bainghe = this.dsbaiNghe.data;
      this.bainghe = this.bainghe[0];

      // console.log(this.bainghe.ghiChu);
    }, error => console.error(error));
  }

  layDanhSachCauHoi(key) {
    let x = {
      id :0,
      keyword : key
    }

    this.http.post('https://localhost:44318/' + 'api/CauHoi/pro_layDanhSachCauHoi', x).subscribe(result => {
      this.dsCauHoi = result;
      this.cauhoi = this.dsCauHoi.data;

      console.log(this.cauhoi);
    })
  }


}
