package com.spring.member;

import java.util.Date;

import lombok.Data;

@Data
public class MemberModel {

	private int member_num;	//회원 번호
	private String member_id; //회원 아이디
	private String member_pw; //회원 비밀번호
	private String member_name; //회원 이름
	private int member_jumin1; //회원 주민번호
	private int member_jumin2; //회원 주민번호
	private String member_email; //회원 이메일
	private String member_email_get; //회원 이메일 동의
	private String member_phone; //회원 전화번호
	private String member_mobile; //회원 핸드폰 번호
	private String member_zipcode; //회원 집주소
	private String member_addr1; //회원 우편번호1
	private String member_addr2; //회원 우편번호2
	private int member_admin; //관리자여부
	private Date member_join_date; //회원가입 날짜
	private String member_bankname; //은행명
	private String member_refund_account; //환불계좌
	private String member_account_holder; //예금주
	private int member_use_yn; //차단여부

}
