package com.spring.coupon;

import java.util.Date;

import lombok.Data;

@Data
public class CouponModel {
	
	private String coupon_code;
	private int coupon_price;
	private Date coupon_date;

}
