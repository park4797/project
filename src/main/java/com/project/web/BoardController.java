package com.project.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.domain.BoardVO;
import com.project.domain.Criteria;
import com.project.domain.PageDTO;
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
		
		return "redirect:/board/list";
	}
	
	
	// /board/list?pageNum=2&amount=10
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {

		log.info("list : " + cri);
		// 목록데이터 출력(제한을 두어야 한다. 현재는 전부 출력)
//		List<BoardVO> list = boardService.getList(vo);
		
		// 1) 페이지에 보여줄 목록데이터
		// 목록데이터와 페이지를 출력하려면 cri 매개변수를 가지고 있으므로
		List<BoardVO> list = boardService.getListWithPaging(cri);
		model.addAttribute("list", list);
		
		// 2) 페이징 기능 PageDTO 구성(페이지 번호에 기능 구현)
		int total = boardService.getTotalCount(cri);
		
		log.info("데이터 갯수" + total);
		
		PageDTO pageDTO = new PageDTO(cri, total);
		model.addAttribute("pageMaker", pageDTO);
	}
}
