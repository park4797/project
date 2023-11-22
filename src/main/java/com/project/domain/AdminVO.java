package com.project.domain;

import java.util.Date;

import lombok.Data;

@Data
public class AdminVO {

	private String admin_id;
	private String admin_pw;
	private Date admin_login_time;
}

/*
 CREATE TABLE ADMIN_TBL (
    ADMIN_ID    VARCHAR2(20)    PRIMARY KEY,
    ADMIN_PW    CHAR(60)        NOT NULL,
    ADMIN_LOGIN_TIME  DATE      DEFAULT SYSDATE
);
 */
