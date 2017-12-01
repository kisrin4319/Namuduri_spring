package com.spring.usedbook;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.book.BooksModel;
import com.spring.common.Paging;

@Controller
public class UsedBooksController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource
	private UsedBooksService usedBooksService;

	ModelAndView mv = new ModelAndView();
	String session_id;

	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 9;
	private int blockPage = 5;
	private String pagingHtml;
	private Paging paging;

	// 1. 중고 서적 리스트
	@RequestMapping("/books/usedBooksList.do")
	public ModelAndView usedBooksList(HttpServletRequest request) throws Exception {

		List<UsedBooksModel> usedBooksList = new ArrayList<UsedBooksModel>();

		String book_category = request.getParameter("book_category");
		String searchKeyword = request.getParameter("searchKeyword");

		int searchNum = 0;

		if (request.getParameter("searchNum") != null) {
			searchNum = Integer.parseInt(request.getParameter("searchNum"));
		}

		Map<String, Object> map = new HashMap<String, Object>();

		if (searchKeyword == null) {
			usedBooksList = usedBooksService.UsedBooksList(book_category);
		} else {
			map.put("searchNum", searchNum);
			map.put("searchKeyword", searchKeyword);

			usedBooksList = usedBooksService.UsedBooksSearchList(map);
		}

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {

			currentPage = 1;

		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		totalCount = usedBooksList.size();

		paging = new Paging(currentPage, totalCount, blockCount, blockPage, "booksList");
		pagingHtml = paging.getPagingHtml().toString();

		int lastCount = totalCount;

		if (paging.getEndCount() < totalCount) {
			lastCount = paging.getEndCount() + 1;
		}

		usedBooksList = usedBooksList.subList(paging.getStartCount(), lastCount);

		mv.addObject("usedBooksList", usedBooksList);
		mv.addObject("currentPage", currentPage);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("usedBooksCount", usedBooksList.size());
		mv.setViewName("usedBooksList");

		return mv;
	}

	// 2. 중고 서적 등록 form
	@RequestMapping(value = "/books/usedBookWrite.do", method = RequestMethod.GET)
	public ModelAndView usedBookWriteForm() throws Exception {
		mv.setViewName("usedBooksWriteForm");

		return mv;
	}
}
