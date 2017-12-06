package com.spring.main;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.book.BooksModel;
import com.spring.book.BooksService;

@Controller
public class MainController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private BooksService booksService;
	
	@RequestMapping("main.do")
	public ModelAndView mainView(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		
		List<Map<String, Object>> booksDateList = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> bestSellerList = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> newBookList = new ArrayList<Map<String, Object>>();
		
		booksDateList = booksService.booksListDate();
		bestSellerList = booksService.bestSellerList();
		newBookList = booksService.newBookList();
		
		newBookList=newBookList.subList(0, 3);
		
		mv.addObject("booksDateList",booksDateList);
		mv.addObject("bestSellerList",bestSellerList);
		mv.addObject("newBookList",newBookList);
		
		mv.setViewName("main");
		return mv;
	}
	
}
