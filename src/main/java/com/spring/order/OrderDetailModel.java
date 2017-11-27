package com.spring.order;

import java.util.Date;

import lombok.Data;

@Data
public class OrderDetailModel {

	private String order_trade_num; //주문번호
	private int book_num; //도서 번호
	private String order_book_name; //주문 도서 제목
	private int order_book_price; // 주문 도서 가격
	private int order_book_count; //주문 도서 수량
	

}
