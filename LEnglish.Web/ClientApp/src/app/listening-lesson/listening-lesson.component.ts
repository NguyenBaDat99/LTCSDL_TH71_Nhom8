import { Component, OnInit, Inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { ActivatedRoute } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';
import * as $ from 'jquery';

@Component({
  selector: 'app-listening-lesson',
  templateUrl: './listening-lesson.component.html',
  styleUrls: ['./listening-lesson.component.css']
})
export class ListeningLessonComponent implements OnInit {

  public dem : number = 1;
  public chuoi : string  = "./assets/Images/listen";

  ielt: boolean = false;
  mvr:  boolean = false;
  str:  boolean = false;
  tec:  boolean = false;
  
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

  constructor(private route: ActivatedRoute, private http: HttpClient, @Inject('BASE_URL') baseUrl: string, private cookieService: CookieService) { 
  }

  ngOnInit() {
    let maBaiTap = this.route.snapshot.params['id']
    this.s = maBaiTap;
    this.s = this.s.substr(0, 5);
    
    if (this.s == "N-ILS")
      this.ielt = true;
    else if (this.s == "N-MVR")
      this.mvr = true;
    else if (this.s == "N-STR")
      this.str = true;
    else 
      this.tec = true;

    this.layDanhSachBaiNghe(this.s);
  }

  layDanhSachBaiNghe(key) {
    let x = {
      id : 0,
      keyword: key
    }

    this.http.post('https://localhost:44318/' + 'api/BaiTap/proc_layDanhSachBaiHoc', x).subscribe(result => {
      this.dsbaiNghe = result;
      this.bainghe = this.dsbaiNghe.data;

      this.chuoi = this.chuoi + this.dem.toString() + ".jpg";
      this.dem = this.dem + 1;
      // console.log(this.dsbaiNghe);
      // console.log(this.chuoi);
    }, error => console.error(error));
  }

}
