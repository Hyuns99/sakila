package com.example.sakila.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.mapper.StaffMapper;
import com.example.sakila.vo.Staff;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LoginController {
	@Autowired
	private StaffMapper staffMapper;
	// 로그인 폼
	@GetMapping("/off/login")
	public String login() {
		
		log.debug("/off/login.jsp 실행");
		
		return "off/login";
	}
	
	// 로그인 액션
	@PostMapping("/off/login")
	public String login(Model model, HttpSession session, @RequestParam(name = "staffId", defaultValue = "1") int staffId, 
			@RequestParam(name = "password") String password) {
			// int staffId = Interger.parseInt(request.getParameter("staffId") 자동으로 들어감 (자동형변환까지 해줌)
			// String password = request.getParameter("password") 자동으로 들어감
			
			Staff paramStaff = new Staff();
			paramStaff.setStaffId(staffId);
			paramStaff.setPassword(password);

			Staff loginStaff = staffMapper.login(paramStaff);
			if(loginStaff == null) {
				model.addAttribute("msg", "로그인에 실패했습니다");
				return "/off/login";
			}
			session.setAttribute("loginStaff", loginStaff);
			log.debug("로그인 성공");
			
		return "redirect:/on/main"; // redirect:/를 쓰면 포워딩 안됨  redirect:/가 직접 찾아서 적어줌
	}
}
