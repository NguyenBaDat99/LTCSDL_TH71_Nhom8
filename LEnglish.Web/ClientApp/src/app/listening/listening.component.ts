import { Component, OnInit } from '@angular/core';
import { CookieService } from 'ngx-cookie-service';

@Component({
  selector: 'app-listening',
  templateUrl: './listening.component.html',
  styleUrls: ['./listening.component.css']
})
export class ListeningComponent implements OnInit {

  constructor(private cookieService: CookieService) { }

  ngOnInit() {
  }
  
}
