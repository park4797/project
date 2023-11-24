package com.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.dto.EmailDTO;
import com.project.service.EmailService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/email/*")
@RequiredArgsConstructor
public class EmailController {

	private final EmailService emailService;
	
	// 메일인증코드 요청주소
	@GetMapping("/authcode")
	public ResponseEntity<String> authSend(EmailDTO dto, HttpSession session) {
		
		log.info("메일정보" + dto);
		
		ResponseEntity<String> entity = null;
		
		// 인증코드 6자리 생성
		String authCode = "";
		for(int i=0; i<6; i++) {
			authCode += String.valueOf((int)(Math.random() * 10));
		}
		
		log.info("생성한 인증코드 : " + authCode);
		
		// 인증코드 비교목적으로 세션형태로 저장
		session.setAttribute("authCode", authCode);
		
		try {
			emailService.sendMail(dto, authCode); // 인증코드 메일 전송
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
		
	}
	
	// 인증코드 확인작업
	@GetMapping("/confirmAuthCode")
	public ResponseEntity<String> confirmAuthCode(String authCode, HttpSession session) {
		
//		log.info("확인할 인증번호 : " + authCode);
		
		ResponseEntity<String> entity = null;
		
		if(session.getAttribute("authCode") !=null) {
			// 인증일치 여부 확인
			if(authCode.equals(session.getAttribute("authCode"))) {
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
			} else {
				entity = new ResponseEntity<String>("fail", HttpStatus.OK);
			}
		} else {
			// 세션 소멸시
			entity = new ResponseEntity<String>("request", HttpStatus.OK);
		}
		
		return entity;
	}
}
