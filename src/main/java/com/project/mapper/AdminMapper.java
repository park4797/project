package com.project.mapper;

import com.project.domain.AdminVO;

public interface AdminMapper {

	// 관리자 로그인 작업
	AdminVO admin_ok(String admin_id);
}
