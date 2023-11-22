-- user info 작업(어떤 홈페이지를 사용할건지 확인후 작업)
-- 회원가입 테이블
CREATE TABLE USER_INFO(
        USER_ID             VARCHAR2(15),
        USER_NAME           VARCHAR2(30)            NOT NULL,
        USER_EMAIL          VARCHAR2(50)            NOT NULL,
        USER_PASSWORD       CHAR(60)               NOT NULL,
        USER_ZIPCODE        CHAR(6)                 NOT NULL,
        USER_ADDR           VARCHAR2(100)            NOT NULL,
        USER_DEADDR         VARCHAR2(100)            NOT NULL,
        USER_PHONE          VARCHAR2(15)            NOT NULL,
        USER_POINT          NUMBER DEFAULT 0        NOT NULL,
        USER_LASTLOGIN      DATE DEFAULT SYSDATE    NOT NULL,
        USER_DATESUB        DATE DEFAULT SYSDATE    NOT NULL,
        USER_UPDATEDATE     DATE DEFAULT SYSDATE    NOT NULL
);

DROP TABLE USER_INFO;

ALTER TABLE USER_INFO
ADD CONSTRAINT PK_USER_ID PRIMARY KEY (USER_ID);

-- 회원이 입력한 정보 받기
INSERT INTO USER_INFO(USER_ID, USER_NAME, USER_EMAIL, USER_PASSWORD, USER_ZIPCODE, USER_ADDR, USER_DEADDR, USER_PHONE)
VALUES(#{} ~);
-- user_info(user_id, user_name, user_email, user_password, user_zipcode, user_addr, user_deaddr, user_phone

SELECT * FROM USER_INFO;

-- 아이디, 비밀번호 유효성 검사
SELECT * FROM USER_INFO WHERE USER_ID = 'user01' and USER_PASSWORD = '1234';

-- 아이디 중복체크
SELECT USER_ID FROM USER_INFO WHERE USER_ID = USER_ID;

SELECT USER_ID, USER_NAME, USER_EMAIL, USER_PASSWORD, USER_ZIPCODE, USER_ADDR, USER_DEADDR, USER_PHONE FROM USER_INFO WHERE USER_ID = 'user01';

DELETE FROM
    USER_INFO
WHERE
    USER_ID = #{}

-- 로그인 작업
SELECT USER_PASSWORD FROM USER_INFO WHERE USER_ID = ?;

-- 회원정보 수정시 로그인 세션의 정보를 가져가기 위해 컬럼 추가
SELECT
    USER_ID, USER_NAME, USER_EMAIL, USER_PASSWORD, USER_ZIPCODE, USER_ADDR, USER_DEADDR, USER_PHONE, USER_POINT, USER_LASTLOGIN, USER_DATESUB, USER_UPDATEDATE
FROM
    USER_INFO
WHERE
    USER_ID = ?;

-- 회원정보 수정
UPDATE
    USER_INFO
SET
    USER_EMAIL = #{},
    USER_ZIPCODE = #{},
    USER_ADDR = #{},
    USER_DEADDR = #{},
    USER_PHONE = #{}
WHERE
    USER_ID = #{}
    
-- 회원수정시 로그인 시간 업데이트
UPDATE
    USER_INFO
SET
    USER_EMAIL = #{},
    USER_LASTLOGIN = #{}
WHERE
    USER_ID = #{}

-- 회원탈퇴
DELETE FROM
    USER_INFO
WHERE
    USER_ID = #{}
    
commit;