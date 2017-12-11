package com.spring.efeelog;

import java.util.Date;

import lombok.Data;

@Data
public class EFeelogModel {

	private String member_id;
	private String Efeelog_image;
	private String Efeelog_name;
	private String Efeelog_memo;
	private Date Efeelog_regdate;
	private int book_num;
}
