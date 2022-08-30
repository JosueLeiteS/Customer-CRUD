import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Customer } from './customer';

@Injectable({
  providedIn: 'root',
})
export class CustomerService {
  private baseURL = '/api/customers';

  constructor(private httpClient: HttpClient) {}

  getCustomerList(): Observable<Customer[]> {
    return this.httpClient.get<Customer[]>(`${this.baseURL}`);
  }

  registerCustomer(customer: Customer): Observable<Object> {
    return this.httpClient.post(`${this.baseURL}`, customer);
  }

  updateCustomer(customerID: number, customer: Customer): Observable<Object> {
    return this.httpClient.put(`${this.baseURL}/${customerID}`, customer);
  }

  getCustomerById(customerID: number): Observable<Customer> {
    return this.httpClient.get<Customer>(`${this.baseURL}/${customerID}`);
  }

  deleteCustomer(customerID: number): Observable<Object> {
    return this.httpClient.delete(`${this.baseURL}/${customerID}`);
  }
}
