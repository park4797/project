-- 게시판 작업
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

CREATE SEQUENCE SEQ_BOARD;

INSERT INTO BOARD(BNO, TITLE, CONTENT, WRITER)
VALUES(SEQ_BOARD.NEXTVAL, '자바', '스프링 게시판', 'user01');

INSERT INTO BOARD(BNO, TITLE, CONTENT, WRITER)
SELECT SEQ_BOARD.NEXTVAL, TITLE, CONTENT, WRITER FROM BOARD;


SELECT BNO, TITLE, CONTENT, WRITER, REGDATE, MDFDATE, VIEWCOUNT
FROM (
	    SELECT /*+INDEX_DESC(board pk_board) */
	    ROWNUM rn, BNO, TITLE, CONTENT, WRITER, REGDATE, MDFDATE, VIEWCOUNT
		FROM BOARD
		WHERE  ROWNUM <= ? * ?
	)
		WHERE rn > ? * ?
</SELECT>

SELECT COUNT(*)
FROM BOARD
WHERE BNO > 0

SELECT BNO, TITLE, CONTENT, WRITER, REGDATE, MDFDATE
FROM BOARD WHERE BNO = ?;

CREATE SEQUENCE SEQ_BOARD;
drop sequence seq_board;

INSERT INTO BOARD(BNO, TITLE, CONTENT, WRITER)
VALUES(SEQ_BOARD.NEXTVAL, '사과', '과일', 'juicy');

INSERT INTO BOARD(BNO, TITLE, CONTENT, WRITER)
SELECT SEQ_BOARD.NEXTVAL, TITLE, CONTENT, WRITER FROM BOARD;


UPDATE BOARD SET viewcount = 0;

commit;

SELECT * FROM BOARD;

SELECT COUNT(*)
FROM BOARD
WHERE BNO > 0

<sql id="criteria">
 		<trim prefix="(" suffix=") AND" prefixOverrides="OR">
 			<foreach collection="typeArr" item="type"><!-- getType() 동작 -->
 				<trim prefix="OR">
 					<choose>
		 				<when test="type == 'T'.toString()">
		 					title like '%' || #{keyword} || '%'
		 				</when>
		 				<when test="type == 'W'.toString()">
		 					writer like '%' || #{keyword} || '%'
		 				</when>
		 				<when test="type == 'C'.toString()">
		 					content like '%' || #{keyword} || '%'
		 				</when>
 					</choose>
 				</trim>
 			</foreach>
 		</trim>
 	</sql>

UPDATE BOARD
SET TITLE, CONTENT, MDFDATE = SYSDATE
WHERE BNO = #BNO;