package com.management.customer.customermanagementbackend.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.management.customer.customermanagementbackend.exceptions.ResourceNotFoundExcepction;
import com.management.customer.customermanagementbackend.model.Customer;
import com.management.customer.customermanagementbackend.respository.CustomerRepository;

@RestController
@RequestMapping("/api/")
@CrossOrigin(origins = "http://localhost:4200")
public class CustomerController {

  @Autowired
  private CustomerRepository repo;

  @GetMapping("/customers")
  public List<Customer> listAllCustomers() {
    return repo.findAll();
  }

  @PostMapping("/customers")
  public Customer saveCustomer(@RequestBody Customer customer) {
    return repo.save(customer);
  }

  private Customer existsInDB(Long CustomerID) {
    Customer customer = repo.findById(CustomerID)
        .orElseThrow(() -> new ResourceNotFoundExcepction("Customer with ID " + CustomerID + " does not exist."));
    return customer;
  }

  @GetMapping("/customers/{CustomerID}")
  public ResponseEntity<Customer> getCustomerById(@PathVariable Long CustomerID) {
    return ResponseEntity.ok(existsInDB(CustomerID));
  }

  @PutMapping("/customers/{CustomerID}")
  public ResponseEntity<Customer> updateCustomer(@PathVariable Long CustomerID, @RequestBody Customer customerInfo) {
    Customer customer = existsInDB(CustomerID);

    customer.setCompanyName(customerInfo.getCompanyName());
    customer.setContactTitle(customerInfo.getContactTitle());
    customer.setAddress(customerInfo.getAddress());
    customer.setCity(customerInfo.getCity());
    customer.setRegion(customerInfo.getRegion());
    customer.setPostalCode(customerInfo.getPostalCode());
    customer.setCountry(customerInfo.getCountry());
    customer.setPhone(customerInfo.getPhone());
    customer.setFax(customerInfo.getFax());

    Customer updatedCustomer = repo.save(customer);
    return ResponseEntity.ok(updatedCustomer);

  }

  @DeleteMapping("/customers/{CustomerID}")
  public ResponseEntity<Map<String, Boolean>> deleteCustomer(@PathVariable Long CustomerID) {
    Customer customer = existsInDB(CustomerID);

    repo.delete(customer);
    Map<String, Boolean> response = new HashMap<>();
    response.put("Delete", Boolean.TRUE);
    return ResponseEntity.ok(response);
  }

}
