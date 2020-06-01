import { Component, OnInit, Inject, Renderer2 } from '@angular/core';
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

constructor(
  private renderer2: Renderer2,
  @Inject(DOCUMENT) private _document) {

   }
    
  ngOnInit() {
    $('.carousel').carousel({
        interval: 2000
    });

    const s = this.renderer2.createElement('script');
    s.type = 'text/javascript';
    s.src = './assets/js/frameTranslate.js';
    s.text = ``;
    this.renderer2.appendChild(this._document.body, s);
 
 

    // var script = document.createElement("script");
    // script.type = "text/javascript";
    // // let script = this._renderer2.createElement('script');
    // // script.type = 'application/ld+json';
    // script.text = '{!function () { var h = { s: "https://dict.laban.vn", w: 260, h: 260, hl: 2, th: 3 }; function loadScript(t, e) { var n = document.createElement("script"); n.type = "text/javascript", n.readyState ? n.onreadystatechange = function () { ("loaded" === n.readyState || "complete" === n.readyState) && (n.onreadystatechange = null, e()) } : n.onload = function () { e() }, n.src = t, q = document.getElementById("lbdict_plugin_frame"), q.parentNode.insertBefore(n, q) } setTimeout(function () { loadScript("https://stc-laban.zdn.vn/dictionary/js/plugin/lbdictplugin.frame.min.js", function () { lbDictPluginFrame.init(h) }) }, 1e3); }();};'

    // document.appendChild(script);
  }
  
}
