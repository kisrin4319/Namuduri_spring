package com.spring.basket;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.book.BooksModel;
import com.spring.book.BooksService;
import com.spring.common.Paging;

@Controller
public class BasketController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource
	private BasketService basketService;
	@Resource
	private BooksService booksService;
	
	ModelAndView mv;
	String session_id;

	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private Paging paging;

	// 1. 장바구니 목록
	@RequestMapping("/basket/basketList.do")
	public ModelAndView basketList(HttpServletRequest request, HttpSession session) throws Exception {
		mv = new ModelAndView();
		BasketModel basketModel = new BasketModel();

		session_id = (String) session.getAttribute("member_id");
		basketModel.setMember_id(session_id);

		if (basketModel.getMember_id() != null) {
			List<BasketModel> basketList = basketService.basketList(basketModel);

			// 페이징 코드
			if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
					|| request.getParameter("currentPage").equals("0")) {

				currentPage = 1;

			} else {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			totalCount = basketList.size();

			paging = new Paging(currentPage, totalCount, blockCount, blockPage, "basketList");
			pagingHtml = paging.getPagingHtml().toString();

			int lastCount = totalCount;

			if (paging.getEndCount() < totalCount) {
				lastCount = paging.getEndCount() + 1;
			}
			basketList = basketList.subList(paging.getStartCount(), lastCount);

			int sumMoney = basketService.sumMoney(basketModel);
			// 장바구니 전체 금액에 따라 배송비 구분
			// 배송료(10만원 이상 = > 무료, 미만 = >2500원)
			int fee = sumMoney >= 100000 ? 0 : 2500;

			mv.addObject("basketList", basketList); // 장바구니 목록
			mv.addObject("currentPage", currentPage);
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("totalCount", totalCount);
			mv.addObject("listCount", basketList.size()); // 장바구니의 크기
			mv.addObject("sumMoney", sumMoney); // 장바구니 전체 금액
			mv.addObject("fee", fee); // 배송 금액
			mv.addObject("totalSum", sumMoney + fee); // 주문 상품 전체 금액
			mv.setViewName("basketList");
		} else {
			mv.setViewName("redirect:/login.do");
		}
		return mv;
	}

	// 2. 장바구니 추가
	@RequestMapping("/basket/basketInsert.do")
	public ModelAndView basketInsert(@ModelAttribute BasketModel basketModel, HttpSession session,HttpServletRequest request) {
		
		mv = new ModelAndView();
		
		session_id = (String) session.getAttribute("member_id");
		String[] basket_book_num = request.getParameterValues("basket_book_num");
		String[] wish_count = request.getParameterValues("amount");
		
		for (int i = 0; i < basket_book_num.length; i++) {
			int num = Integer.parseInt(basket_book_num[i]);
			int amount = Integer.parseInt(wish_count[i]);
			basketModel.setBasket_book_num(num);
			basketModel.setBasket_book_count(amount);
			basketModel.setMember_id(session_id);
			int count = basketService.BasketSelectOne(basketModel);
			if(count == 0) {
				BooksModel book = booksService.bookOne(num);
				basketModel.setBasket_book_image(book.getBook_image());
				basketModel.setBasket_book_name(book.getBook_name());
				basketModel.setBasket_book_price(book.getBook_price());
				basketModel.setBook_category(book.getBook_category());
				basketService.BasketInsert(basketModel);
			} else {
				basketService.BasketUpdate(basketModel);
			}
		}
		mv.setViewName("redirect:/basket/basketList.do");
		return mv;
	}

	// 3. 장바구니 수정(BasketModify)
	@RequestMapping("/basket/basketModify.do")
	public ModelAndView basketUpdate(@RequestParam int basket_num, @RequestParam int basket_book_count, HttpSession session) {

		mv = new ModelAndView();
		// Session의 ID
		session_id = (String) session.getAttribute("member_id");

		BasketModel basketModel = new BasketModel();
		basketModel.setMember_id(session_id);
		basketModel.setBasket_num(basket_num);
		basketModel.setBasket_book_count(basket_book_count);
		basketService.BasketModify(basketModel);

		mv.setViewName("redirect:/basket/basketList.do");

		return mv;
	}

	// 4. 장바구니 삭제
	@RequestMapping("/basket/basketDelete.do")
	public ModelAndView basketDelete(@RequestParam int basket_num) {

		mv = new ModelAndView();
		basketService.BasketDelete(basket_num);
		mv.setViewName("redirect:/basket/basketList.do");

		return mv;
	}

	// 5 장바구니 전체 삭제
	@RequestMapping("/basket/basketDeleteAll.do")
	public ModelAndView basketDeleteAll(HttpSession session) {

		mv = new ModelAndView();

		session_id = (String) session.getAttribute("member_id");
		basketService.BasketDeleteAll(session_id);

		mv.setViewName("redirect:/basket/basketList.do");

		return mv;
	}
	
	// 6. 장바구니 선택 삭제
	@RequestMapping("/basket/basketCheckDelete.do")
	public ModelAndView basketCheckDelete(HttpServletRequest request) throws Exception {
		String[] basket_num = request.getParameterValues("RowCheck");
		mv = new ModelAndView();
		for(int i=0;i<basket_num.length;i++) {			
			basketService.BasketDelete(Integer.parseInt(basket_num[i]));
		}
		mv.setViewName("redirect:/basket/basketList.do");

		return mv;
	}
	
	//7. 단일 주문 재고 확인
	@RequestMapping("/basket/stockCheck.do")
	public @ResponseBody int stockCheck(@RequestParam int book_num) {
		BooksModel booksModel = booksService.bookOne(book_num);
		return booksModel.getBook_current_count();
	}
	
	//8. 선택 주문 재고 validation
	@RequestMapping("/basket/SelectstockCheck.do")
	public @ResponseBody Object stockCheck(HttpServletRequest request) {
		String[] basket_num = request.getParameterValues("RowCheck");
		BooksModel booksModel = new BooksModel();
		Map<String, Object> map = new HashMap<String, Object>();
		for(int i =0 ; i<basket_num.length;i++) {
			BasketModel basketModel = basketService.basketDetail(Integer.parseInt(basket_num[i]));
			int orderCount = basketService.basketDetail(Integer.parseInt(basket_num[i])).getBasket_book_count();
			booksModel = booksService.bookOne(basketModel.getBasket_book_num());
			
			if(booksModel.getBook_current_count() < orderCount ) {
				map.put("name", booksModel.getBook_name());
				map.put("orderCount", orderCount );
				map.put("size", map.size());
				return map;
			}
		}
		map.put("size", map.size());
		return map;
	}
	
	//9. 전체 주문 재고 validation
	@RequestMapping("/basket/totalstockCheck.do")
	public @ResponseBody Object stockCheck(HttpSession session) {
		BooksModel booksModel = new BooksModel();
		BasketModel basketModel = new BasketModel();
		Map<String, Object> map = new HashMap<String, Object>();
		session_id = (String) session.getAttribute("member_id");
		basketModel.setMember_id(session_id);

		List<BasketModel> basketList = basketService.basketList(basketModel);
		
		for(int i =0; i<basketList.size();i++) {
			booksModel = booksService.bookOne(basketList.get(i).getBasket_book_num());
			if(booksModel.getBook_current_count() < basketList.get(i).getBasket_book_count()) {
				map.put("name", booksModel.getBook_name());
				map.put("stock", booksModel.getBook_current_count());
				map.put("size", map.size());
				return map;
			}
		}
		map.put("size", map.size());
		return map;
	}
}
