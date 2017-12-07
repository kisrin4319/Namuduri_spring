package com.spring.efeelog;

import java.util.Date;

import lombok.Data;

@Data
public class EFeelogModel {

	private String member_id;
	private String book_image;
	private String book_name;
	private String book_memo;
	private Date efeelog_regdate;
}
