import { Component, OnInit } from '@angular/core';
import { CookieService } from 'ngx-cookie-service';

@Component({
  selector: 'app-reading-level',
  templateUrl: './reading-level.component.html',
  styleUrls: ['./reading-level.component.css']
})
export class ReadingLevelComponent implements OnInit {

  constructor(private cookieService: CookieService) { }

  ngOnInit() {
  }

}
