import { AfterViewInit, Component, OnInit, ViewChild } from '@angular/core';
import { Customer } from '../customer';
import { CustomerService } from '../customer.service';
import { Router } from '@angular/router';
import { MatPaginator } from '@angular/material/paginator';
import { MatTableDataSource } from '@angular/material/table';
import { MatInput } from '@angular/material/input';
import { MatFormFieldModule } from '@angular/material/form-field';

@Component({
  selector: 'app-customer-list',
  templateUrl: './customer-list.component.html',
  styleUrls: ['./customer-list.component.css'],
})
export class CustomerListComponent implements OnInit, AfterViewInit {
  customers: Customer[];

  columnsToDisplay = [
    'companyName',
    'contactTitle',
    'address',
    'city',
    'region',
    'postalCode',
    'country',
    'phone',
    'fax',
    'editButton',
    'deleteButton',
  ];

  private paginator: MatPaginator;

  dataSource: MatTableDataSource<any>;

  @ViewChild(MatPaginator) set matPaginator(mp: MatPaginator) {
    this.paginator = mp;
    this.dataSource.paginator = this.paginator;
  }

  constructor(
    private customerService: CustomerService,
    private router: Router
  ) {}

  ngOnInit(): void {
    this.getCustomers();
  }

  ngAfterViewInit() {
    this.getCustomers();
  }

  updateCustomer(customerID: number) {
    this.router.navigate(['customers/update', customerID]);
  }

  deleteCustomer(customerID: number) {
    if (window.confirm('Are you sure you want to delte this entity?')) {
      this.customerService.deleteCustomer(customerID).subscribe((info) => {
        console.log(info);
        this.getCustomers();
      });
    }
  }

  private getCustomers() {
    this.customerService.getCustomerList().subscribe((set) => {
      this.dataSource = new MatTableDataSource(set);
      this.customers = set;
      this.dataSource.paginator = this.paginator;
    });
  }

  setFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }
}
