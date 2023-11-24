package com.project.controller;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.project.domain.CategoryVO;
import com.project.service.AdCategoryService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@ControllerAdvice(basePackages = {"com.project.controller"})
@RequiredArgsConstructor
public class GlobalControllerAdvice {
	
	private final AdCategoryService adCategoryService;

	@ModelAttribute // advice에서 Model 추가시 어노테이션도 추가해주어야 한다.
	public void getFirstCategoryList(Model model) {
		
		log.info("1차카테고리 리스트");
		
		List<CategoryVO> firstCategoryList = adCategoryService.getFirstCategoryList();
		model.addAttribute("firstCategoryList", firstCategoryList);
	}
}
