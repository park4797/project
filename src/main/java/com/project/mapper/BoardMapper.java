package com.project.mapper;

import java.util.List;

import com.project.domain.BoardVO;
import com.project.domain.Criteria;

public interface BoardMapper {
	
	void register(BoardVO vo);
	
//	List<BoardVO> getList(BoardVO vo);
	
	// 목록데이터 + 페이징
	List<BoardVO> getListWithPaging(Criteria cri);
	
	int getTotalCount(Criteria cri);
	
	// 게시물 읽기
	BoardVO get(Long bno);
	
	// 게시물 수정
	BoardVO modify(BoardVO board);
}
