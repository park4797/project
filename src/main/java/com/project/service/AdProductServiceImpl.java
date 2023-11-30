package com.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.project.domain.Criteria;
import com.project.domain.ProductVO;
import com.project.mapper.AdProductMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdProductServiceImpl implements AdProductService {

	private final AdProductMapper adProductMapper;

	@Override
	public void pro_regist(ProductVO vo) {
		adProductMapper.pro_regist(vo);
	}

	@Override
	public List<ProductVO> pro_list(Criteria cri) {
		return adProductMapper.pro_list(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		return adProductMapper.getTotalCount(cri);
	}
}
