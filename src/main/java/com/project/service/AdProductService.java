package com.project.service;

import java.util.List;

import com.project.domain.Criteria;
import com.project.domain.ProductVO;

public interface AdProductService {

	void pro_regist(ProductVO vo);
	
	List<ProductVO> pro_list(Criteria cri);
	
	int getTotalCount(Criteria cri);
}
