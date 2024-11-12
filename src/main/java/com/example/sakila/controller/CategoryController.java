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
	
	@GetMapping("/on/categoryList")
	public String getCategoryList(Model model
								, @RequestParam (defaultValue = "1") int currentPage
								, @RequestParam (defaultValue = "10") int rowPerPage) {
		List<Category> categoryList = categoryService.getCategoryList();
		
		int beginRow = (currentPage - 1) * rowPerPage;
		
		model.addAttribute("categoryList",categoryList);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("rowPerPage",rowPerPage);
		model.addAttribute("beginRow",beginRow);
		
		return "on/categoryList";
	}
	
}
