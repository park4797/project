package com.project.mapper;

import java.util.List;

import com.project.domain.Criteria;
import com.project.domain.ProductVO;

public interface AdProductMapper {

	void pro_regist(ProductVO vo);
	
	List<ProductVO> pro_list(Criteria cri);
	
	int getTotalCount(Criteria cri);
}
