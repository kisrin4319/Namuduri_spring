package com.spring.order;

import java.util.ArrayList;
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

		session_id = (String) session.getAttribute("member_id");
		
		int book_num = Integer.parseInt(request.getParameter("book_num"));
		int order_book_count = Integer.parseInt(request.getParameter("order_book_count"));
		BooksModel booksModel = booksService.bookOne(book_num);
		
		int bookMoney = booksModel.getBook_price() * order_book_count;
		int deliveryFee;
		int sumMoney;
		
		if(bookMoney <100000) {
			deliveryFee = 5000;
			sumMoney = bookMoney + deliveryFee;
			} else {
				deliveryFee = 0;
				sumMoney = bookMoney;
			}
		
		mv.addObject("book", booksModel);
		mv.addObject("order_book_count", order_book_count);
		mv.addObject("bookMoney", bookMoney);
		mv.addObject("deliveryFee", deliveryFee);
		mv.addObject("sumMoney", sumMoney);
		mv.addObject("session_id", session_id);
		mv.setViewName("singleOrder");

		return mv;
	}
	
	// 전체 주문
	@RequestMapping(value = "/order/totalOrder.do", method = RequestMethod.GET)
	public ModelAndView totalOrderForm(HttpServletRequest request, HttpSession session) {
		
		session_id = (String) session.getAttribute("member_id");
		basketModel.setMember_id(session_id);
		List<BasketModel> basketList = basketService.basketList(basketModel);
		
		int bookMoney = orderService.totalSum(session_id);
		int deliveryFee;
		int sumMoney;
		
		if(bookMoney < 100000) {
			deliveryFee = 5000;
			sumMoney = bookMoney + deliveryFee;
			} else {
				deliveryFee = 0;
				sumMoney = bookMoney;
			}
		
		mv.addObject("bookMoney", bookMoney);
		mv.addObject("deliveryFee", deliveryFee);
		mv.addObject("sumMoney", sumMoney);
		mv.addObject("basketList", basketList);
		mv.setViewName("totalOrder");
		
		return mv;
	}
	
	// 선택 주문
	@RequestMapping(value = "/order/selectOrder.do")
	public ModelAndView selectOrderForm(HttpServletRequest request, HttpSession session) {
				
		session_id = (String) session.getAttribute("member_id");
		String[] basket_num = request.getParameterValues("RowCheck");
		
		List<BasketModel> selectList = new ArrayList<BasketModel>();
		
		int bookMoney=0;
		int deliveryFee;
		int sumMoney;
		for(int i=0;i<basket_num.length;i++) {
			int num = Integer.parseInt(basket_num[i]);
		selectList.add(orderService.BasketSelect(num));
		bookMoney += orderService.selectSum(num);
		}
		
		if(bookMoney < 100000) {
			deliveryFee = 5000;
			sumMoney = bookMoney + deliveryFee;
			} else {
				deliveryFee = 0;
				sumMoney = bookMoney;
			}
		
		mv.addObject("bookMoney", bookMoney);
		mv.addObject("deliveryFee", deliveryFee);
		mv.addObject("sumMoney", sumMoney);
		mv.addObject("selectList", selectList);
		mv.setViewName("selectOrder");
		
		return mv;
	}

}
