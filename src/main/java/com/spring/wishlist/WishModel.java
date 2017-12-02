package com.spring.wishlist;

import java.util.Date;

import lombok.Data;

@Data
public class WishModel {

	int wish_num;
	String member_id; // 회원id
	int wish_book_num; // 책 번호
	String wish_book_name; // 책 이름
	int wish_book_price; // 책 가격
	String wish_book_image; // 책 이미지
	int wish_book_count; // 책 수량
	String wish_comment; // 회원 코멘트
	Date wish_date; // 날짜
}
