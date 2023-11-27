package com.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.ProductVO;
import com.project.service.AdProductService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/admin/product/*")
@Controller
@RequiredArgsConstructor
public class AdProductController {
	
	private final AdProductService adProductService;
	
	@GetMapping("/pro_regist")
	public void pro_regist() {
		
	}
	
	@PostMapping("/pro_regist")
	public String pro_regist(ProductVO vo, RedirectAttributes rttr) {
		
		log.info("상품정보" + vo);
		
		// 상품정보 저장
		adProductService.pro_regist(vo);
		
		return "redirect:/admin/admin_menu";
	}
}
