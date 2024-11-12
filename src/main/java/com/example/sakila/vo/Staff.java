package com.example.sakila.vo;

import lombok.Data;

@Data
public class Staff {
	private Integer staffId; // pk
	private String firstName;
	private String lastName;
	private Integer addressId; // 외래키
	private String email;
	private Integer storeId; // 외래키
	private Integer active;
	private String address;
	private String userName; // 닉네임
	private String password;
	private String lastUpdate;
	
}
