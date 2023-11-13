-- 게시판 작업
CREATE TABLE BOARD (
    BNO             NUMBER,
    TITLE           VARCHAR2(100)   NOT NULL,
    CONTENT         VARCHAR2(1000)  NOT NULL,
    WRITER          VARCHAR2(100)   NOT NULL,
    REGDATE         DATE    DEFAULT SYSDATE,
    MDFDATE         DATE    DEFAULT SYSDATE,
    VIEWCOUNT       NUMBER DEFAULT 0,
    CONSTRAINT PK_BOARD PRIMARY KEY(BNO)
);

CREATE SEQUENCE SEQ_BOARD;

INSERT INTO BOARD(BNO, TITLE, CONTENT, WRITER)
VALUES(SEQ_BOARD.NEXTVAL, '사과', '과일', 'juicy');

INSERT INTO BOARD(BNO, TITLE, CONTENT, WRITER)
SELECT SEQ_BOARD.NEXTVAL, TITLE, CONTENT, WRITER FROM BOARD;

drop sequence seq_board;

UPDATE BOARD SET viewcount = 0;

commit;

SELECT * FROM BOARD;

<SELECT id="getListWithPaging" resultType="com.demo.domain.BoardVO" parameterType="com.demo.domain.Criteria">
		<![CDATA[
		SELECT BNO, TITLE, CONTENT, WRITER, REGDATE, UPDATEDDATE, VIEWCOUNT
		FROM (
		      SELECT /*+INDEX_DESC(board pk_board) */
		      	ROWNUM rn, BNO, TITLE, CONTENT, WRITER, REGDATE, UPDATEDDATE, VIEWCOUNT
		      FROM 
		      	BOARD
		      WHERE
		      ]]>
		      <!-- refid : reference id -->
		      <include refid="criteria"></include>
		      
		      <![CDATA[
		      ROWNUM <= 1 * 10
			 )
		WHERE rn > (1 -1) * 10;
		]]>
 	</SELECT>

SELECT COUNT(*)
FROM BOARD
WHERE BNO > 0

<sql id="criteria">
 	<!-- prefixOverrides : 실행될 쿼리의 <trim> 문 안에 쿼리 가장 앞에 해당하는 문자들이 있으면 자동으로 지워준다 -->
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
    
SELECT BNO, TITLE, CONTENT, WRITER, REGDATE, UPDATEDDATE
FROM BOARD WHERE BNO = ?;

UPDATE BOARD
SET TITLE, CONTENT, MDFDATE = SYSDATE
WHERE BNO = #BNO;

-- 조회수 작업
<UPDATE id="readCount" parameterType="Long">
 		UPDATE BOARD SET VIEWCOUNT = VIEWCOUNT +1 WHERE BNO = #{bno}
</update>