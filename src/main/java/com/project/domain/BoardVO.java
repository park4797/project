package com.project.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	private long bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date mdfdate;
	private int viewcount;
	
}

/*
CREATE TABLE BOARD (
	    BNO             NUMBER,
	    TITLE           VARCHAR2(100)   NOT NULL,
	    CONTENT         VARCHAR2(1000)  NOT NULL,
	    WRITER          VARCHAR2(100)   NOT NULL,
	    REGDATE         DATE    DEFAULT SYSDATE,
	    MDFDATE     DATE    DEFAULT SYSDATE,
	    VIEWCOUNT       NUMBER,
	    CONSTRAINT PK_BOARD PRIMARY KEY(BNO)
	);
*/