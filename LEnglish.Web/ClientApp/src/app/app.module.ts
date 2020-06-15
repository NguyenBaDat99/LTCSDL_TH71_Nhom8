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
import { ListeningLevelComponent } from './listening-level/listening-level.component';
import { ListeningLessonComponent } from './listening-lesson/listening-lesson.component';
import { ListeningContentComponent } from './listening-content/listening-content.component';
import { ReadingLevelComponent } from './reading-level/reading-level.component';
import { ReadingLessonComponent } from './reading-lesson/reading-lesson.component';
import { ReadingContentComponent } from './reading-content/reading-content.component';

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
    FrameTranslateComponent,
    ListeningLevelComponent,
    ListeningLessonComponent,
    ListeningContentComponent,
    ReadingLevelComponent,
    ReadingLessonComponent,
    ReadingContentComponent
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
      { 
        path: 'listening', 
        component: ListeningComponent,
        children : [ 
          {
            path : '',
            component : ListeningLevelComponent,
              
          },
          {
            path : 'level/:id',
            component : ListeningLessonComponent
          },
          {
            path : 'level/lesson/:id',
            component : ListeningContentComponent
          }
        ]
       },
      { 
        path: 'reading', 
        component: ReadingComponent,
        children : [ 
          {
            path : '',
            component : ReadingLevelComponent,
              
          },
          {
            path : 'level/:id',
            component : ReadingLessonComponent
          },
          {
            path : 'level/lesson/:id',
            component : ReadingContentComponent
          }
        ]
       },
      { path: 'writting', component: WrittingComponent },
      { path: 'user', component: UserComponent },
    ])
  ],
  providers: [CookieService],
  bootstrap: [AppComponent]
})
export class AppModule { }
