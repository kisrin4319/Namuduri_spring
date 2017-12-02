package com.spring.usedbook;

import java.util.Date;

import lombok.Data;
@Data
public class UsedBooksModel {

	private int used_book_num;
	private String book_category;
	private String book_name;
	private String book_auth;
	private String company_id;
	private int	book_price;
	private int book_new_price;
	private String book_image;
	private Date used_book_regdate;
	private String used_book_status;
	private String member_id;
	private int book_num;	
}
