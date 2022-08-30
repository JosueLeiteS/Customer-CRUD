import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Customer } from '../customer';
import { CustomerService } from '../customer.service';

@Component({
  selector: 'app-customer-register',
  templateUrl: './customer-register.component.html',
  styleUrls: ['./customer-register.component.css'],
})
export class CustomerRegisterComponent implements OnInit {
  customer: Customer = new Customer();
  constructor(
    private customerService: CustomerService,
    private router: Router
  ) {}

  ngOnInit(): void {}

  saveCustomer() {
    this.customerService.registerCustomer(this.customer).subscribe(
      (set) => {
        console.log(set);
        this.changeRoute();
      },
      (error) => console.log(error)
    );
  }

  changeRoute() {
    this.router.navigate(['/customers']);
  }

  onSubmit() {
    this.saveCustomer();
  }
}
