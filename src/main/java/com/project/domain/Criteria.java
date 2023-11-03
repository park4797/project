package com.project.domain;

import lombok.Setter;
import lombok.Getter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class Criteria {

	private int pageNum; // 선택된 페이지 번호를 저장할 필드
	private int amount; // 페이지마다 출력할 게시물 수
	
	private String type; // 검색 타입(종류)
	private String keyword; // 검색어
	
	public Criteria() {
		this(1,10); // pageNum, amount
		System.out.println("기본생성자");
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	// type값을 받기 위한 작업
	public String[] getTypeArr() {
		
		return type == null? new String[] {} : type.split("");
	}
}
