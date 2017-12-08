package com.spring.usedbook;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.book.BooksModel;
import com.spring.book.BooksService;
import com.spring.common.Paging;

@Controller
public class UsedBooksController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource
	private UsedBooksService usedBooksService;

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

		paging = new Paging(currentPage, totalCount, blockCount, blockPage, "usedBooksList");
		pagingHtml = paging.getPagingHtml().toString();

		int lastCount = totalCount;

		if (paging.getEndCount() < totalCount) {
			lastCount = paging.getEndCount() + 1;
		}

		usedBooksList = usedBooksList.subList(paging.getStartCount(), lastCount);

		List<Map<String, Object>> top2 = new ArrayList<Map<String,Object>>();
		top2 = booksService.top2().subList(0, 3);

		mv.addObject("top2", top2);
		mv.addObject("usedBooksList", usedBooksList);
		mv.addObject("currentPage", currentPage);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("usedBooksCount", usedBooksList.size());
		mv.setViewName("usedBooksList");

		return mv;
	}
	// 중고 서적 가격 슬라이더 이용 정렬
	@RequestMapping("/books/usedBookSlider.do")
	public ModelAndView SliderList(HttpServletRequest request) {
		String price = request.getParameter("price");
		
		String min = price.substring(price.indexOf("￦")+1,price.indexOf("-")-1);
		String max = price.substring(price.indexOf("-")+3);
		
		List<UsedBooksModel> usedBooksList = new ArrayList<UsedBooksModel>();
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("min", Integer.parseInt(min));
		map.put("max", Integer.parseInt(max));
		
		usedBooksList = usedBooksService.SliderBookList(map);
		
		mv.addObject("usedBooksList",usedBooksList);
		
		mv.setViewName("usedBooksList");
		
		return mv;
	}
	// 2. 중고 서적 등록 form
	@RequestMapping(value = "/books/usedBookWriteForm.do", method = RequestMethod.GET)
	public ModelAndView usedBookWriteForm() throws Exception {
		mv.setViewName("usedBooksWriteForm");

		return mv;
	}

	// 3. 중고 서적 등록 form
	@RequestMapping(value = "/books/usedBookWriteForm.do", method = RequestMethod.POST)
	public ModelAndView usedBookWriteSearch(@RequestParam String searchKeyword) throws Exception {

		List<Map<String, Object>> booksList = new ArrayList <Map<String, Object>>();

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("searchNum", 1);
		map.put("searchKeyword", searchKeyword);

		booksList = booksService.booksSearchList(map);

		mv.addObject("booksList", booksList);
		mv.setViewName("usedBooksWriteForm");

		return mv;
	}

	// 4. 중고 서적 등록
	@RequestMapping(value = "/books/usedBookWrite.do", method = RequestMethod.POST)
	public ModelAndView usedBookWrite(@ModelAttribute UsedBooksModel usedBooksModel) {

		usedBooksService.UsedBooksInsert(usedBooksModel);
	
		mv.setViewName("redirect:/books/usedBooksList.do");
		return mv;

	}

	// 5. 중고 서적 정보 수정 폼
	@RequestMapping(value ="/books/usedBookModifyForm.do", method = RequestMethod.GET)
	public ModelAndView usedBookModifyForm(@RequestParam int used_book_num) throws Exception {
		UsedBooksModel usedBookModel = new UsedBooksModel();
		
		usedBookModel = usedBooksService.UsedbookOne(used_book_num);
		mv.addObject("usedBook",usedBookModel);
		mv.setViewName("usedBooksModifyForm");
		
		return mv;
	}
	//6. 중고 서적 정보 수정 form
	@RequestMapping(value ="/books/usedBookModifyForm.do", method = RequestMethod.POST)
	public ModelAndView usedBookModifySearch(@RequestParam String searchKeyword) throws Exception {

		List<Map<String, Object>> booksList = new ArrayList <Map<String, Object>>();

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("searchNum", 1);
		map.put("searchKeyword", searchKeyword);

		booksList = booksService.booksSearchList(map);

		mv.addObject("booksList", booksList);
		mv.setViewName("usedBooksModifyForm");

		return mv;
	}
	// 6. 중고 서적 정보 수정

	@RequestMapping(value="/books/usedBookModify.do", method = RequestMethod.POST)
	public ModelAndView usedBookModifyProc(@ModelAttribute UsedBooksModel usedBooksModel){
		usedBooksService.UsedBooksModify(usedBooksModel);
		
		mv.setViewName("redirect:/books/usedBooksList.do");
		
		return mv;
	}
	// 7. 중고 서적 삭제 (주문 완료 & 삭제 버튼 눌렀을 경우)
	@RequestMapping("/books/usedBookDelete.do")
	public ModelAndView usedBookDelete(@RequestParam int used_book_num) throws Exception {
		
		usedBooksService.UsedBooksDelete(used_book_num);

		mv.setViewName("redirect:/books/usedBooksList.do");
		return mv;
	}
	
	
}
