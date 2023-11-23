package com.project.web;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.service.AdCategoryService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/admin/category/*")
@Controller
@Log4j
@RequiredArgsConstructor
public class AdCategoryController {
	
	private final AdCategoryService categoryService;
	
	@ResponseBody // @Controller로 ajax 사용시 사용
	@GetMapping("/getCategory/{cg_parent_code}")
	public ResponseEntity<String> getCategory(@PathVariable("cg_parent_code") Integer cg_parent_code) throws Exception {
		
		log.info("1차카테고리 코드" + cg_parent_code);
		
		ResponseEntity<String> entity = null;
		
		return entity;
	}
}
