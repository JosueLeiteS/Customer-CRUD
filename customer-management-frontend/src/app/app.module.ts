import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { CustomerListComponent } from './customer-list/customer-list.component';
import { HttpClientModule } from '@angular/common/http';
import { CustomerRegisterComponent } from './customer-register/customer-register.component';
import { FormsModule } from '@angular/forms';
import { CustomerUpdateComponent } from './customer-update/customer-update.component';

@NgModule({
  declarations: [
    AppComponent,
    CustomerListComponent,
    CustomerRegisterComponent,
    CustomerUpdateComponent,
  ],
  imports: [BrowserModule, AppRoutingModule, HttpClientModule, FormsModule],
  providers: [],
  bootstrap: [AppComponent],
})
export class AppModule {}
