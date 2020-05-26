import { Component, OnInit, Inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-reading',
  templateUrl: './reading.component.html',
  styleUrls: ['./reading.component.css']
})
export class ReadingComponent implements OnInit{
  public modalID: string;
  public res: any;
  public listBaiTap: [];
  public noiDung: string;
  public tenBaiTap: string;

  constructor(http: HttpClient, @Inject('BASE_URL') baseUrl: string) {
    http.post('https://localhost:44318/' + 'api/BaiTap/get-all',null).subscribe(result => {
      this.res = result;
      this.listBaiTap = this.res.data;
      console.log(this.listBaiTap);
    }, error => console.error(error));
    
  }

  ngOnInit(){

  }

  public createModel(maBT:string){
    console.log(this.listBaiTap);
      // this.listBaiTap.forEach(bt => {
      //   if(bt.maBaiTap = maBT){
      //     this.noiDung = bt.noiDung;
      //     this.tenBaiTap = bt.tenBaiTap;
      //   }
      // });
    }

}

