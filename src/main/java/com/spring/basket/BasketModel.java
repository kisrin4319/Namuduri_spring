package com.spring.basket;

import java.util.Date;

import lombok.Data;

@Data
public class BasketModel {

	private String member_id; //회원 아이디
    private String basket_book_name; //장바구니의 상품명
    private int basket_book_price; //장바구니의 상품 가격
    private String basket_book_image; //장바구니의 상품 이미지
    private String book_category; //도서 카테고리
    private Date basket_date; //장바구니 생성 날짜
    private int basket_book_count; //장바구니의 상품 수량
    private int basket_num; //장바구니 번호
    private int basket_book_num; //장바구니의 상품 번호
}
