package com.spring.book;

import java.util.Date;

import lombok.Data;

@Data
//@Data annotation을 사용하면 GETTER,SETTER 메서드가 자동생성 됩니다.(LOMBOK 사용)
public class BooksModel {

	private int book_num; // 도서 번호
	private String book_category; // 도서 카테고리
	private String book_name; // 도서 이름
	private String book_content; // 도서 내용
	private int book_price; // 도서 가격
	private String book_image; //도서 이미지
	private int book_sell_count; // 도서 판매량
	private int book_base_count; // 도서 기초 재고
	private int book_current_count; // 도서 현재 재고
	private String book_publish_date; // 도서 출판 날짜
	private Date book_date; // 도서 등록 날짜
	private String company_id; // 출판사 이름
	private String book_auth; // 도서 작가
	private int book_use_yn; // 도서 활성화 유무
}
