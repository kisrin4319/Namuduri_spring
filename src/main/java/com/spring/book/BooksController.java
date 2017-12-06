package com.spring.book;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.common.Paging;

@Controller
public class BooksController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource
	private BooksService booksService;

	ModelAndView mv = new ModelAndView();
	String session_id;

	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 9;
	private int blockPage = 5;
	private String pagingHtml;
	private Paging paging;

	// 책 리스트
	@RequestMapping("/books/booksList.do")
	public ModelAndView booksList(HttpServletRequest request) throws Exception {

		List<Map<String, Object>> booksList = new ArrayList<Map<String, Object>>();

		String book_category = request.getParameter("book_category");
		String searchKeyword = request.getParameter("searchKeyword");
		int searchNum = 0;
		if (request.getParameter("searchNum") != null) {
			searchNum = Integer.parseInt(request.getParameter("searchNum"));
		}

		Map<String, Object> map = new HashMap<String, Object>();

		if (searchKeyword == null) {
			booksList = booksService.booksList(book_category);
		} else {
			map.put("searchNum", searchNum);
			map.put("searchKeyword", searchKeyword);

			booksList = booksService.booksSearchList(map);
		}
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {

			currentPage = 1;

		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		totalCount = booksList.size();

		paging = new Paging(currentPage, totalCount, blockCount, blockPage, "booksList");
		pagingHtml = paging.getPagingHtml().toString();

		int lastCount = totalCount;

		if (paging.getEndCount() < totalCount) {
			lastCount = paging.getEndCount() + 1;
		}

		booksList = booksList.subList(paging.getStartCount(), lastCount);
		

		List<Map<String, Object>> top2 = new ArrayList<Map<String,Object>>();
		top2 = booksService.top2().subList(0, 3);

		mv.addObject("top2", top2);
		mv.addObject("booksList", booksList);
		mv.addObject("currentPage", currentPage);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("totalCount", totalCount);
		mv.addObject("listCount", booksList.size());

		mv.setViewName("booksList");
		return mv;

	}

	// 책 내용보기
	@RequestMapping("/books/bookDetail.do")
	public ModelAndView bookDetail(HttpServletRequest request) {

		int num = Integer.parseInt(request.getParameter("book_num"));

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		Map<String, Object> view = booksService.book_star(num);
		List<ReviewModel> review = booksService.reviewList(num);

		totalCount = review.size();

		paging = new Paging(currentPage, totalCount, blockCount, blockPage, "bookDetail", num);
		pagingHtml = paging.getPagingHtml().toString();

		int lastCount = totalCount;

		if (paging.getEndCount() < totalCount) {
			lastCount = paging.getEndCount() + 1;
		}

		review = review.subList(paging.getStartCount(), lastCount);

		mv.addObject("currentPage", currentPage);
		mv.addObject("view", view);
		mv.addObject("review", review);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("totalCount", totalCount);
		mv.setViewName("bookDetail");

		return mv;
	}

	// 리뷰 폼 띄우기
	@RequestMapping(value = "/books/review.do", method = RequestMethod.GET)
	public ModelAndView reviewForm(HttpServletRequest request, HttpSession session) {

		session_id = (String) session.getAttribute("member_id");

		int book_num = Integer.parseInt(request.getParameter("book_num"));
		String book_name = request.getParameter("book_name");

		mv.addObject("book_num", book_num);
		mv.addObject("book_name", book_name);
		mv.addObject("member_id", session_id);
		mv.setViewName("/book/writeReviewForm");
		return mv;
	}

	// 리뷰 쓰기
	@RequestMapping(value = "/books/review.do", method = RequestMethod.POST)
	public ModelAndView writeReview(@RequestParam int book_num, @RequestParam String review_pw,
			@RequestParam String review_content, @RequestParam int star_point, HttpSession session) {

		ReviewModel writeReview = new ReviewModel();

		session_id = (String) session.getAttribute("member_id");

		writeReview.setBook_num(book_num);
		writeReview.setMember_id(session_id);
		writeReview.setReview_pw(review_pw);
		writeReview.setReview_content(review_content);
		writeReview.setStar_point(star_point);

		booksService.reviewWrite(writeReview);

		mv.setViewName("/book/writeReviewSuccess");
		return mv;
	}
	
	//Slider를 이용한 책 정렬
	@RequestMapping("/books/bookSlider.do")
	public ModelAndView SliderList(HttpServletRequest request) {
		String price = request.getParameter("price");
		
		String min = price.substring(price.indexOf("￦")+1,price.indexOf("-")-1);
		String max = price.substring(price.indexOf("-")+3);
		
		List<BooksModel> booksList = new ArrayList<BooksModel>();
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("min", Integer.parseInt(min));
		map.put("max", Integer.parseInt(max));
		
		booksList = booksService.SliderBookList(map);
		
		mv.addObject("booksList",booksList);
		
		mv.setViewName("booksList");
		return mv;
	}
	// 베스트셀러 리스트 띄우기
	@RequestMapping("/books/best.do")
	public ModelAndView best(HttpServletRequest request) {
		
		List<Map<String, Object>> best = new ArrayList<Map<String,Object>>();
		best = booksService.top2();
		
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {

			currentPage = 1;

		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		totalCount = best.size();

		paging = new Paging(currentPage, totalCount, blockCount, blockPage, "booksList");
		pagingHtml = paging.getPagingHtml().toString();

		int lastCount = totalCount;

		if (paging.getEndCount() < totalCount) {
			lastCount = paging.getEndCount() + 1;
		}
		best = best.subList(paging.getStartCount(), lastCount);

		List<Map<String, Object>> top2 = new ArrayList<Map<String,Object>>();
		top2 = booksService.top2().subList(0, 3);

		mv.addObject("top2", top2);
		mv.addObject("booksList", best);
		mv.addObject("currentPage", currentPage);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("totalCount", totalCount);
		mv.addObject("listCount", best.size());
		mv.setViewName("booksList");
		return mv;
	}
}