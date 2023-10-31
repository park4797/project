package com.project.mapper;

import java.util.List;

import com.project.domain.BoardVO;
import com.project.domain.Criteria;

public interface BoardMapper {
	
	void register(BoardVO vo);
	
//	List<BoardVO> getList(BoardVO vo);
	
	List<BoardVO> getListWithPaging(Criteria cri);
	
	int getTotalCount(Criteria cri);
}
