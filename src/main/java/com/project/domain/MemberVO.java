package com.project.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	
	// member field
	private String user_id;
	private String user_name;
	private String user_email;
	private String user_password;
	private String user_zipcode;
	private String user_addr;
	private String user_deaddr;
	private String user_phone;
	
	private Integer user_point;
	
	private Date user_lastlogin;
	private Date user_datesub;
	private Date user_updatedate;
	
}


/*
CREATE TABLE USER_INFO(
        USER_ID             VARCHAR2(15),
        USER_NAME           VARCHAR2(30)            NOT NULL,
        USER_EMAIL          VARCHAR2(50)            NOT NULL,
        USER_PASSWORD       CHAR(60)               NOT NULL,
        USER_ZIPCODE        CHAR(5)                 NOT NULL,
        USER_ADDR           VARCHAR2(100)            NOT NULL,
        USER_DEADDR         VARCHAR2(100)            NOT NULL,
        USER_PHONE          VARCHAR2(15)            NOT NULL,
        USER_POINT          NUMBER DEFAULT 0        NOT NULL,
        USER_LASTLOGIN      DATE DEFAULT SYSDATE    NOT NULL,
        USER_DATESUB        DATE DEFAULT SYSDATE    NOT NULL,
        USER_UPDATEDATE     DATE DEFAULT SYSDATE    NOT NULL
); 
 */
