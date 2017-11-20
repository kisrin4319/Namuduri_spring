package com.spring.order;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.basket.BasketModel;
import com.spring.basket.BasketService;
import com.spring.book.BooksModel;
import com.spring.book.BooksService;
import com.spring.member.MemberModel;
import com.spring.member.MemberService;
import com.spring.member.ZipcodeModel;

@Controller
public class OrderController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private OrderService orderService;

	@Resource
	private BooksService booksService;
	
	@Resource
	private BasketService basketService;

	@Resource
	private MemberService memberService;
	
	ModelAndView mv = new ModelAndView();
	BasketModel basketModel = new BasketModel();
	String session_id;
	
	// 단일 주문
	@RequestMapping(value = "/order/singleOrder.do", method = RequestMethod.GET)
	public ModelAndView singleOrderForm(HttpServletRequest request, HttpSession session) {

		session_id = (String) session.getAttribute("member_id");
		
		int basket_num = 0;
		if(request.getParameter("basket_num") != null) {
		basket_num = Integer.parseInt(request.getParameter("basket_num"));
		}
		
		int book_num = Integer.parseInt(request.getParameter("book_num"));
		int order_book_count = Integer.parseInt(request.getParameter("order_book_count"));
		BooksModel booksModel = booksService.bookOne(book_num);
		MemberModel memberModel = memberService.SelectOne(session_id);
		
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
		mv.addObject("memberModel",memberModel);
		mv.addObject("basket_num", basket_num);
		mv.setViewName("singleOrder");

		return mv;
	}
	
	// 단일 주문 완료
	@RequestMapping(value = "/order/singleOrder.do", method = RequestMethod.POST)
	ModelAndView singleOrder(@ModelAttribute OrderModel orderModel, @ModelAttribute OrderDetailModel orderDetailModel, int book_num, int basket_num, HttpSession session) {
		
		session_id = (String) session.getAttribute("member_id");
		Calendar today = Calendar.getInstance();
		Date day = today.getTime();
		SimpleDateFormat simple = new SimpleDateFormat("yyyyMMddmmss");
		
		// 데이터베이스에 주문 정보 넣기
		orderModel.setOrder_trade_num(book_num+simple.format(day));
		int random = (int)Math.random()*99+1;
		orderModel.setOrder_trans_num(orderModel.getOrder_trade_num()+String.valueOf(random));
		orderModel.setOrder_bank_name("국민은행 (주)나무두리");
		orderModel.setOrder_bank_num("147963-01-794613");
		orderModel.setMember_id(session_id);
		orderService.singleOrder(orderModel);
		
		// 데이터베이스에 도서 정보 넣기
		orderDetailModel.setOrder_trade_num(book_num+simple.format(day));
		orderService.singleOrderDetail(orderDetailModel);
		
		// 데이터베이스에 넣은 정보 꺼내오기
		OrderModel getOrder = orderService.getOrder(orderModel);
		OrderDetailModel getOrderDetail = orderService.getOrderDetail(orderDetailModel);
		
		// 장바구니에서 넘어온 상품일 경우 장바구니에서 상품 삭제
		if (basket_num != 0) {
			orderService.delBasket(basket_num);
		}

		mv.addObject("order", getOrder);
		mv.addObject("orderDetail", getOrderDetail);
		mv.setViewName("singleOrderComplete");

		return mv;
	}
	
	// 전체 주문
	@RequestMapping(value = "/order/totalOrder.do", method = RequestMethod.GET)
	public ModelAndView totalOrderForm(HttpServletRequest request, HttpSession session) {
		
		session_id = (String) session.getAttribute("member_id");
		basketModel.setMember_id(session_id);
		List<BasketModel> basketList = basketService.basketList(basketModel);
		MemberModel memberModel = memberService.SelectOne(session_id);
		
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
		mv.addObject("memberModel",memberModel);
		mv.setViewName("totalOrder");
		
		return mv;
	}
	
	// 선택 주문
	@RequestMapping(value = "/order/selectOrder.do")
	public ModelAndView selectOrderForm(HttpServletRequest request, HttpSession session) {
				
		session_id = (String) session.getAttribute("member_id");
		String[] basket_num = request.getParameterValues("RowCheck");
		
		MemberModel memberModel = memberService.SelectOne(session_id);
		
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
		mv.addObject("memberModel",memberModel);
		mv.setViewName("selectOrder");
		
		return mv;
	}
	
	// 우편번호 검색 폼
	@RequestMapping(value="/order/zipCheck.do", method=RequestMethod.GET)
	ModelAndView orderZipCheckForm(HttpServletRequest request) {
		
		mv.setViewName("order/orderZipCheck");
		return mv;
	}
	
	// 우편번호 입력
	@RequestMapping(value="/order/zipCheck.do", method=RequestMethod.POST)
	ModelAndView orderZipCheck(HttpServletRequest request) {
		
		List<ZipcodeModel> zipcdodeList = new ArrayList<ZipcodeModel>(); 
		String area3 = request.getParameter("area3");
		System.out.println(area3);
		if(area3 != null) {
			zipcdodeList = memberService.zipCheck(area3);
		}
		
		mv.addObject("zipcodeList", zipcdodeList);
		mv.setViewName("order/orderZipCheck");
		return mv;
	}

}
