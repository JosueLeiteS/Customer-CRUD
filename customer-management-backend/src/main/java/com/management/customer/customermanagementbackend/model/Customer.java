package com.management.customer.customermanagementbackend.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "customers")
public class Customer {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "CustomerID")
  private Long customerID;

  @Column(name = "CompanyName", length = 65, nullable = false)
  private String companyName;

  @Column(name = "ContactTitle", length = 65, nullable = false)
  private String contactTitle;

  @Column(name = "Address", length = 200, nullable = false)
  private String address;

  @Column(name = "City", length = 200, nullable = false)
  private String city;

  @Column(name = "Region", length = 200, nullable = false)
  private String region;

  @Column(name = "PostalCode", length = 45, nullable = false)
  private String postalCode;

  @Column(name = "Country", length = 200, nullable = false)
  private String country;

  @Column(name = "Phone", length = 45, nullable = false)
  private String phone;

  @Column(name = "Fax", length = 45, nullable = false)
  private String fax;

  public Customer() {

  }

  public Customer(Long customerID, String companyName, String contactTitle, String address, String city, String region,
      String postalCode, String country, String phone, String fax) {
    this.customerID = customerID;
    this.companyName = companyName;
    this.contactTitle = contactTitle;
    this.address = address;
    this.city = city;
    this.region = region;
    this.postalCode = postalCode;
    this.country = country;
    this.phone = phone;
    this.fax = fax;
  }

  public Long getCustomerID() {
    return customerID;
  }

  public void setCustomerID(Long customerID) {
    this.customerID = customerID;
  }

  public String getCompanyName() {
    return companyName;
  }

  public void setCompanyName(String companyName) {
    this.companyName = companyName;
  }

  public String getContactTitle() {
    return contactTitle;
  }

  public void setContactTitle(String contactTitle) {
    this.contactTitle = contactTitle;
  }

  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  public String getCity() {
    return city;
  }

  public void setCity(String city) {
    this.city = city;
  }

  public String getRegion() {
    return region;
  }

  public void setRegion(String region) {
    this.region = region;
  }

  public String getPostalCode() {
    return postalCode;
  }

  public void setPostalCode(String postalCode) {
    this.postalCode = postalCode;
  }

  public String getCountry() {
    return country;
  }

  public void setCountry(String country) {
    this.country = country;
  }

  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }

  public String getFax() {
    return fax;
  }

  public void setFax(String fax) {
    this.fax = fax;
  }

}
