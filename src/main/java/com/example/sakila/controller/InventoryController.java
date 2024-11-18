package com.example.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.mapper.InventoryMapper;
import com.example.sakila.service.InventoryService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class InventoryController {
	@Autowired InventoryService inventoryService;
	@Autowired InventoryMapper inventoryMapper;
	
	@GetMapping("/on/inventoryList")
	public String inventoryList(Model model
								, @RequestParam Integer storeId
								, @RequestParam(defaultValue = "1") Integer currentPage
								, @RequestParam(defaultValue = "10") Integer rowPerPage) {
		List<Map<String, Object>> inventoryList = inventoryService.getInventoryListByStore(storeId, currentPage, rowPerPage);
		
		// 페이지네이션
		Integer pageSize = 5;
		Integer lastPage = inventoryService.getInventoryCount(rowPerPage);
		int startPage = Math.max(1, currentPage - pageSize / 2);
		int endPage = Math.min(lastPage, startPage + pageSize - 1); 

		// 페이지 범위가 부족할 경우 보정
		if (endPage - startPage < pageSize - 1) {
		    startPage = Math.max(1, endPage - pageSize + 1);
		}
		
		model.addAttribute("inventoryList", inventoryList);
		model.addAttribute("storeId", storeId);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		
		return "on/inventoryList";
	}

}
