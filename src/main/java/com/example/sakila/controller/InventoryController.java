package com.example.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.mapper.InventoryMapper;
import com.example.sakila.service.FilmService;
import com.example.sakila.service.InventoryService;
import com.example.sakila.vo.Film;
import com.example.sakila.vo.Inventory;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class InventoryController {
	@Autowired InventoryService inventoryService;
	@Autowired InventoryMapper inventoryMapper;
	@Autowired FilmService filmService;
	
	@GetMapping("/on/removeInventoryByKey")
	public String removeInventoryByKey(Inventory inventory) {
		inventoryService.removeInventoryByKey(inventory.getInventoryId());
		return "redirect:/on/inventoryList?storeId="+inventory.getStoreId();
		
	}
	
	@PostMapping("/on/addInventory")
	public String addInventory(Inventory inventory) {
		inventoryService.addInventory(inventory);
		return "redirect:/on/inventoryList?storeId="+inventory.getStoreId();
	}
	
	@GetMapping("/on/addInventory")
	public String addInventory(Model model
								, @RequestParam Integer storeId
								, @RequestParam (required = false) String searchTitle) {
		model.addAttribute("storeId",storeId);
		
		if(searchTitle != null && !searchTitle.equals("")) {
			// 영화 검색 목록 모델 추가 (배우에 영화추가)
			List<Film> filmList = filmService.getFilmListByTitle(searchTitle);
			model.addAttribute("filmList",filmList);
			model.addAttribute("searchTitle",searchTitle);
		}
		
		return "on/addInventory";
	}
	
	@GetMapping("/on/inventoryList")
	public String inventoryList(Model model
								, @RequestParam Integer storeId
								, @RequestParam(defaultValue = "1") Integer currentPage
								, @RequestParam(defaultValue = "10") Integer rowPerPage) {
		List<Map<String, Object>> inventoryList = inventoryService.getInventoryListByStore(storeId, currentPage, rowPerPage);
		
		// 페이지네이션
		Integer pageSize = 5;
		Integer lastPage = inventoryService.getInventoryCount(rowPerPage);
		Integer startPage = Math.max(1, currentPage - pageSize / 2);
		Integer endPage = Math.min(lastPage, startPage + pageSize - 1); 

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
