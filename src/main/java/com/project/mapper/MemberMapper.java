package com.project.mapper;

import com.project.domain.MemberVO;

public interface MemberMapper {
	
	// 회원이 입력한 정보 받기
	void join(MemberVO vo);
	
	// 회원 아이디 중복검사
	String idCheck(String user_id);
}
