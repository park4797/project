package com.project.mapper;

import com.project.domain.MemberVO;

public interface MemberMapper {
	
	// 회원이 입력한 정보 받기
	void join(MemberVO vo);
	
	// 회원 아이디 중복검사
	String idCheck(String user_id);
	
	// 로그인(비밀번호는 암호화가 되어있어 컨트롤러 파트에서 유효성검사)
	MemberVO login(String user_id);
	
	// 회원 수정
	void modify(MemberVO vo);
	
	// header에 로그인 시간 밑 간략한 정보 출력
	void loginTimeUpdate(String user_id);
	
	// 회원탈퇴
	void delete(String user_id);
}
