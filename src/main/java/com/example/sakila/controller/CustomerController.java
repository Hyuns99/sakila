package com.example.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.AddressService;
import com.example.sakila.service.CustomerService;
import com.example.sakila.service.StoreService;
import com.example.sakila.vo.Address;
import com.example.sakila.vo.Customer;
import com.example.sakila.vo.Store;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CustomerController {
	@Autowired CustomerService customerService;
	@Autowired StoreService storeService;
	@Autowired AddressService addressService;
	
	@GetMapping("/on/customerOne")
	public String customerOne(@RequestParam Integer customerId) {
		// 
		return "on/customerOne";
	}
	
	
	@GetMapping("/on/customerList")
	public String customerList(Model model
								, @RequestParam(defaultValue = "1") Integer currentPage
								, @RequestParam(defaultValue = "10") Integer rowPerPage) {
		
		Map<String, Object> resultMap = customerService.getCustomerList(currentPage, rowPerPage);
		
		model.addAttribute("currentPage",currentPage);
		//resultMap 풀어서 넣기(통으로 넘기면 view코드가 복잡할수있음)
		model.addAttribute("startPagingNum",resultMap.get("startPagingNum"));
		model.addAttribute("endPagingNum",resultMap.get("endPagingNum"));
		model.addAttribute("lastPage",resultMap.get("lastPage"));
		model.addAttribute("customerList",resultMap.get("customerList"));

		return "on/customerList";
	}
	
	@GetMapping("/on/addCustomer")
	public String addCustomer(Model model 
								,@RequestParam(required = false) String searchAddress) {
		// storeList
		List<Store> storeList = storeService.getStoreList();
		model.addAttribute("storeList",storeList);
		log.debug("storeList : " + storeList);
		
		// addressList <- 검색 searchAddress != null
		if(searchAddress != null && !searchAddress.equals("")) {
			List<Address> addressList = addressService.getAddressListByWord(searchAddress);
			model.addAttribute("addressList",addressList);
		}
		
		return "on/addCustomer";
	}
	
	@PostMapping("/on/addCustomer")
	public String addCustomer(Customer customer) {
		// 고객추가
		Integer row = customerService.addCustomer(customer);
		log.debug(row.toString());
		return "redirect:/on/customerList";
	}
}
