package com.project.service;

import com.project.dto.EmailDTO;

public interface EmailService {

	void sendMail(EmailDTO dto, String message);
}
