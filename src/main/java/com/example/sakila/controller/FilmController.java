package com.example.sakila.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.mapper.FilmCategoryMapper;
import com.example.sakila.mapper.InventoryMapper;
import com.example.sakila.service.ActorService;
import com.example.sakila.service.CategoryService;
import com.example.sakila.service.FilmCategoryService;
import com.example.sakila.service.FilmService;
import com.example.sakila.service.InventoryService;
import com.example.sakila.service.LanguageService;
import com.example.sakila.vo.Actor;
import com.example.sakila.vo.Category;
import com.example.sakila.vo.Film;
import com.example.sakila.vo.FilmActor;
import com.example.sakila.vo.FilmForm;
import com.example.sakila.vo.Language;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FilmController {
	@Autowired FilmService filmService;
	@Autowired ActorService actorService;
	@Autowired LanguageService languageService;
	@Autowired CategoryService categoryService;
	@Autowired InventoryService inventoryService;
	@Autowired FilmCategoryService filmCategoryService;
	
	@PostMapping("/on/modifyFilm")
	public String updateFilm(Film film) {
		int row = filmService.updateFilmByKey(film);
		
		log.debug("filmId : " + film.getFilmId());
		return "redirect:/on/filmOne?filmId=" + film.getFilmId();
	}
	@GetMapping("/on/modifyFilm")
	public String updateFilm(Model model,
							@RequestParam int filmId) {
		Map<String, Object> film = filmService.getFilmOne(filmId);
		model.addAttribute("film",film);
		log.debug("filmId : " + filmId);
		
		List<Language> languageList = languageService.getLanguageList(0, 0);
		log.debug(languageList.toString());
		model.addAttribute("languageList",languageList);
		
		return "on/modifyFilm";
	}
	
	@GetMapping("/on/removeFilm")
	public String removeFilm(Model model
							, @RequestParam Integer filmId) {
		// 필름이 인벤토리에 등록되어 있다면 삭제 불가
		Integer count = inventoryService.getCountInventoryByFilm(filmId);
		if(count != 0) {
			// 메세지 추가 할려면 ... 중복코드 리팩토링 이슈발생
			Map<String, Object> film = filmService.getFilmOne(filmId);
			log.debug(film.toString());
			
			List<Actor> actorList = actorService.getActorListByFilm(filmId);
			
			model.addAttribute("film",film);
			model.addAttribute("actorList", actorList);
			model.addAttribute("removeFilmMsg","film이 inventory에 존재합니다");
			return "on/filmOne";
			
			//return "redirect:/on/filmOne"; // 메세지 추가는 힘들다
		}

		filmService.removeFilmByKey(filmId);
		
		
		return "redirect:/on/filmList";
	}
	
	@GetMapping("/on/filmList")
	public String filmList(Model model 
							,@RequestParam(required = false) Integer categoryId
							, @RequestParam(defaultValue = "1") int currentPage
							, @RequestParam(defaultValue = "10") int rowPerPage) {
	
		
		log.debug("categoryId : " + categoryId);
		log.debug("currentPage : " + currentPage);
		log.debug("rowPerPage : " + rowPerPage);
		
		List<Map<String, Object>> filmList = filmService.getFilmList(categoryId, currentPage, rowPerPage);
		log.debug("filmList : " + filmList);
		model.addAttribute("filmList", filmList);
		
		// Model에 category List 추가
		List<Category> categoryList = categoryService.getCategoryList();
		log.debug("categoryList : " + categoryList);
		model.addAttribute("categoryList", categoryList);
		
		// 같이 넘겨야 모델값 현재페이지, 현재카테고리ID
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("currentCategoryId", categoryId);
		
		// 페이지네이션
		int lastPage = filmService.getFilmListByLastPage(categoryId, rowPerPage);
		int pageSize = 5; // 한 페이지에 표시할 페이지 번호 수
		
		int startPage = Math.max(1, currentPage - pageSize / 2); // 시작 페이지 계산
		int endPage = Math.min(lastPage, startPage + pageSize - 1); // 끝 페이지 계산

		// 페이지 범위가 부족할 경우 보정
		if (endPage - startPage < pageSize - 1) {
		    startPage = Math.max(1, endPage - pageSize + 1);
		}
		log.debug("startPage : " + startPage);
		log.debug("endPage : " + endPage);
		log.debug("lastPage : " + lastPage);
		
		model.addAttribute("lastPage",lastPage);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);

		return "on/filmList";
		
	}
	
	@PostMapping("/on/addFilm")
	public String addFilm(FilmForm filmForm) {
		// film이 못오는 이유는 specialFeatures이 배열이기 때문에 
		// filmService : filmForm -> film
		filmService.addFilm(filmForm);
		log.debug(filmForm.toString());
		return "redirect:/on/filmList";
	}
	
	@GetMapping("/on/addFilm")
	public String addFilm(Model model) {
		// languageList
		List<Language> languageList = languageService.getLanguageList(0, 0);
		log.debug(languageList.toString());
		model.addAttribute("languageList",languageList);
		return "on/addFilm";
	}
	
	@GetMapping("/on/filmOne")
	public String filmOne(Model model
							, @RequestParam int filmId
							, @RequestParam(required = false) String searchName) {
		
		/*
		 *  1) 현재필름 정보
		 *  2) 전체 카테고리
		 *  3) 현재필름의 카테고리
		 *  4) 검색 배우 리스트(searchName이 null이 아닐때)
		 *  5) 현재필름의 배우 리스트
		 */
		
		// 1)
		Map<String, Object> film = filmService.getFilmOne(filmId);
		// 2) 
		List<Category> allCategoryList = categoryService.getCategoryList();
		// 3)
		List<Map<String, Object>> filmCategoryList = filmCategoryService.getFilmCategoryListByFilm(filmId);
		// 4)
		if(searchName != null) { // 배우 검색 버튼요청으로 왔다면 
			List<Actor> searchActorList = actorService.getActorListByActor(searchName);
			model.addAttribute("searchActorList",searchActorList); // 4
		}
		// 5)
		List<Actor> actorList = actorService.getActorListByFilm(filmId);
		
		model.addAttribute("film",film); // 1
		model.addAttribute("allCategoryList",allCategoryList); // 2
		model.addAttribute("filmCategoryList",filmCategoryList); // 3
		model.addAttribute("actorList", actorList); // 5
		
		
		
		return "on/filmOne";
	}
}
