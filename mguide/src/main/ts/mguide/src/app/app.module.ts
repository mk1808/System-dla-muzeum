import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LayoutComponent } from './layout/layout.component';
import { HeaderComponent } from './layout/header/header.component';
import { FooterComponent } from './layout/footer/footer.component';
import { FiltersComponent } from './filters/filters.component';
import { SingleExhibitComponent } from './filters/single-exhibit/single-exhibit.component';
import { FormsModule } from '@angular/forms';
import { AuthComponent } from './auth/auth.component';
import { QuillModule } from 'ngx-quill';
import { NgxDropzoneModule } from 'ngx-dropzone';
import { HttpClientModule } from '@angular/common/http';

@NgModule({
  declarations: [
    AppComponent,
    LayoutComponent,
    HeaderComponent,
    FooterComponent,
    FiltersComponent,
    SingleExhibitComponent,
    AuthComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    QuillModule.forRoot(),

    FormsModule,
    NgxDropzoneModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent],
  exports:[
    
  ]
})
export class AppModule { }


/**linear-gradient(36deg, rgba(255,255,255,1) 3%, rgba(188,235,219,1) 59%, rgb(43 181 160) 100%)
 * 
 * 
 * width: 1050px;
    margin: 0 auto;
    background-color: #ffffff;
    height: 100%;
   
    padding-bottom: 20px;
 */

    /**
     * 
     * 
     *     padding-top: 20px;
   
    padding-bottom: 20px;

    text-align: left;
    padding-left: 20px;
    background: rgb(255,255,255);
    background: linear-gradient(
36deg, rgba(255,255,255,1) 3%, rgba(188,235,219,1) 59%, rgb(43 181 160) 100%);
     */