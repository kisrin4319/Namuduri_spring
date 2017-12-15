package com.spring.faq;

import java.util.Date;

import lombok.Data;

@Data
public class FaqModel {
	
	private int faq_num; 
	private String faq_title;
	private String member_id;
	private String faq_content;
	private String faq_category; // 카테고리
	private int readcount; // 조회수
	private Date faq_regdate;

}
