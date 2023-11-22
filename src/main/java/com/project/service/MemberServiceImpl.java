package com.project.service;

import org.springframework.stereotype.Service;

import com.project.domain.MemberVO;
import com.project.mapper.MemberMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

	private final MemberMapper memberMapper;

	@Override
	public void join(MemberVO vo) {
		memberMapper.join(vo);
	}

	@Override
	public String idCheck(String user_id) {
		return memberMapper.idCheck(user_id);
	}

	@Override
	public MemberVO login(String user_id) {
		return memberMapper.login(user_id);
	}

	@Override
	public void modify(MemberVO vo) {
		memberMapper.modify(vo);
	}

	@Override
	public void loginTimeUpdate(String user_id) {
		memberMapper.loginTimeUpdate(user_id);
	}

	@Override
	public void delete(String user_id) {
		memberMapper.delete(user_id);
	} 
}
