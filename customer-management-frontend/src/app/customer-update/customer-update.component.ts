import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Customer } from '../customer';
import { CustomerService } from '../customer.service';

@Component({
  selector: 'app-customer-update',
  templateUrl: './customer-update.component.html',
  styleUrls: ['./customer-update.component.css'],
})
export class CustomerUpdateComponent implements OnInit {
  customerID: number;
  customer: Customer = new Customer();

  constructor(
    private customerService: CustomerService,
    private router: Router,
    private route: ActivatedRoute
  ) {}

  ngOnInit(): void {
    this.customerID = this.route.snapshot.params['customerID'];
    this.customerService.getCustomerById(this.customerID).subscribe(
      (info) => {
        this.customer = info;
      },
      (error) => console.log(error)
    );
  }

  changeRoute() {
    this.router.navigate(['/customers']);
  }

  onSubmit() {
    this.customerService
      .updateCustomer(this.customerID, this.customer)
      .subscribe(
        (info) => {
          this.changeRoute();
        },
        (error) => console.log(error)
      );
  }
}
