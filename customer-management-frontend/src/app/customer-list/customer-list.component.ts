import { Component, OnInit } from '@angular/core';
import { Customer } from '../customer';
import { CustomerService } from '../customer.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-customer-list',
  templateUrl: './customer-list.component.html',
  styleUrls: ['./customer-list.component.css'],
})
export class CustomerListComponent implements OnInit {
  customers: Customer[];

  constructor(
    private customerService: CustomerService,
    private router: Router
  ) {}

  ngOnInit(): void {
    this.getCustomers();
  }

  updateCustomer(customerID: number) {
    this.router.navigate(['customers/update', customerID]);
  }

  deleteCustomer(customerID: number) {
    this.customerService.deleteCustomer(customerID).subscribe((info) => {
      console.log(info);
      this.getCustomers();
    });
  }

  private getCustomers() {
    this.customerService.getCustomerList().subscribe((set) => {
      this.customers = set;
    });
  }
}
