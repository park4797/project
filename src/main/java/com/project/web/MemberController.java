package com.project.web;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.MemberVO;
import com.project.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/member/*")
@RequiredArgsConstructor
public class MemberController {

	private final MemberService memberService;
	
	private final PasswordEncoder passwordEncoder;
	
	@GetMapping("/join")
	public void join() {
		
	}
	
	@PostMapping("/join")
	public String join(MemberVO vo, RedirectAttributes rttr) {
		
		log.info(vo);
		
		// 비밀번호 암호화
		vo.setUser_password(passwordEncoder.encode(vo.getUser_password()));
		
//		log.info("암호화 비밀번호 " + vo.getUser_password());
		
		memberService.join(vo);
		
		return "redirect:/member/login";
	}
	
	@GetMapping("/idCheck")
	public ResponseEntity<String> idCheck(String user_id){
		
		log.info("아이디 : " + user_id);
		
		ResponseEntity<String> entity = null;
		
		// 서비스 메소드 호출
		String idUse = "";
		if(memberService.idCheck(user_id) != null) {
			idUse = "no";
		} else {
			idUse = "yes";
		}
		
		entity = new ResponseEntity<String>(idUse, HttpStatus.OK);
		
		return entity;
	}
	
	@GetMapping("/login")
	public void login() {
		
	}
}
