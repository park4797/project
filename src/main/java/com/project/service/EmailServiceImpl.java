package com.project.service;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.project.dto.EmailDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EmailServiceImpl implements EmailService {

	private final JavaMailSender mailSender;

	@Override
	public void sendMail(EmailDTO dto, String message) {
		
		// 메일 구성정보를 담당하는 객체
		MimeMessage mimeMessage = mailSender.createMimeMessage();
		
		try {
			// 수신자
			mimeMessage.addRecipient(RecipientType.TO, new InternetAddress(dto.getReceiverMail()));
			
			// 발신자
			mimeMessage.addFrom(new InternetAddress[] {new InternetAddress(dto.getSenderMail(), dto.getSenderName())});
			
			// 메일제목
			mimeMessage.setSubject(dto.getSubject(), "utf-8");
			
			// 메일내용
			mimeMessage.setText(message, "utf-8");
			
			// 메세지 전송(정보들이 모두 객체에 담긴다.)
			mailSender.send(mimeMessage);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
