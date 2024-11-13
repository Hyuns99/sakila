package com.example.sakila.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.CategoryService;
import com.example.sakila.vo.Category;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CategoryController {
	@Autowired CategoryService categoryService;
	
	@GetMapping("/on/addCategory")
	public String getAddCategory(Model model, Category category) {
		
		
		
		return "on/addCategory";
	}
	
	@GetMapping("/on/categoryList")
	public String getCategoryList(Model model
								, @RequestParam (defaultValue = "1") int currentPage
								, @RequestParam (defaultValue = "10") int rowPerPage) {
		
		List<Category> categoryList = categoryService.getCategoryList();
		
		int beginRow = (currentPage - 1) * rowPerPage;
		int lastPage = categoryService.getCategoryCount(rowPerPage);
		int pageSize = 5; // 한 페이지에 표시할 페이지 번호 수
		int startPage = Math.max(1, currentPage - pageSize / 2);
		int endPage = Math.min(lastPage, startPage + pageSize - 1); 

		// 페이지 범위가 부족할 경우 보정
		if (endPage - startPage < pageSize - 1) {
		    startPage = Math.max(1, endPage - pageSize + 1);
		}
		log.debug("startPage : " + startPage);
		log.debug("endPage : " + endPage);
		log.debug("lastPage : " + lastPage);
		
		
		model.addAttribute("categoryList",categoryList);
		model.addAttribute("beginRow",beginRow);
		model.addAttribute("lastPage",lastPage);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		
		return "on/categoryList";
	}
	
}
