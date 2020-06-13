import { Component, OnInit, Inject, Renderer2 } from '@angular/core';
import { CookieService } from 'ngx-cookie-service';
import 'bootstrap';
import 'jquery';

import $ from "jquery";
import { DOCUMENT } from '@angular/common';

@Component({
  selector: 'app-frame-translate',
  templateUrl: './frame-translate.component.html',
  styleUrls: ['./frame-translate.component.css']
})
export class FrameTranslateComponent implements OnInit {

  constructor(private renderer2: Renderer2, @Inject(DOCUMENT) private _document: Document, private cookieService: CookieService) {
  }

  ngOnInit() {

  }
}
