import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { CustomerListComponent } from './customer-list/customer-list.component';
import { CustomerRegisterComponent } from './customer-register/customer-register.component';
import { CustomerUpdateComponent } from './customer-update/customer-update.component';

const routes: Routes = [
  { path: 'customers', component: CustomerListComponent },
  { path: 'customers/register', component: CustomerRegisterComponent },
  { path: 'customers/update/:customerID', component: CustomerUpdateComponent },
  { path: '', redirectTo: 'customers', pathMatch: 'full' },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
