package com.project.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.BoardVO;
import com.project.domain.Criteria;
import com.project.dto.PageDTO;
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
	public String register(BoardVO vo) throws Exception {
		
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
		
//		PageDTO pageDTO = new PageDTO(cri, total);
//		model.addAttribute("pageMaker", pageDTO);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
//		log.info("페이징 정보" + cri);
	}
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		
		log.info("게시물번호 : " + bno);
		log.info("페이징과 검색정보" + cri);
		
		BoardVO board = boardService.get(bno);
		model.addAttribute("board", board);
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO board, Criteria cri, RedirectAttributes rttr) throws Exception {
		
		log.info("수정데이터" + board);
		log.info("페이지정보" + cri);
		
		// DB 저장
		boardService.modify(board);
		
		return "redirect:/board/list" + cri.getListLink();
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam("bno") Long bno, Criteria cri, RedirectAttributes rttr) throws Exception {
		
		boardService.delete(bno);
		
		return "redirect:/board/list" + cri.getListLink();
	}
}
