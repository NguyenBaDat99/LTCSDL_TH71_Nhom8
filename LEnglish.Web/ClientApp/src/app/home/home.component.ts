import { Component } from '@angular/core';
import 'bootstrap';
declare var $:any;

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css'],
  
})
export class HomeComponent {

  ngOnInit() {
    $('.carousel').carousel({
        interval: 2000
    });

    

  }
  
}
