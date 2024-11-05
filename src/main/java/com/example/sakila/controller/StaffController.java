package com.example.sakila.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.mapper.AddressMapper;
import com.example.sakila.mapper.StaffMapper;
import com.example.sakila.mapper.StoreMapper;
import com.example.sakila.service.AddressService;
import com.example.sakila.service.StaffService;
import com.example.sakila.service.StoreService;
import com.example.sakila.vo.Address;
import com.example.sakila.vo.Staff;
import com.example.sakila.vo.Store;

import jakarta.servlet.http.HttpSession;


@Slf4j
@Controller
public class StaffController {
	@Autowired StaffService staffService;
	@Autowired StoreService storeService;
	
	@Autowired AddressService addressService;
	
	// active 수정
	@GetMapping("/on/modifyStaffActive")
	public String modifyStaffActive(Staff staff) {
		
		if(staff.getActive() == 1) {
			staff.setActive(2);
		} else {
			staff.setActive(1);
		}
		int row = staffService.modifyStaff(staff); // * 어떤 컬럼값을 수정하든 mapper메소드는 하나다 *
		
		return "redirect:/on/staffList";
	}
	
	
	// leftMenu에서 a태그, addStaff.jsp에서 주소검색을 통해 넘겨받을 수 있다
	@GetMapping("/on/addStaff")
	public String addStaff(Model model,
							@RequestParam(defaultValue = "") String searchAddress) {
		// model(storeList)
		log.debug("searchAddress : " + searchAddress);
		List<Store> storeList = storeService.getStoreList();
		model.addAttribute("storeList",storeList);
		// model(addressList) <- searchAddress가 공백이 아니면 검색 후
		if(searchAddress.equals("") == false) {
			List<Address> addressList = addressService.getAddressListByWord(searchAddress);
			log.debug(addressList.toString());
			model.addAttribute("addressList", addressList);
		}
		return "on/addStaff";
	}
	@PostMapping("/on/addStaff")
	public String addStaff(Staff staff) { // 커멘드 객체 생성 -> 커멘드 객체.set(request.getParameter())
		// insert호출
		log.debug(staff.toString());
		int row = staffService.addStaff(staff);
		log.debug("row : " + row);
		if(row == 0) { // 입력 실패시 입력 페이지로 포워딩
			return "on/addStaff";
		}
		return "redirect:/on/staffList";
	}
	
	@GetMapping("/on/staffList")
	public String staffList(Model model
							, @RequestParam(defaultValue = "1") int currentPage
							, @RequestParam(defaultValue = "10") int rowPerPage ) { //currentPage가 null이면 자동형으로 1로 바꿔준다
		// model(staffList)
		Map<String, Object> map = new HashMap<>();
		int beginRow = (currentPage - 1) * rowPerPage;
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		log.debug(map.toString());
		List<Staff> staffList = staffService.getStaffList(map);
		
		int lastPage = staffService.getListPage(rowPerPage);
		
		log.debug(staffList.toString());
		model.addAttribute("staffList", staffList);
		model.addAttribute("currentPage", currentPage); // 현재페이지
		model.addAttribute("lastPage", lastPage); // 마지막 페이지
		
		return "on/staffList";
	}
	
	
	@GetMapping("/on/staffOne")
	public String staffOne(HttpSession session, Model model) {
		int staffId = ((Staff)(session.getAttribute("loginStaff"))).getStaffId();
		Map<String, Object> staff = staffService.getStaffOne(staffId);
		model.addAttribute("staff", staff);
		log.debug(staff.toString());
		
		return "on/staffOne";
	}
	
}






