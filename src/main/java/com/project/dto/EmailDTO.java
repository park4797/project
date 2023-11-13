package com.project.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class EmailDTO {
	
	private String senderName; // 발신자
	private String senderMail; // 발신자 메일
	private String receiverMail; // 수신자 메일
	private String subject; // 메일 제목
	private String message; // 메일 본문
	
	public EmailDTO() {
		this.senderMail = "PakMall";
		this.senderName = "PakMall";
		this.subject = "PakMall 회원가입 인증코드 입니다.";
		this.message = "인증코드 환인 후 회원가입 인증코드 입력란에 입력바랍니다.";
	}
}
