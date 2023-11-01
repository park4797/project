package com.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.project.domain.BoardVO;
import com.project.domain.Criteria;
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

//	@Override
//	public List<BoardVO> getList(BoardVO vo) {
//		return boardMapper.getList(vo);
//	}

	@Override
	public List<BoardVO> getListWithPaging(Criteria cri) {
		return boardMapper.getListWithPaging(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		return boardMapper.getTotalCount(cri);
	}

}