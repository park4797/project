package com.project.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.domain.BoardVO;
import com.project.service.BoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/board/*")
@RequiredArgsConstructor
public class BoardController {

	private final BoardService boardService;
	
	@GetMapping("/register")
	public void register() {
		log.info("called register...");
	}
	
	@PostMapping("/register")
	public String register(BoardVO vo) {
		
		log.info("작성내용" + vo);
		
		boardService.register(vo);
		
		return "redirect:/";
	}
	
}
