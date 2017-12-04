package com.spring.main;

import java.util.ArrayList;
import java.util.List;

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
		
		List<BooksModel> booksDateList = new ArrayList<BooksModel>();
		List<BooksModel> bestSellerList = new ArrayList<BooksModel>();
		
		booksDateList = booksService.booksListDate();
		bestSellerList = booksService.bestSellerList();
		
		booksDateList.subList(0, 11);
		bestSellerList.subList(0, 11);
		mv.addObject("booksDateList",booksDateList);
		mv.addObject("bestSellerList",bestSellerList);
		
		
		mv.setViewName("main");
		return mv;
	}
	
}
