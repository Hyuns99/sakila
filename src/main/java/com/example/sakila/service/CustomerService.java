package com.example.sakila.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.CustomerMapper;
import com.example.sakila.vo.Customer;

@Service
@Transactional
public class CustomerService {
	@Autowired CustomerMapper customerMapper;
	
	// 고객추가
	public Integer addCustomer(Customer customer) {
		return customerMapper.insertCustomer(customer);
	}
}
