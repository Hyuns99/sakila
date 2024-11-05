package com.example.sakila.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.multipart.MultipartFile;

import com.example.sakila.service.ActorService;
import com.example.sakila.vo.Actor;
import com.example.sakila.vo.ActorForm;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Slf4j
@Controller
public class ActorController {
	@Autowired ActorService actorService;
	
	@GetMapping("/on/actorList")
	public String actorList(Model model, @RequestParam(defaultValue = "1") int currentPage,
							@RequestParam(defaultValue = "10") int rowPerPage) {
		
		Map<String, Object> map = new HashMap<>();
		int beginRow = (currentPage - 1) * rowPerPage;
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		
		int lastPage = actorService.getListPage(rowPerPage);
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		
		return "on/actorList";
	}
	
	@PostMapping("/on/addActor")
	public String addActor(HttpSession session ,ActorForm actorForm) { // input type="file"
		/*
		log.debug(actorForm.getFirstName());
		log.debug(actorForm.getLastName());
		log.debug("actorFile : " + actorForm.getActorFile().size());
		if(actorForm.getActorFile() != null) {
			log.debug("actorFile : " + actorForm.getActorFile().size());
		}
		*/
		String path = session.getServletContext().getRealPath("/upload");
		actorService.addActor(actorForm, path);
		
		return "redirect:/on/actorList";
	}
	@GetMapping("/on/addActor")
	public String addActor() {
		
		return "on/addActor";
	}
	
}
