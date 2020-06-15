import { Component, OnInit, Inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { CookieService } from 'ngx-cookie-service';

@Component({
  selector: 'app-listening-level',
  templateUrl: './listening-level.component.html',
  styleUrls: ['./listening-level.component.css']
})

export class ListeningLevelComponent implements OnInit {

  constructor(private http: HttpClient, @Inject('BASE_URL') baseUrl: string, private cookieService: CookieService) { }

  ngOnInit() {
    
  }

}
