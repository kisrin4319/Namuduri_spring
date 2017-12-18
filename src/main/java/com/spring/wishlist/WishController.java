package com.spring.wishlist;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.basket.BasketService;
import com.spring.book.BooksModel;
import com.spring.book.BooksService;

@Controller
public class WishController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource
	private BooksService booksService;
	@Resource
	private WishService wishService;
	@Resource
	private BasketService basketService;

	ModelAndView mv = new ModelAndView();
	String session_id;

	// 1. 위시리스트
	@RequestMapping("/wish/wishList.do")
	public ModelAndView wishList(HttpServletRequest request, HttpSession session) {
		session_id = (String) session.getAttribute("member_id");
		WishModel wishModel = new WishModel();
		wishModel.setMember_id(session_id);
		List<WishModel> wishList = wishService.wishList(wishModel);

		List<Map<String, Object>> top2 = new ArrayList<Map<String,Object>>();
		top2 = booksService.top2().subList(0, 3);
		
		mv.addObject("top2", top2);
		mv.addObject("wishList", wishList);
		mv.setViewName("wishList");
		return mv;
	}

	// 2. 위시리스트 추가
	@RequestMapping("/wish/wishInsert.do")
	public ModelAndView wishInsert(@ModelAttribute WishModel wishModel, HttpSession session, HttpServletRequest request) {
		session_id = (String) session.getAttribute("member_id");
		wishModel.setMember_id(session_id);

		// 위시리스트에 기존 상품이 존재하는지 검사
		int count = wishService.wishConfirm(wishModel);
		// 상품이 존재하지 않다면 위시리스트에 상품 추가하기
		if (count == 0) {
			BooksModel booksModel = booksService.bookOne(wishModel.wish_book_num);
			wishModel.setWish_book_image(booksModel.getBook_image());
			wishModel.setWish_book_name(booksModel.getBook_name());
			wishModel.setWish_book_price(booksModel.getBook_price());
			wishService.wishInsert(wishModel);
		} else {
			// 상품이 존재한다면 수량 업데이트
			wishService.wishUpdate(wishModel);
		}
		mv.setViewName("redirect:/wish/wishList.do");
		return mv;
	}

	// 3. 위시리스트 삭제
	@RequestMapping("/wish/wishDelete.do")
	public ModelAndView wishDelete(HttpServletRequest request, HttpSession session) {
		int wish_num = Integer.parseInt(request.getParameter("wish_num"));
		wishService.wishDelete(wish_num);

		mv.setViewName("redirect:/wish/wishList.do");
		return mv;
	}

	// 4. 위시리스트 전체 삭제
	@RequestMapping("/wish/wishDeleteAll.do")
	public ModelAndView wishDeleteAll(HttpSession session) {
		session_id = (String) session.getAttribute("member_id");
		wishService.wishDeleteAll(session_id);

		mv.setViewName("redirect:/wish/wishList.do");
		return mv;
	}

	// 5. 위시리스트 코멘트 업데이트
	@RequestMapping("wish/wishModify.do")
	public ModelAndView commentUpdate(@ModelAttribute WishModel wishModel, HttpSession session){
		session_id = (String) session.getAttribute("member_id");
		wishModel.setMember_id(session_id);
		wishService.wishComment(wishModel);
		
		mv.setViewName("redirect:/wish/wishList.do");
		return mv;
	}
}
