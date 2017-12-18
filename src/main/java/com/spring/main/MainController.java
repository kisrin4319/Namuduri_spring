package com.spring.main;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.book.BooksService;
import com.spring.coupon.CouponService;

@Controller
public class MainController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private BooksService booksService;
	
	@Resource
	private CouponService couponService;
	
	@RequestMapping("main.do")
	public ModelAndView mainView(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		
		List<Map<String, Object>> booksDateList = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> bestSellerList = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> newBookList = new ArrayList<Map<String, Object>>();
		
		booksDateList = booksService.booksListDate();
		bestSellerList = booksService.bestSellerList();
		newBookList = booksService.newBookList();
		
		newBookList=newBookList.subList(0, 5);
		
		//쿠폰 생성 영역
		// 매월 1일 일때만 쿠폰 생성
		
		Calendar calendar = Calendar.getInstance();

		if(calendar.get(calendar.DAY_OF_MONTH) ==1) {
			Cookie[] cookies = request.getCookies();
			if(cookies.length==0) {
				Cookie cookie = new Cookie("expire","expire");
				cookie.setMaxAge(60*60*24);
				cookie.setPath("/");
				response.addCookie(cookie);
				
				couponService.CouponInsert();
			}
		}
		couponService.CouponDeleteAll();
		
		mv.addObject("booksDateList",booksDateList);
		mv.addObject("bestSellerList",bestSellerList);
		mv.addObject("newBookList",newBookList);
		
		mv.setViewName("main");
		return mv;
	}
	
}
