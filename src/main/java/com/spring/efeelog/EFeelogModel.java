package com.spring.efeelog;

import java.util.Date;

import lombok.Data;

@Data
public class EFeelogModel {

	private String member_id;
	private int book_num;
	private String book_memo;
	private Date Efeelog_regdate;
}
