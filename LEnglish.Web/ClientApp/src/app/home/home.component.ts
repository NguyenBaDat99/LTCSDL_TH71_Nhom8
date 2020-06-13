import { Component, OnInit, Inject, Renderer2 } from '@angular/core';
import { CookieService } from 'ngx-cookie-service';
import 'bootstrap';
import 'jquery';

import $ from "jquery";
import { DOCUMENT } from '@angular/common';
// declare var $:any;

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css'],
  
})
export class HomeComponent implements OnInit{

  isAdmin: boolean = false;


constructor(private renderer2: Renderer2, @Inject(DOCUMENT) private _document, private cookieService: CookieService) {
}
    
  ngOnInit() {
    $('.carousel').carousel({
        interval: 2000
    });

    if(this.cookieService.get('isLogged')){
      if(this.cookieService.get('tenDangNhap') == "admin"){
        this.isAdmin = true;
      }
    } 
  }
  
}
