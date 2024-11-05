package com.example.sakila.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public String actorList(@RequestParam(defaultValue = "1") int currentPage,
							@RequestParam(defaultValue = "10") int rowPerPage) {
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
