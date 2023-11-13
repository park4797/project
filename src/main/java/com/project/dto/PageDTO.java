package com.project.dto;

import com.project.domain.Criteria;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class PageDTO {

	private int startPage; // 시작페이지 번호
	private int endPage; // 마지막 페이지 번호
	
	private boolean prev, next; // 페이지 번호에 따른 이전, 다음 표시
	
	private int total; // 테이블 데이터 총 갯수
	
	private Criteria cri; // 페이징과 검색 작업을 위함
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		int pageSize = 10;
		int endPageInfo = pageSize -1;
		
		// 알고리즘 적용
		this.endPage = (int) (Math.ceil(cri.getPageNum() / (double) pageSize)) * pageSize;
		
		// this.startPage = 10 - 9;
		this.startPage = this.endPage - endPageInfo;
		
		// int readEnd = (int) (Math.ceil((13 * 1.0) / 5 ));
		int readEnd = (int) (Math.ceil((total * 1.0) /cri.getAmount()));
		
		if(readEnd <= this.endPage) {
			this.endPage = readEnd;
		}
		
		this.prev = this.startPage > 1;
		
		this.next = this.endPage < readEnd;
	}
}
