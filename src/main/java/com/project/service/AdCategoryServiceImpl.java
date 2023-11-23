package com.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.project.domain.CategoryVO;
import com.project.mapper.AdCategoryMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdCategoryServiceImpl implements AdCategoryService {

	private final AdCategoryMapper categoryMapper;

	@Override
	public List<CategoryVO> getFirstCategoryList() {
		return categoryMapper.getFirstCategoryList();
	}
}
