import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { RouterModule } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';

import { AppComponent } from './app.component';
import { NavMenuComponent } from './nav-menu/nav-menu.component';
import { HomeComponent } from './home/home.component';
import { ListeningComponent } from './listening/listening.component';
import { ReadingComponent } from './reading/reading.component';
import { WrittingComponent } from './writting/writting.component';
import { UserComponent } from './user/user.component';
import { AdminBaitapComponent } from './admin-baitap/admin-baitap.component';
import { AdminCapbacComponent } from './admin-capbac/admin-capbac.component';
import { AdminDanhmucComponent } from './admin-danhmuc/admin-danhmuc.component';
import { AdminCauhoiComponent } from './admin-cauhoi/admin-cauhoi.component';
import { AdminComponent } from './admin/admin.component';
import { FrameTranslateComponent } from './frame-translate/frame-translate.component';

@NgModule({
  declarations: [
    AppComponent,
    NavMenuComponent,
    HomeComponent,
    ListeningComponent,
    ReadingComponent,
    WrittingComponent,
    UserComponent,
    AdminBaitapComponent,
    AdminCapbacComponent,
    AdminDanhmucComponent,
    AdminCauhoiComponent,
    AdminComponent,
    FrameTranslateComponent
  ],
  imports: [
    BrowserModule.withServerTransition({ appId: 'ng-cli-universal' }),
    HttpClientModule,
    FormsModule,
    RouterModule.forRoot([
      {path: '', component: HomeComponent, pathMatch: 'full' },
      { 
        path: 'admin',
        component: AdminComponent,
        children: [
          {
            path: '',
            component: AdminCapbacComponent
          },
          {
            path: 'danhmuc',
            component: AdminDanhmucComponent
          },
          {
            path: 'baitap',
            component: AdminBaitapComponent
          },
          {
            path: 'cauhoi',
            component: AdminCauhoiComponent
          }
        ]
      },
      { path: 'listening', component: ListeningComponent },
      { path: 'reading', component: ReadingComponent },
      { path: 'writting', component: WrittingComponent },
      { path: 'user', component: UserComponent },
    ])
  ],
  providers: [CookieService],
  bootstrap: [AppComponent]
})
export class AppModule { }
