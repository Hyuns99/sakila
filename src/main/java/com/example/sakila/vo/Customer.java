package com.example.sakila.vo;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class Customer {
	private Integer customerId;
	private Integer storeId;
	private String firstName;
	private String lastName;
	private String email;
	private Integer addressId;
	private Integer active;
	private LocalDateTime createDate;
	private String lastUpdate;
}
