package com.project.web;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.MemberVO;
import com.project.dto.LoginDTO;
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
	public String join(MemberVO vo, RedirectAttributes rttr) throws Exception {
		
		log.info(vo);
		
		// 비밀번호 암호화
		vo.setUser_password(passwordEncoder.encode(vo.getUser_password()));
		
//		log.info("암호화 비밀번호 " + vo.getUser_password());
		
		memberService.join(vo);
		
		return "redirect:/member/login";
	}
	
	// 아이디 중복체크 작업
	@GetMapping("/idCheck")
	public ResponseEntity<String> idCheck(String user_id) throws Exception {
		
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
		
	@PostMapping("/login")
	public String login(LoginDTO dto, HttpSession session, RedirectAttributes rttr) throws Exception {
		// Login 정보를 하나로 받기 위해 id와 password를 DTO 클래스로 만들고, 유효성 검사 실패시 로그인화면으로 초기화하도록 Redirect를 사용
		
//		log.info("로그인 정보 : " + dto);
		
		MemberVO db_vo = memberService.login(dto.getUser_id());
		
		String url = "";
		String msg = "";
		
		// 아이디가 존재하면 true, 존재하지 않으면 false로 db_vo가 null이 된다
		
		// 아이디 일치시
		if(db_vo != null) {
			// 사용자가 입력한 비밀번호와 DB에서 가져온 비밀번호 일치여부 검사
			// passwordEncoder.matches 사용시 사용자가 입력한 평문 텍스트와 DB상의 PW 데이터를 스프링에서 비교해준다.
			if(passwordEncoder.matches(dto.getUser_password(), db_vo.getUser_password())) {
				
				// 로그인 성공결과를 세션에 저장
				session.setAttribute("loginStatus", db_vo);
				
//				log.info("로그인 시간 : " + db_vo);
				
				memberService.loginTimeUpdate(dto.getUser_id());
				
				url = "/";
						
			} else { // 비밀번호 일치여부 확인
				url = "/member/login";
				msg = "비밀번호가 일치하지 않습니다";
				rttr.addFlashAttribute("msg", msg); // jsp에 출력할 메세지를 속성에 추가
			}
				
		} else { // 아이디 일치여부 확인
			url = "/member/login";
			msg = "아이디가 일치하지 않습니다";
			rttr.addFlashAttribute("msg", msg);
		}
		
		return "redirect:" + url;
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate(); // 서버측의 session 메모리 삭제
		
		return "redirect:/";
	}
	
	// 회원정보 수정 전 인증작업
	@GetMapping("/confirm_info")
	public void confirm_info() {
		
	}
	
	@PostMapping("/confirm_info") // 로그인과 동일한 작업
	public String confirm_info(LoginDTO dto, HttpSession session, RedirectAttributes rttr) throws Exception {
		
//		log.info("회원수정 로그인 정보 : " + dto);
		
		MemberVO db_vo = memberService.login(dto.getUser_id());
		
		String url = "";
		String msg = "";
		
		
		if(db_vo != null) {
			// matches
			if(passwordEncoder.matches(dto.getUser_password(), db_vo.getUser_password())) {
				
				session.setAttribute("loginStatus", db_vo);
				
				url = "/member/modify";
						
			} else { // 비밀번호 일치여부 확인
				url = "/member/confirm_info";
				msg = "비밀번호가 일치하지 않습니다";
				rttr.addFlashAttribute("msg", msg); // jsp에 출력할 메세지를 속성에 추가
			}
				
		} else { // 아이디 일치여부 확인
			url = "/member/confirm_info";
			msg = "아이디가 일치하지 않습니다";
			rttr.addFlashAttribute("msg", msg);
		}
		
		return "redirect:" + url;
	}
	
	// 회원수정 폼
	@GetMapping("/modify")
	public void modify(HttpSession session, Model model) throws Exception {
		// 로그인시 session에 저장해둔 정보중 id를 가져와 변수로 선언
		String user_id = ((MemberVO)session.getAttribute("loginStatus")).getUser_id();
		
		MemberVO db_vo = memberService.login(user_id);
		model.addAttribute("memberVO", db_vo);
	}
	
	@PostMapping("/modify")
	public String modify(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
		
//		log.info("회원정보 수정폼 : " + vo);
		
		// 로그인한 회원정보를 가져와 변수로 선언
		MemberVO db_vo = (MemberVO) session.getAttribute("loginStatus");
		
		// DB상의 user_id를 가져온다.
		String user_id = db_vo.getUser_id();
		
		// vo 매개변수로 받아온 id 값을 DB id값으로 변경
		vo.setUser_id(user_id);
		
		// 수정한 이메일 반영
		db_vo.setUser_email(vo.getUser_email());
		
		// header.jsp에 수정된 email 반영
		session.setAttribute("loginStatus", db_vo);
		
		rttr.addFlashAttribute("msg", "success");
		
		// 회원정보 DB 저장
		memberService.modify(vo);
		
		return "redirect:/";
	}
	
	// 마이페이지
	@GetMapping("/mypage")
	public void mypage(HttpSession session, Model model) throws Exception {
		  
		String user_id = ((MemberVO)session.getAttribute("loginStatus")).getUser_id();
						
		MemberVO db_vo = memberService.login(user_id);
		model.addAttribute("memberVO", db_vo);
	}
	  
	// 회원탈퇴 인증
	@GetMapping("/del_confirm_info")
	public void delete() {
		
	}
	
	// 회원탈퇴 작업
	@PostMapping("/delete")
	public String delete(LoginDTO dto, HttpSession session, RedirectAttributes rttr) throws Exception {
		// LoginDTO 현재 로그인한 대상의 ID와 PW, session에 존재하는 id의 정보 
		
//		log.info("로그인 정보" + dto);
		
		// 기존 confirm_info에서 작업한 내용과 유사
		MemberVO db_vo = memberService.login(dto.getUser_id()); // 로그인한 유저의 id 값을 가져온다.
		
		String url = "";
		String msg = "";

		if(db_vo != null) {
			if(passwordEncoder.matches(dto.getUser_password(), db_vo.getUser_password())) {
				url = "/";
				session.invalidate();
				
				// 현재 로그인한 user의 id값을 가져와 삭제 작업
				memberService.delete(dto.getUser_id());
			} else {
				url = "/member/del_confirm_info";
				msg = "비밀번호가 일치하지 않습니다.";
				rttr.addFlashAttribute("msg", msg);
			}
			
		} else {
			url = "member/del_confirm_info";
			msg = "아이디가 일치하지 않습니다.";
			rttr.addAttribute("msg", msg);
		}
		
		return "redirect:" + url;
	}
		
		
}
