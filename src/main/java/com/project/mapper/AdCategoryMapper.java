package com.project.mapper;

import java.util.List;

import com.project.domain.CategoryVO;

public interface AdCategoryMapper {

	// 1차 카테고리 리스트
	List<CategoryVO> getFirstCategoryList();
	
	// 2차 카테고리 리스트
	List<CategoryVO> getSecondCategoryList(Integer cg_parent_code);
	
}
