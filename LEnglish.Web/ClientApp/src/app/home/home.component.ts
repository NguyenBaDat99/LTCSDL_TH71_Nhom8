import { Component, OnInit, Inject, Renderer2 } from '@angular/core';
import 'bootstrap';
declare var $:any;

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css'],
  
})
export class HomeComponent implements OnInit{

constructor(private _renderer2: Renderer2) { }
    
  ngOnInit() {
    $('.carousel').carousel({
        interval: 2000
    });

    var script = document.createElement("script");
    script.type = "text/javascript";
    // let script = this._renderer2.createElement('script');
    // script.type = 'application/ld+json';
    script.text = '{!function () { var h = { s: "https://dict.laban.vn", w: 260, h: 260, hl: 2, th: 3 }; function loadScript(t, e) { var n = document.createElement("script"); n.type = "text/javascript", n.readyState ? n.onreadystatechange = function () { ("loaded" === n.readyState || "complete" === n.readyState) && (n.onreadystatechange = null, e()) } : n.onload = function () { e() }, n.src = t, q = document.getElementById("lbdict_plugin_frame"), q.parentNode.insertBefore(n, q) } setTimeout(function () { loadScript("https://stc-laban.zdn.vn/dictionary/js/plugin/lbdictplugin.frame.min.js", function () { lbDictPluginFrame.init(h) }) }, 1e3); }();};'

    document.appendChild(script);
  }
  
}
