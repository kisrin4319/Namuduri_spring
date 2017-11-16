package com.spring.book;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewModel {

	private int review_num; // 리뷰 번호
	private int book_num; // 도서 번호
	private String member_id; // 회원ID
	private String review_pw;	// 리뷰 비밀번호
	private String review_content; // 리뷰 내용
	private Date review_regdate; //리뷰 등록 날짜
	private int star_point; // 평점

}
