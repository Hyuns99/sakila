package com.example.sakila.vo;

import lombok.Data;

@Data
public class Staff {
	private int staffId; // pk
	private String firstName;
	private String lastName;
	private int addressId; // 외래키
	private String email;
	private int storeId; // 외래키
	private int active;
	private String userName; // 닉네임
	private String password;
	private String lastUpdate;
	
}
