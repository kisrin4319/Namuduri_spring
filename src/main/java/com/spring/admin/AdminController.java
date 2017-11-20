package com.spring.admin;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.book.BooksModel;
import com.spring.book.BooksService;
import com.spring.book.ReviewModel;
import com.spring.common.Paging;
import com.spring.member.MemberModel;
import com.spring.member.MemberService;
import com.spring.mypage.MypageService;
import com.spring.order.OrderDetailModel;
import com.spring.order.OrderModel;

@Controller
public class AdminController {
	
	@Resource
	private AdminService adminService;
	
	@Resource
	private BooksService booksService;
	
	@Resource
	private MemberService memberService;
	
	@Resource
	private MypageService mypageService;
	
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
	public ModelAndView memberList(HttpServletRequest request) throws Exception {
		
		List<MemberModel> memberList = memberService.memberList();
		
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		}else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		totalCount = memberList.size();
		paging = new Paging(currentPage, totalCount, blockCount, blockPage, "memberList");
		pagingHtml = paging.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if (paging.getEndCount() < totalCount) {
			lastCount = paging.getEndCount() + 1;
		}
		
		memberList = memberList.subList(paging.getStartCount(), lastCount);
		
		mv.addObject("memberList", memberList);
		mv.addObject("currentPage", currentPage);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("totalCount", totalCount);
		mv.addObject("listCount", memberList.size());
		
		mv.setViewName("adminMemberList");
		
		return mv;
	}
	
	@RequestMapping("/admin/memberDetail.do") //회원 상세보기
	public ModelAndView memberDetail(@RequestParam(required=true) String member_id, int currentPage) throws Exception {
		
		MemberModel view = memberService.SelectOne(member_id);
		
		mv.addObject("view", view);
		//주문 내역 추가
		mv.addObject("currentPage", currentPage);
		mv.setViewName("adminMemberDetail");
		
		return mv;
	}
	
	@RequestMapping(value="/admin/memberModify.do", method=RequestMethod.GET) //회원 정보 수정 입력 폼
	public ModelAndView memberModifyForm(@RequestParam(required=true) String member_id, @RequestParam int currentPage) throws Exception {
		
		MemberModel memberModel = memberService.SelectOne(member_id);
		
		mv.addObject("view", memberModel);
		mv.addObject("currentPage", currentPage);
		mv.setViewName("adminMemberModify");
		
		return mv;
	}
	
	@RequestMapping(value="/admin/memberModify.do", method=RequestMethod.POST) //회원 정보 수정
	public ModelAndView memberModify(@ModelAttribute("view") MemberModel memberModel, int currentPage) throws Exception {
		
		mypageService.memberModify(memberModel);
		MemberModel view = memberService.SelectOne(memberModel.getMember_id());
		
		mv.addObject("view", view);
		mv.addObject("currentPage", currentPage);
		mv.setViewName("adminMemberDetail");
		
		return mv;
	}
	
	@RequestMapping("/admin/memberDelete.do") //회원 정보 삭제
	public ModelAndView memberDelete(@RequestParam String member_id, @RequestParam int currentPage) throws Exception {
		
		/*mypageService.memberOut(member_id);*/
		
		mv.addObject("currentPage", currentPage);
		mv.setViewName("redirect:/admin/memberList.do");
		
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
	public ModelAndView bookWriteForm() throws Exception {
		
		BooksModel booksModel = null;
		booksModel = new BooksModel();
		
		mv.addObject("view", booksModel);
		mv.setViewName("adminBookWrite");
		
		return mv;
	}
	
	public String getFile(HttpServletRequest request,MultipartFile multipartFile) throws IllegalStateException, IOException {
		
		String imgFileName = multipartFile.getOriginalFilename();
		String fileType = imgFileName.substring(imgFileName.lastIndexOf('.')+1, imgFileName.length()).toLowerCase();
		// 확장자 체크
				
		/* 용량 체크
		* long fileSize = imgFile.getSize();
		* if(fileSize > 10485760 || fileSize <= 0) {Validation 10MB 이상의 파일은 업로드 할 수 없습니다.}
		*/

		// if(!fileType.equals("jpg") && !fileType.equals("bmp") && !fileType.equals("gif") {Validation 이미지 파일만 업로드 가능합니다}
				
		String fileName = "textbook_"+String.valueOf(Calendar.getInstance().getTimeInMillis())+'.'+fileType;
		String filePath = request.getContextPath() +File.separator+"upload";
		multipartFile.transferTo(new File(filePath+File.separator+fileName));
			
		return fileName;

	}
	
	@RequestMapping(value="/admin/bookWrite.do", method=RequestMethod.POST) //도서 등록하기
	public ModelAndView bookWrite(HttpServletRequest request, @ModelAttribute("view") BooksModel booksModel) throws Exception {
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile multipartFile = multipartRequest.getFile("book_image");
		String book_image = null;
		
		if(multipartFile.isEmpty()==false) //파일이 존재할 때 
		{
			book_image = getFile(request, multipartFile);
		}else{ //파일이 존재하지 않을 때
			book_image = null; 
		}
		
		booksModel.setBook_image(book_image);
		
		adminService.insertBook(booksModel);
		BooksModel view = adminService.selectNewest();
		
		mv.addObject("currentPage", 1);
		mv.addObject("view", view);
		mv.setViewName("adminBookDetail");
		
		return mv;
	}
	
	@RequestMapping(value="/admin/bookModify.do", method=RequestMethod.GET)
	public ModelAndView bookModifyForm(@RequestParam int book_num, @RequestParam int currentPage) throws Exception {
		
		BooksModel view = adminService.selectOne(book_num);
		
		mv.addObject("view",view);
		mv.addObject("currentPage", currentPage);
		mv.setViewName("adminBookWrite");
		
		return mv;
	}
	
	@RequestMapping(value="/admin/bookModify.do", method=RequestMethod.POST) //도서 수정하기
	public ModelAndView bookModify(HttpServletRequest request, @ModelAttribute("view") BooksModel booksModel, int currentPage) throws Exception {
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile multipartFile = multipartRequest.getFile("book_image");
		String book_image = null;
		
		if(multipartFile.isEmpty()==false) //파일이 존재할 때
		{
			book_image = getFile(request, multipartFile);
		}else { //파일이 존재하지 않을때
			book_image = request.getParameter("book_image");
		}

		booksModel.setBook_image(book_image);
		
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
	public ModelAndView orderList(HttpServletRequest request) throws Exception {
		
		List<OrderModel> orderList = adminService.selectOrderAll();
		
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
			|| request.getParameter("currentPage").equals("0")) {
				currentPage = 1;
		}else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
						
		totalCount = orderList.size();
						
		paging = new Paging(currentPage, totalCount, blockCount, blockPage, "orderList");
		pagingHtml = paging.getPagingHtml().toString();
						
		int lastCount = totalCount;
						
		if (paging.getEndCount() < totalCount) {
			lastCount = paging.getEndCount() + 1;
		}
						
		orderList = orderList.subList(paging.getStartCount(), lastCount);
						
		mv.addObject("orderList", orderList);
		mv.addObject("currentPage", currentPage);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("totalCount", totalCount);
		mv.addObject("listCount", orderList.size());
						
		mv.setViewName("adminOrderList");
						
		return mv;
	}
	
	@RequestMapping("/admin/orderDetail.do") //주문 상세보기
	public ModelAndView orderDetail(@RequestParam int order_trade_num) throws Exception {
		
		OrderModel view = null; /*= mypageService.memberOrderDetail();*/
		
		List<OrderDetailModel> orderDetail = null; //마이페이지?
		
		mv.addObject("view", view);
		mv.addObject("orderDetailList", orderDetail);
		mv.addObject("currentPage", currentPage);
		mv.setViewName("adminOrderDetail");
		
		return mv;
	}
	
	@RequestMapping("/admin/orderModify.do") //주문 수정하기
	public ModelAndView orderModify(@RequestParam String payment_status, @RequestParam String order_trans_status,
			@RequestParam int order_use_yn, @RequestParam String order_trade_num, @RequestParam int currentPage) throws Exception {
		
		OrderModel orderModel = null;
		orderModel.setPayment_status(payment_status);
		orderModel.setOrder_trans_status(order_trans_status);
		orderModel.setOrder_use_yn(order_use_yn);
		orderModel.setOrder_trade_num(order_trade_num);
		
		adminService.modifyOrder(orderModel);
		
		mv.addObject("order_trade_num", order_trade_num);
		mv.addObject("currentPage", currentPage);
		mv.setViewName("redirect:/admin/orderDetail.do");
		
		return mv;
	}
	
	@RequestMapping("/admin/orderDelete.do") //주문 취소하기.. 배송 관련 기능을 넣을까..
	public ModelAndView orderDelete() throws Exception {
		
		//데이터 삭제?
		
		return mv;
	}

	/////////////////////////////////////////////////////////////////
}
