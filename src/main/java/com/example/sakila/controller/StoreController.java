package com.example.sakila.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.StoreService;
import com.example.sakila.vo.Store;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StoreController {
	@Autowired StoreService storeService;
	
	@GetMapping("/on/storeList")
	public String selectStoreList(Model model
								, HttpSession session
								, @RequestParam(defaultValue = "1") int currentPage
								, @RequestParam(defaultValue = "10") int rowPerPage) {
	    // 필요한 시작 행 계산
	    int beginRow = (currentPage - 1) * rowPerPage;
	    
	    Integer storeId = (Integer) session.getAttribute("storeId");
	    
	    log.debug("storeId : " + storeId);
	    
	    // 서비스 호출
	    List<Store> storeList = storeService.getStoreList();
 
	    // 모델에 데이터 추가
	    model.addAttribute("storeList", storeList);
	    
	    log.debug("storeList : " + storeList);
	    
	    // 페이징을 위해 필요한 현재 페이지와 행 개수 추가
	    model.addAttribute("currentPage", currentPage);
	    model.addAttribute("beginRow", beginRow);
	    model.addAttribute("rowPerPage", rowPerPage);
		
		
		return "on/storeList";
	}
}
