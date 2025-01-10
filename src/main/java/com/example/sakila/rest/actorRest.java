package com.example.sakila.rest;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.sakila.service.ActorService;

@RestController
public class actorRest {
	@Autowired ActorService actorService;
	
	@GetMapping("/rest/actorList/{currentPage}")
	public List<Map<String, Object>> actorList(@PathVariable Integer currentPage) {
		return actorService.getActorList2(currentPage);
	}
}
