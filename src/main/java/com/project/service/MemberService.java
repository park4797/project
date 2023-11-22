package com.project.service;

import com.project.domain.MemberVO;

public interface MemberService {

	void join(MemberVO vo);
	
	String idCheck(String user_id);
	
	MemberVO login(String user_id);
	
	void modify(MemberVO vo);
	
	void loginTimeUpdate(String user_id);
	
	void delete(String user_id);
}
