package com.spring.admin;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.book.BooksModel;
import com.spring.book.BooksService;
import com.spring.book.ReviewModel;
import com.spring.common.Paging;

@Controller
public class AdminController {
	
	@Resource
	private AdminService adminService;
	
	@Resource
	private BooksService booksService;
	
	ModelAndView mv = new ModelAndView();
	String session_id;
	
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private Paging paging;
	
	@RequestMapping("/admin/main.do") //관리자 페이지
	public ModelAndView adminMain() throws Exception {
		mv.setViewName("admin");
		return mv;
	}
	
	////////////////////////////////////////////////////////////////////
	
	@RequestMapping("/admin/memberList.do") //회원 조회
	public ModelAndView memberList() throws Exception {
		
		return mv;
	}
	
	@RequestMapping("/admin/memberDetail.do") //회원 상세보기
	public ModelAndView memberDetail() throws Exception {
		
		return mv;
	}
	
	@RequestMapping("/admin/memberModify.do") //회원 정보 수정
	public ModelAndView memberModify() throws Exception {
		
		return mv;
	}
	
	@RequestMapping("/admin/memberDelete.do") //회원 정보 삭제
	public ModelAndView memberDelete() throws Exception {
		
		return mv;
	}
	
	//////////////////////////////////////////////////////////////////
	
	@RequestMapping("/admin/bookList.do") //도서 리스트
	public ModelAndView bookList(HttpServletRequest request) throws Exception {
		//전체 책 리스트, 메인에 보여지는 것만. 메인에 보여지지 않는 것만. 
		//카테고리만으로도 검색 가능하게. 
		
		//한 페이지 내에서 다른 세개의 리스트를 출력가능할까..?
		List<BooksModel> booksList = adminService.booksListAll();
				
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
						|| request.getParameter("currentPage").equals("0")) {
					currentPage = 1;
		}else {
					currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
				
		totalCount = booksList.size();
				
		paging = new Paging(currentPage, totalCount, blockCount, blockPage, "bookList");
		pagingHtml = paging.getPagingHtml().toString();
				
		int lastCount = totalCount;
				
		if (paging.getEndCount() < totalCount) {
			lastCount = paging.getEndCount() + 1;
		}
				
		booksList = booksList.subList(paging.getStartCount(), lastCount);
				
		mv.addObject("booksList", booksList);
		mv.addObject("currentPage", currentPage);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("totalCount", totalCount);
		mv.addObject("listCount", booksList.size());
				
		mv.setViewName("adminBookList");
				
		return mv;
	}
	
	@RequestMapping("/admin/bookDetail.do") //도서 상세보기
	public ModelAndView bookDetail(HttpServletRequest request) throws Exception {
		
		int num = Integer.parseInt(request.getParameter("book_num"));
		
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		BooksModel view = adminService.selectOne(num);
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
		mv.setViewName("adminBookDetail");
		
		return mv;
	}
	
	@RequestMapping(value="/admin/bookWrite.do", method=RequestMethod.GET) //도서 등록 폼 띄우기
	public ModelAndView bookWriteForm(HttpServletRequest request) throws Exception {
		
		BooksModel booksModel = null;
		booksModel = new BooksModel();
		/*request.setAttribute("booksModel", booksModel);*/
		
		mv.addObject("view", booksModel);
		mv.setViewName("adminBookWrite");
		
		return mv;
	}
	
	@RequestMapping(value="/admin/bookWrite.do", method=RequestMethod.POST) //도서 등록하기
	public ModelAndView bookWrite(@ModelAttribute("view") BooksModel booksModel) throws Exception {
		
		adminService.insertBook(booksModel);
		BooksModel view = adminService.selectNewest();
		
		mv.addObject("currentPage", 1);
		mv.addObject("view", view);
		mv.setViewName("adminBookDetail");
		
		return mv;
	}
	
	@RequestMapping(value="/admin/bookModify.do", method=RequestMethod.GET)
	public ModelAndView bookModifyForm(@RequestParam int book_num, @RequestParam int currentPage) throws Exception {
		
		BooksModel view = new BooksModel();
		
		view = booksService.bookOne(book_num);
		
		mv.addObject("view",view);
		mv.addObject("currentPage", currentPage);
		mv.setViewName("adminBookWrite");
		
		return mv;
	}
	
	@RequestMapping(value="/admin/bookModify.do", method=RequestMethod.POST) //도서 수정하기
	public ModelAndView bookModify(@ModelAttribute("view") BooksModel booksModel, @RequestParam int currentPage) throws Exception {
		
		adminService.modifyBook(booksModel);
		
		BooksModel view = booksService.bookOne(booksModel.getBook_num());
		
		mv.addObject("view", view);
		mv.addObject("currentPage", currentPage);
		mv.setViewName("adminBookDetail");
		
		
		return mv;
	}
	
	@RequestMapping("/admin/bookDelete.do") //도서 삭제하기
	public ModelAndView bookDelete(@RequestParam int book_num, @RequestParam int currentPage) throws Exception {
		
		adminService.deleteBook(book_num);
		
		mv.addObject("currentPage", currentPage);
		mv.setViewName("redirect:/admin/bookList.do");
		
		return mv;
	}
	
	@RequestMapping("/admin/reviewDelete.do") //리뷰 삭제하기
	public ModelAndView reviewDelete(@RequestParam int review_num, @RequestParam int book_num) throws Exception {
		
		adminService.deleteReview(review_num);
		
		mv.addObject("book_num", book_num);
		mv.setViewName("redirect:/admin/bookDetail.do");
		
		return mv;
	}
	
	/////////////////////////////////////////////////////////////////
	
	@RequestMapping("/admin/orderList.do") //주문 조회하기
	public ModelAndView orderList() throws Exception {
		
		return mv;
	}
	
	@RequestMapping("/admin/orderDetail.do") //주문 상세보기
	public ModelAndView orderDetail() throws Exception {
		
		return mv;
	}
	
	@RequestMapping("/admin/orderModify.do") //주문 수정하기
	public ModelAndView orderModify() throws Exception {
		
		return mv;
	}
	
	@RequestMapping("/admin/orderDelete.do") //주문 취소하기.. 배송 관련 기능을 넣을까..
	public ModelAndView orderDelete() throws Exception {
		
		return mv;
	}

	/////////////////////////////////////////////////////////////////
}
