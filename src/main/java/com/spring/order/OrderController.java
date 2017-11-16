package com.spring.order;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.basket.BasketModel;
import com.spring.basket.BasketService;
import com.spring.book.BooksModel;
import com.spring.book.BooksService;

@Controller
public class OrderController {

	@Resource
	private OrderService orderService;

	@Resource
	private BooksService booksService;
	
	@Resource
	private BasketService basketService;

	ModelAndView mv = new ModelAndView();
	BasketModel basketModel = new BasketModel();
	String session_id;

	// 단일 주문
	@RequestMapping(value = "/order/singleOrder.do", method = RequestMethod.GET)
	public ModelAndView singleOrderForm(HttpServletRequest request, HttpSession session) {

		session_id = "test3";
		
		int book_num = Integer.parseInt(request.getParameter("book_num"));
		int order_book_count = Integer.parseInt(request.getParameter("order_book_count"));
		BooksModel booksModel = booksService.bookOne(book_num);
		
		mv.addObject("book", booksModel);
		mv.addObject("order_book_count", order_book_count);
		mv.addObject("session_id", session_id);
		mv.setViewName("singleOrder");

		return mv;
	}
	
	// 전체 주문
	@RequestMapping(value = "/order/totalOrder.do", method = RequestMethod.GET)
	public ModelAndView totalOrderForm(HttpServletRequest request, HttpSession session) {
		
		session_id = "test3";
		basketModel.setMember_id(session_id);
		
		List<BasketModel> basketList = basketService.basketList(basketModel);
		
		mv.addObject("basketList", basketList);
		mv.setViewName("totalOrder");
		
		return mv;
	}
	
	// 선택 주문
	@RequestMapping(value = "/order/selectOrder.do", method = RequestMethod.GET)
	public ModelAndView selectOrderForm(HttpServletRequest request, HttpSession session) {
		
		session_id = "test3";
		
		mv.setViewName("selectOrder");
		
		return mv;
	}

}
