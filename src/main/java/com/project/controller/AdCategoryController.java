package com.project.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.domain.CategoryVO;
import com.project.service.AdCategoryService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/admin/category/*")
@Controller
@Log4j
@RequiredArgsConstructor
public class AdCategoryController {
	
	private final AdCategoryService adCategoryService;
	
	// firstCategory는 GlobalController에서 출력작업을 했다.
	@ResponseBody // @Controller로 ajax 사용시 사용
	@GetMapping("/secondCategory/{cg_parent_code}")
	public ResponseEntity<List<CategoryVO>> secondCategory(@PathVariable("cg_parent_code") Integer cg_parent_code) throws Exception {
		
		// ??
		log.info("카테고리 코드" + cg_parent_code);
		
		ResponseEntity<List<CategoryVO>> entity = null;
		
		entity = new ResponseEntity<List<CategoryVO>>(adCategoryService.getSecondCategoryList(cg_parent_code), HttpStatus.OK);
		
		return entity;
	}
}
