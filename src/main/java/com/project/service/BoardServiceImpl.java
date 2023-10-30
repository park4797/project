package com.project.service;

import org.springframework.stereotype.Service;

import com.project.domain.BoardVO;
import com.project.mapper.BoardMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService{

	private final BoardMapper boardMapper;
	
	@Override
	public void register(BoardVO vo) {
		boardMapper.register(vo);
	}

}
