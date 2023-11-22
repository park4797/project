package com.project.web;

import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.AdminVO;
import com.project.service.AdminService;

import lombok.RequiredArgsConstructor;
import lombok.extern.java.Log;

@RequestMapping("/admin/*")
@Log
@Controller
@RequiredArgsConstructor
public class AdminController {
	
	private final AdminService adminService;
	
	private final PasswordEncoder passwordEncoder;
	
	@GetMapping("/intro") // /admin/intro
	public String adminLogin() {
		
		return "/admin/adminLogin";
	}
	
	@PostMapping("/admin_ok")
	public String admin_ok(AdminVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
		// 기존의 로그인 작업과 유사
		
		log.info("관리자 로그인 : " + vo);
		
		AdminVO db_vo = adminService.admin_ok(vo.getAdmin_id());
		
		String url = "";
		String msg = "";
		
		if(db_vo != null) {
			if(passwordEncoder.matches(vo.getAdmin_pw(), db_vo.getAdmin_pw())) {
				
				// 비밀번호 일치시 세션에 저장
				session.setAttribute("adminStatus", db_vo);
				
				url = "#";
				
			} else {
				url = "/admin/intro";
				msg = "failPW";
				rttr.addFlashAttribute("msg", msg);
			}
				
		} else {
			url = "/admin/intro";
			msg = "failPW";
			rttr.addFlashAttribute("msg", msg);
		}
		
		return "redirect:/" + url;
	}
	
}
