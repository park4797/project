package com.project.service;

import org.springframework.stereotype.Service;

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
}
