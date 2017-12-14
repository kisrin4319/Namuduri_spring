package com.spring.coupon;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CouponController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private CouponService couponService;
	
	@RequestMapping("/coupon/couponCheck.do")
	public @ResponseBody int couponCheck(HttpServletRequest request) {
		
	int flag = couponService.CouponSelectOne(request.getParameter("coupon_code"));
	
	return flag;
	}
	@RequestMapping("/coupon/couponUse.do")
	public @ResponseBody int couponUse(HttpServletRequest request) {
		int price = couponService.CouponUse(request.getParameter("coupon_code"));
		return price;
	}
}
