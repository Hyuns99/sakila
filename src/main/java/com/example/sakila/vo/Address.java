package com.example.sakila.vo;

import lombok.Data;

@Data
public class Address {
	private Integer addressId;
	private String address;
	private String address2;
	private String district;
	private Integer cityId;
	private String postalCode;
	private String phone;
	private String lastUpdate;
}
