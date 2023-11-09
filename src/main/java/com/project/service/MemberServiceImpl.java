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
}
