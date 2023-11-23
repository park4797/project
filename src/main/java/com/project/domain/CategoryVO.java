package com.project.domain;

import lombok.Data;

@Data
public class CategoryVO {
	private Integer cg_code;
	private Integer cg_parent_code;
	private String cg_name;
}

/* cg_code, cg_parent_code, cg_name
CREATE TABLE CATEGORY_TBL(
    CG_CODE             NUMBER          PRIMARY KEY, -- 카테고리 코드
    CG_PARENT_CODE      NUMBER          NULL,        -- 상위카테고리 코드(최상위 카테고리는 상위 카테고리가 없기때문에 NULL)
    CG_NAME             VARCHAR2(50)    NOT NULL,
    FOREIGN KEY(CG_PARENT_CODE) REFERENCES CATEGORY_TBL(CG_CODE) -- foreign key는 부모키를 자식으로 가져온다
);
*/