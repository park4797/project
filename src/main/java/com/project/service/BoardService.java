package com.project.service;

import java.util.List;

import com.project.domain.BoardVO;
import com.project.domain.Criteria;

public interface BoardService {

	void register(BoardVO vo);
	
//	List<BoardVO> getList(BoardVO vo);
	List<BoardVO> getListWithPaging(Criteria cri); // 데이터 목록
	
	int getTotalCount(Criteria cri); // 총 데이터 수
	
	BoardVO get(Long bno);
}
