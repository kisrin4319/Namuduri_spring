package com.spring.order;

import java.util.Date;

import lombok.Data;

@Data
public class OrderModel {

	private String order_trade_num; //주문번호
	private String order_trans_num; //배송번호
	private String order_receive_name; //수취인
	private String order_receive_zipcode; //수취인 우편번호 
	private String order_receive_addr1; //수취인 주소
	private String order_receive_addr2; //수취인 상세주소
	private String order_receive_mobile; //수취인 집전화번호
	private String order_receive_phone; //수취인 휴대폰번호
	private String order_receive_memo; //요청사항
	private int order_receive_moneysum; //총금액
	private String order_trade_status; //결제방법 
	private String order_trade_payer; //결제자
	private Date order_regdate; //주문날짜
	private int order_use_yn; //주문 내역 표시 유무
	private String order_trans_status; //배송 상태
	private String member_id; //회원ID
	private String order_bank_name; //입금은행
	private String order_bank_num; //입금 은행 계좌번호
	private String payment_status; //결제 상태

}
