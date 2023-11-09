package com.project.service;

import com.project.domain.MemberVO;

public interface MemberService {

	void join(MemberVO vo);
	
	String idCheck(String user_id);
}
