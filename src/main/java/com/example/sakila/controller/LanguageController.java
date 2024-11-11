package com.example.sakila.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.LanguageService;
import com.example.sakila.vo.Language;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LanguageController {
	@Autowired LanguageService languageService;
	
	@PostMapping("/on/addLanguage")
	public String insertLanguage(Language language) {
		int row = languageService.insertLanguage(language);
		
		if(row == 0) {
			return "on/addLanguage";
		}
		
		return "redirect:/on/languageList"; 
	}
	
	@GetMapping("/on/addLanguage")
	public String insertLanguage() {
		
		return "on/addLanguage";
	}
	
	@GetMapping("/on/languageList")
	public String selectLanguageList(Model model, 
								@RequestParam(defaultValue = "1") int currentPage
								, @RequestParam(defaultValue = "10") int rowPerPage) {
		
		List<Language> languageList = languageService.getLanguageList(currentPage, rowPerPage);
		model.addAttribute("languageList",languageList);
		
		return "on/languageList";
	}
}
