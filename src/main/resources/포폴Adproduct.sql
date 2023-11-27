DROP TABLE PRODUCT_TBL;

CREATE TABLE PRODUCT_TBL(
        PRO_NUM             NUMBER  CONSTRAINT  PK_PRO_NUM PRIMARY KEY,
        CG_CODE             NUMBER                  NULL,
        PRO_NAME            VARCHAR2(50)            NOT NULL,
        PRO_PRICE           NUMBER                  NOT NULL,
        PRO_DISCOUNT        NUMBER                  NOT NULL,
        PRO_PUBLISHER       VARCHAR2(50)            NOT NULL,
        PRO_CONTENT         VARCHAR2(4000)/* CLOB */NOT NULL,       -- 내용이 4000BYTE 초과여부판단?
        PRO_UP_FOLDER       VARCHAR2(50)            NOT NULL,
        PRO_IMG             VARCHAR2(200)           NOT NULL,  -- 날짜폴더경로가 포함하여 파일이름저장
        PRO_AMOUNT          NUMBER                  NOT NULL,
        PRO_BUY             CHAR(1)                 NOT NULL, -- Y OR N
        PRO_DATE            DATE DEFAULT SYSDATE    NOT NULL,
        PRO_REGISTDATE      DATE DEFAULT SYSDATE    NOT NULL,
        FOREIGN KEY(CG_CODE) REFERENCES CATEGORY_TBL(CG_CODE)
);

CREATE SEQUENCE SEQ_PRODUCT_TBL;
DELETE SEQUENCE SEQ_PRODUCT_TBL;

-- 상품등록 데이터 삽입
INSERT INTO
    PRODUCT_TBL(PRO_NUM, CG_CODE, PRO_NAME, PRO_PRICE, PRO_DISCOUNT, PRO_PUBLISHER, PRO_CONTENT, PRO_UP_FOLDER, PRO_IMG, PRO_AMOUNT, PRO_BUY)
VALUES
    (SEQ_PRODUCT_TBL.NEXTVAL() #{}, #{}, #{}, #{}, #{}, #{},#{},#{}, #{}, #{})
    
    