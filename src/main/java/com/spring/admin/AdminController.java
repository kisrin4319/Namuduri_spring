package com.spring.admin;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.spring.board.BoardModel;
import com.spring.book.BooksModel;
import com.spring.book.BooksService;
import com.spring.book.ReviewModel;
import com.spring.common.Paging;
import com.spring.member.MemberModel;
import com.spring.member.MemberService;
import com.spring.mypage.MypageService;
import com.spring.order.OrderDetailModel;
import com.spring.order.OrderModel;
import com.spring.order.OrderService;

@Controller
public class AdminController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource
	private AdminService adminService;

	@Resource
	private BooksService booksService;

	@Resource
	private MemberService memberService;

	@Resource
	private MypageService mypageService;

	@Resource
	private OrderService orderService;

	ModelAndView mv = new ModelAndView();
	String session_id;

	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 15;
	private int blockPage = 5;
	private String pagingHtml;
	private Paging paging;
	
	Gson gson = new Gson();

	@RequestMapping("/admin/main.do") // 관리자 페이지
	public ModelAndView adminMain() throws Exception {
		
		int countTrade = adminService.countTrade();
		int countTrans = adminService.countTrans();
		int countTrans2 = adminService.countTrans2();
		int todayMember = adminService.todayMember();
		int todayOrder = adminService.todayOrder();
		int todaySalesM = adminService.todaySalesM();
		
		List<BooksModel> todaySalesBook = adminService.todaySalesBook();
		
		List<ChartModel> todayMemberGender = adminService.todayMemberGender();
		GoogleChartDTO pie1 = new GoogleChartDTO();

		pie1.addColumn("성별", "string");
		pie1.addColumn("number", "number");
		pie1.createRows(todayMemberGender.size());

		for (int i = 0; i < todayMemberGender.size(); i++) {
			pie1.addCell(i, Integer.parseInt(todayMemberGender.get(i).getKey()) == 1 ? "남자" : "여자");
			pie1.addCell(i, todayMemberGender.get(i).getValue());
		}
		String memberGenderPie = gson.toJson(pie1.getResult());
		mv.addObject("memberGenderPie", memberGenderPie);
		
		
		List<ChartModel> todayMemberAge = adminService.todayMemberAge();
		GoogleChartDTO pie2 = new GoogleChartDTO();

		pie2.addColumn("연령대", "string");
		pie2.addColumn("number", "number");
		pie2.createRows(todayMemberAge.size());

		for (int i = 0; i < todayMemberAge.size(); i++) {
			pie2.addCell(i, todayMemberAge.get(i).getKey() + "0 년대");
			pie2.addCell(i, todayMemberAge.get(i).getValue());
		}
		String memberAgePie = gson.toJson(pie2.getResult());
		mv.addObject("memberAgePie", memberAgePie);
		
		
		List<ChartModel> todayMemberRegion = adminService.todayMemberRegion();
		GoogleChartDTO pie3 = new GoogleChartDTO();

		pie3.addColumn("지역", "string");
		pie3.addColumn("number", "number");
		pie3.createRows(todayMemberRegion.size());

		for (int i = 0; i < todayMemberRegion.size(); i++) {
			pie3.addCell(i, todayMemberRegion.get(i).getKey());
			pie3.addCell(i, todayMemberRegion.get(i).getValue());
		}
		String memberRegionPie = gson.toJson(pie3.getResult());
		mv.addObject("memberRegionPie", memberRegionPie);
		
		
		List<ChartModel> todayOrderGender = adminService.todayOrderGender();
		GoogleChartDTO pie4 = new GoogleChartDTO();

		pie4.addColumn("성별", "string");
		pie4.addColumn("number", "number");
		pie4.createRows(todayOrderGender.size());

		for (int i = 0; i < todayOrderGender.size(); i++) {
			pie4.addCell(i, Integer.parseInt(todayOrderGender.get(i).getKey()) == 1 ? "남자" : "여자");
			pie4.addCell(i, todayOrderGender.get(i).getValue());
		}
		String orderGenderPie = gson.toJson(pie4.getResult());
		mv.addObject("orderGenderPie", orderGenderPie);
		
		
		List<ChartModel> todayOrderAge = adminService.todayOrderAge();
		GoogleChartDTO pie5 = new GoogleChartDTO();

		pie5.addColumn("연령대", "string");
		pie5.addColumn("number", "number");
		pie5.createRows(todayOrderAge.size());

		for (int i = 0; i < todayOrderAge.size(); i++) {
			pie5.addCell(i, todayOrderAge.get(i).getKey() + "0 년대");
			pie5.addCell(i, todayOrderAge.get(i).getValue());
		}
		String orderAgePie = gson.toJson(pie5.getResult());
		mv.addObject("orderAgePie", orderAgePie);
		
		
		List<ChartModel> todayOrderRegion = adminService.todayOrderRegion();
		GoogleChartDTO pie6 = new GoogleChartDTO();

		pie6.addColumn("지역", "string");
		pie6.addColumn("number", "number");
		pie6.createRows(todayOrderRegion.size());

		for (int i = 0; i < todayOrderRegion.size(); i++) {
			pie6.addCell(i, todayOrderRegion.get(i).getKey());
			pie6.addCell(i, todayOrderRegion.get(i).getValue());
		}
		String orderRegionPie = gson.toJson(pie6.getResult());
		mv.addObject("orderRegionPie", orderRegionPie);
		
		
		mv.addObject("countTrade", countTrade);
		mv.addObject("countTrans", countTrans);
		mv.addObject("countTrans2", countTrans2);
		mv.addObject("todayMember", todayMember);
		mv.addObject("todayOrder", todayOrder);
		mv.addObject("todaySalesM", todaySalesM);
		mv.addObject("todaySalesBook", todaySalesBook);
		mv.addObject("todayBookC", todaySalesBook.size());
		
		mv.setViewName("admin");
		return mv;
	}

	////////////////////////////////////////////////////////////////////

	@RequestMapping(value = "/admin/memberList/{status}.do", method = RequestMethod.GET) // 회원 조회
	public ModelAndView memberList(@PathVariable("status") String status, HttpServletRequest request) throws Exception {

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		List<MemberModel> memberList = new ArrayList<MemberModel>();

		if (status.equals("all")) {
			memberList = adminService.memberListAll();
		} else if (status.equals("Bck")) {
			memberList = adminService.memberListBck();
		} else if (status.equals("rank")) {
			memberList = adminService.memberListRank();
		}

		totalCount = memberList.size();
		paging = new Paging(currentPage, totalCount, blockCount, blockPage, status);
		pagingHtml = paging.getPagingHtml().toString();

		int lastCount = totalCount;

		if (paging.getEndCount() < totalCount) {
			lastCount = paging.getEndCount() + 1;
		}

		memberList = memberList.subList(paging.getStartCount(), lastCount);

		mv.addObject("status", status);
		mv.addObject("memberList", memberList);
		mv.addObject("currentPage", currentPage);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("totalCount", totalCount);
		mv.addObject("listCount", memberList.size());

		mv.setViewName("adminMemberList");

		return mv;
	}

	@RequestMapping(value = "/admin/memberList/{status}.do", method = RequestMethod.POST) // 회원 검색
	public ModelAndView memberSearch(@PathVariable("status") String status, HttpServletRequest request) {

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		Map<String, Object> map = new HashMap<String, Object>();
		List<MemberModel> memberList = new ArrayList<MemberModel>();

		int searchNum = Integer.parseInt(request.getParameter("searchNum"));
		String searchKeyword = request.getParameter("searchKeyword");
		String date_min = request.getParameter("date_min");
		String date_max = request.getParameter("date_max");
		int active = 0;

		if (status.equals("all")) {
			active = Integer.parseInt(request.getParameter("active"));
		} else if (status.equals("Bck")) {
			active = 2;
		}

		if (searchKeyword.trim().isEmpty()) {
			searchKeyword = null;
		}

		if (date_min.trim().isEmpty()) {
			date_min = null;
		}

		if (date_max.trim().isEmpty()) {
			date_max = null;
		}

		map.put("status", status);
		map.put("searchNum", searchNum);
		map.put("searchKeyword", searchKeyword);
		map.put("date_min", date_min);
		map.put("date_max", date_max);
		map.put("active", active);

		if (searchNum == 0 && searchKeyword == null && date_min == null && date_max == null) {
			if (status.equals("all") && active == 0) {
				memberList = adminService.memberListAll();
			} else if (status.equals("Bck")) {
				memberList = adminService.memberListBck();
			} else if (status.equals("rank")) {
				memberList = adminService.memberListRank();
			}
		} else {
			if (status.equals("all")) {
				memberList = adminService.searchMember(map);
			} else if (status.equals("Bck")) {
				memberList = adminService.searchMember(map);
			} else if (status.equals("rank")) {
				memberList = adminService.searchMember(map);
			}
		}

		totalCount = memberList.size();
		paging = new Paging(currentPage, totalCount, blockCount, blockPage, status);
		pagingHtml = paging.getPagingHtml().toString();

		int lastCount = totalCount;

		if (paging.getEndCount() < totalCount) {
			lastCount = paging.getEndCount() + 1;
		}

		memberList = memberList.subList(paging.getStartCount(), lastCount);

		mv.addObject("status", status);
		mv.addObject("memberList", memberList);
		mv.addObject("currentPage", currentPage);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("totalCount", totalCount);
		mv.addObject("listCount", memberList.size());

		mv.setViewName("adminMemberList");

		return mv;
	}

	@RequestMapping(value = "/admin/memberInfo.do", method = RequestMethod.GET) // 회원 상세보기
	public ModelAndView memberDetail(@RequestParam(required = true) String member_id, @RequestParam(required = true) String status, HttpServletRequest request)
			throws Exception {

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		MemberModel view = adminService.memberView(member_id);
		List<OrderModel> orderList = adminService.memberOrderList(member_id);
		System.out.println(orderList.size());
		if (orderList.size() != 0) {
			view = adminService.memberViewOrder(member_id);
		}

		List<OrderModel> orderListBck = adminService.memberOrderListBck(member_id);

		mv.addObject("status", status);
		mv.addObject("view", view);
		mv.addObject("orderList", orderList);
		mv.addObject("listCount", orderList.size());
		mv.addObject("orderListBck", orderListBck);
		mv.addObject("listCountBck", orderListBck.size());
		mv.addObject("currentPage", currentPage);
		mv.setViewName("adminMemberDetail");

		return mv;
	}

	@RequestMapping(value = "/admin/memberInfo.do", method = RequestMethod.POST) // 회원 정보 수정
	public ModelAndView memberModify(@ModelAttribute MemberModel memberModel, BindingResult result,
			HttpServletRequest request, @RequestParam(required = true) String status) throws Exception {

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		adminService.memberModify(memberModel);
		MemberModel view = adminService.memberView(request.getParameter("member_id"));

		mv.addObject("status", status);
		mv.addObject("view", view);
		mv.addObject("currentPage", currentPage);
		mv.setViewName("adminMemberDetail");

		return mv;
	}

	@RequestMapping("/admin/memberDelete.do") // 회원 정보 삭제
	public String memberDelete(@RequestParam String member_id, @RequestParam String status, HttpServletRequest request) throws Exception {

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		adminService.memberDelete(member_id);
		// 차단, 블랙리스트 등..? 관리자에서는 회원의 사용 여부만을 변경. 회원이 탈퇴 시 정보 삭제.

		return "redirect:/admin/memberList/"+status+".do?currentPage="+currentPage;
	}

	//////////////////////////////////////////////////////////////////

	@RequestMapping(value = "/admin/bookList/{status}.do", method = RequestMethod.GET) // 도서 리스트
	public ModelAndView bookList(@PathVariable("status") String status, HttpServletRequest request) throws Exception {
		// 전체 책 리스트, 메인에 보여지는 것만. 메인에 보여지지 않는 것만. //한 페이지 내에서 다른 세개의 리스트를 출력가능할까..?
		// 카테고리 관리 기능 추가

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		List<BooksModel> booksList = new ArrayList<BooksModel>();

		if (status.equals("all")) {
			booksList = adminService.bookListAll();
		} else if (status.equals("act")) {
			booksList = adminService.bookListAct();
		} else if (status.equals("bck")) {
			booksList = adminService.bookListBck();
		} else if(status.equals("stockMgt")) {
			booksList = adminService.stockList();
		} else if(status.equals("soldOut")) {
			booksList = adminService.soldOutList();
		}

		totalCount = booksList.size();

		paging = new Paging(currentPage, totalCount, blockCount, blockPage, status);
		pagingHtml = paging.getPagingHtml().toString();

		int lastCount = totalCount;

		if (paging.getEndCount() < totalCount) {
			lastCount = paging.getEndCount() + 1;
		}

		booksList = booksList.subList(paging.getStartCount(), lastCount);

		mv.addObject("status", status);
		mv.addObject("booksList", booksList);
		mv.addObject("currentPage", currentPage);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("totalCount", totalCount);
		mv.addObject("listCount", booksList.size());

		mv.setViewName("adminBookList");

		return mv;
	}

	@RequestMapping(value = "/admin/bookList/{status}.do", method = RequestMethod.POST) // 도서 검색
	public ModelAndView bookSearch(@PathVariable("status") String status, HttpServletRequest request) {

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		Map<String, Object> map = new HashMap<String, Object>();
		List<BooksModel> booksList = new ArrayList<BooksModel>();

		int searchNum = Integer.parseInt(request.getParameter("searchNum"));
		String searchKeyword = request.getParameter("searchKeyword");
		String date_min = request.getParameter("date_min");
		String date_max = request.getParameter("date_max");
		int price_min = 0;
		int price_max = 0;
		int active = 0;

		if (status.equals("all")) {
			active = Integer.parseInt(request.getParameter("active"));
		} else if (status.equals("act")) {
			active = 1;
		}

		if (searchKeyword.trim().isEmpty()) {
			searchKeyword = null;
		}

		if (date_min.trim().isEmpty()) {
			date_min = null;
		}

		if (date_max.trim().isEmpty()) {
			date_max = null;
		}

		if(request.getParameter("price_min")==null) {
			price_min = Integer.parseInt(request.getParameter("price_min"));
		}
		
		if(request.getParameter("price_max")==null) {
			price_max = Integer.parseInt(request.getParameter("price_max"));
		}
		
		map.put("status", status);
		map.put("searchNum", searchNum);
		map.put("searchKeyword", searchKeyword);
		map.put("date_min", date_min);
		map.put("date_max", date_max);
		map.put("price_min", price_min);
		map.put("price_max", price_max);
		map.put("active", active);
		
		System.out.println(searchKeyword);
		System.out.println(date_min);
		System.out.println(date_max);

		if (searchNum == 0 && searchKeyword == null && date_min == null && date_max == null && price_min == 0
				&& price_max == 0 && active == 0) {
			booksList = adminService.bookListAll();
		} else {
			booksList = adminService.searchBook(map);
		}

		totalCount = booksList.size();
		paging = new Paging(currentPage, totalCount, blockCount, blockPage, status);
		pagingHtml = paging.getPagingHtml().toString();

		int lastCount = totalCount;

		if (paging.getEndCount() < totalCount) {
			lastCount = paging.getEndCount() + 1;
		}

		booksList = booksList.subList(paging.getStartCount(), lastCount);

		mv.addObject("status", status);
		mv.addObject("booksList", booksList);
		mv.addObject("currentPage", currentPage);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("totalCount", totalCount);
		mv.addObject("listCount", booksList.size());

		mv.setViewName("adminBookList");

		return mv;
	}

	@RequestMapping(value = "/admin/bookDetail.do", method = RequestMethod.GET) // 도서 상세보기
	public ModelAndView bookDetail(HttpServletRequest request, @RequestParam(required = true) String status) throws Exception {

		int num = Integer.parseInt(request.getParameter("book_num"));

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		BooksModel view = adminService.bookDetail(num);
		List<ReviewModel> review = booksService.reviewList(num);

		totalCount = review.size();
		int reviewPage = 1;

		paging = new Paging(reviewPage, totalCount, blockCount, blockPage, "bookDetail", num);
		pagingHtml = paging.getPagingHtml().toString();

		int lastCount = totalCount;

		if (paging.getEndCount() < totalCount) {
			lastCount = paging.getEndCount() + 1;
		}

		review = review.subList(paging.getStartCount(), lastCount);

		mv.addObject("status", status);
		mv.addObject("reviewPage", reviewPage);
		mv.addObject("currentPage", currentPage);
		mv.addObject("view", view);
		mv.addObject("review", review);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("totalCount", totalCount);
		mv.setViewName("adminBookDetail");

		return mv;
	}

	public String getFile(HttpServletRequest request, MultipartFile multipartFile) throws IllegalStateException, IOException {

		String imgFileName = multipartFile.getOriginalFilename();
		String fileType = imgFileName.substring(imgFileName.lastIndexOf('.') + 1, imgFileName.length()).toLowerCase();
		// 확장자 체크

		/*
		 * 용량 체크 long fileSize = imgFile.getSize(); if(fileSize > 10485760 || fileSize
		 * <= 0) {Validation 10MB 이상의 파일은 업로드 할 수 없습니다.}
		 */

		// if(!fileType.equals("jpg") && !fileType.equals("bmp") &&
		// !fileType.equals("gif") {Validation 이미지 파일만 업로드 가능합니다}

		String fileName = "textbook_" + String.valueOf(Calendar.getInstance().getTimeInMillis()) + '.' + fileType;
		String filePath = request.getSession().getServletContext().getRealPath("/")+"upload";
		
		multipartFile.transferTo(new File(filePath + File.separator + fileName));

		return fileName;

	}

	@RequestMapping(value = "/admin/bookWrite.do", method = RequestMethod.GET) // 도서 등록 폼 띄우기
	public ModelAndView bookWriteForm() throws Exception {

		BooksModel booksModel = new BooksModel();
		booksModel.setBook_use_yn(1);

		mv.addObject("view", booksModel);
		mv.setViewName("adminBookDetail");

		return mv;
	}

	@RequestMapping(value = "/admin/bookWrite.do", method = RequestMethod.POST) // 도서 등록하기
	public String bookWrite(HttpServletRequest request, @ModelAttribute("view") BooksModel booksModel,
			BindingResult result) throws Exception {

		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile multipartFile = multipartRequest.getFile("book_image");
		String book_image = null;

		if (multipartFile.isEmpty() == false) {

			book_image = getFile(request, multipartFile);
		}

		booksModel.setBook_image(book_image);
		String content = booksModel.getBook_content().replaceAll("\r\n","<br />");
		booksModel.setBook_content(content);
		
		adminService.insertBook(booksModel);
		BooksModel view = adminService.selectNewest();
		int book_num = view.getBook_num();

		return "redirect:/admin/bookDetail.do?status=all&book_num="+book_num;

	}

	@RequestMapping(value = "/admin/bookDetail.do", method = RequestMethod.POST) // 도서 수정하기
	public ModelAndView bookModify(HttpServletRequest request, @ModelAttribute("view") BooksModel booksModel,int currentPage,@RequestParam(required = true) String status) throws Exception {

		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartRequest.getFileNames();
		MultipartFile multipartFile = null;
		String book_image = null;
		int book_num = Integer.parseInt(request.getParameter("book_num"));
		while (iterator.hasNext()) {
			multipartFile = multipartRequest.getFile(iterator.next());
			if (multipartFile.isEmpty() == false) {
				log.debug("------------- file start -------------");
				log.debug("name : " + multipartFile.getName());
				log.debug("filename : " + multipartFile.getOriginalFilename());
				log.debug("size : " + multipartFile.getSize());
				log.debug("-------------- file end --------------\n");
				book_image = getFile(request, multipartFile);
			} else {
				book_image = request.getParameter("book_image");
			}
		}
		
		booksModel.setBook_num(book_num);
		booksModel.setBook_image(book_image);
		String content = booksModel.getBook_content().replaceAll("\r\n","<br />");
		booksModel.setBook_content(content);
		adminService.modifyBook(booksModel);

		BooksModel view = booksService.bookOne(booksModel.getBook_num());

		mv.addObject("status", status);
		mv.addObject("view", view);
		mv.addObject("currentPage", currentPage);
		mv.setViewName("adminBookDetail");

		return mv;
	}

	@RequestMapping("/admin/bookDelete.do") // 도서 삭제하기
	public String bookDelete(@RequestParam int book_num, @RequestParam int currentPage, HttpServletRequest request,
			@RequestParam(required = true) String status) throws Exception {

		adminService.deleteBook(book_num);
		return "redirect:/admin/bookList/"+status+".do?currentPage=" + currentPage;
	}

	@RequestMapping("/admin/reviewDelete.do") // 리뷰 삭제하기
	public String reviewDelete(@RequestParam int review_num, @RequestParam int book_num, @RequestParam(required = true) String status) throws Exception {

		adminService.deleteReview(review_num);
		return "redirect:/admin/bookDetail.do?status="+status+"&book_num=" + book_num;
	}

	/////////////////////////////////////////////////////////////////

	@RequestMapping(value = "/admin/orderList/{status}.do", method = RequestMethod.GET) // 주문 조회하기
	public ModelAndView orderList(@PathVariable("status") String status, HttpServletRequest request) throws Exception {

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		List<OrderModel> orderList = new ArrayList<OrderModel>();

		if (status.equals("all")) {
			orderList = adminService.orderListAll();
		} else if (status.equals("trade")) {
			orderList = adminService.orderListTrade();
		} else if (status.equals("trans")) {
			orderList = adminService.orderListTrans();
		} else if (status.equals("bck")) {
			orderList = adminService.orderListBck();
		}

		totalCount = orderList.size();

		paging = new Paging(currentPage, totalCount, blockCount, blockPage, status);
		pagingHtml = paging.getPagingHtml().toString();

		int lastCount = totalCount;

		if (paging.getEndCount() < totalCount) {
			lastCount = paging.getEndCount() + 1;
		}

		orderList = orderList.subList(paging.getStartCount(), lastCount);

		mv.addObject("status", status);
		mv.addObject("orderList", orderList);
		mv.addObject("currentPage", currentPage);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("totalCount", totalCount);
		mv.addObject("listCount", orderList.size());

		mv.setViewName("adminOrderList");

		return mv;
	}

	@RequestMapping(value = "/admin/orderList/{status}.do", method = RequestMethod.POST) // 주문 검색
	public ModelAndView orderSearch(@PathVariable("status") String status, HttpServletRequest request) {

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		Map<String, Object> map = new HashMap<String, Object>();
		List<OrderModel> orderList = new ArrayList<OrderModel>();

		int searchNum = Integer.parseInt(request.getParameter("searchNum"));
		String searchKeyword = request.getParameter("searchKeyword");
		String date_min = request.getParameter("date_min");
		String date_max = request.getParameter("date_max");
		int active = 0;
		int pay_s = Integer.parseInt(request.getParameter("payment_status"));
		int trans_s = Integer.parseInt(request.getParameter("order_trans_status"));

		if (status.equals("all")) {
			active = Integer.parseInt(request.getParameter("active"));
		} else if (status.equals("bck")) {
			active = 1;
		}

		if (searchKeyword.trim().isEmpty()) {
			searchKeyword = null;
		}

		if (date_min.trim().isEmpty()) {
			date_min = null;
		}

		if (date_max.trim().isEmpty()) {
			date_max = null;
		}

		map.put("searchNum", searchNum);
		map.put("searchKeyword", searchKeyword);
		map.put("date_min", date_min);
		map.put("date_max", date_max);
		map.put("active", active);
		map.put("pay_s", pay_s);
		map.put("trans_s", trans_s);

		if (searchNum == 0 && searchKeyword == null && date_min == null && date_max == null && active == 0 && pay_s == 0
				&& trans_s == 0) {
			orderList = adminService.orderListAll();
		} else {
			orderList = adminService.searchOrder(map);
		}

		totalCount = orderList.size();
		paging = new Paging(currentPage, totalCount, blockCount, blockPage, status);
		pagingHtml = paging.getPagingHtml().toString();

		int lastCount = totalCount;

		if (paging.getEndCount() < totalCount) {
			lastCount = paging.getEndCount() + 1;
		}

		orderList = orderList.subList(paging.getStartCount(), lastCount);

		mv.addObject("status", status);
		mv.addObject("orderList", orderList);
		mv.addObject("currentPage", currentPage);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("totalCount", totalCount);
		mv.addObject("listCount", orderList.size());

		mv.setViewName("adminOrderList");

		return mv;
	}

	@RequestMapping(value = "/admin/orderDetail.do", method = RequestMethod.GET) // 주문 상세보기
	public ModelAndView orderDetail(@RequestParam String order_trade_num, @RequestParam String status, HttpServletRequest request) throws Exception {

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		OrderModel view = adminService.selectOrder(order_trade_num);
		List<OrderDetailModel> orderDetailList = adminService.selectOrderDetail(order_trade_num);
		MemberModel viewMember = memberService.SelectOne(view.getMember_id());

		mv.addObject("status", status);
		mv.addObject("view", view);
		mv.addObject("viewM", viewMember);
		mv.addObject("orderDetailList", orderDetailList);
		mv.addObject("currentPage", currentPage);
		mv.setViewName("adminOrderDetail");

		return mv;
	}

	@RequestMapping(value = "/admin/orderDetail.do", method = RequestMethod.POST) // 주문 수정하기
	public ModelAndView orderModify(@ModelAttribute OrderModel orderModel, HttpServletRequest request)
			throws Exception {

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		String status = request.getParameter("status");
		adminService.modifyOrder(orderModel);

		mv.addObject("status", status);
		mv.addObject("order_trade_num", orderModel.getOrder_trade_num());
		mv.addObject("currentPage", currentPage);
		mv.setViewName("redirect:/admin/orderDetail.do");

		return mv;
	}
	
	@RequestMapping("/admin/orderDelete.do")
	public String orderDelete(@RequestParam String order_trade_num, @RequestParam String status, 
			HttpServletRequest request) throws Exception {
		
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		adminService.deleteOrder(order_trade_num);
		return "redirect:/admin/orderList/"+status+".do?currentPage="+currentPage;
	}

	
	/////////////////////////////////////////////////////////////////

	@RequestMapping("/admin/chart/member.do")
	public ModelAndView chartM() {

		// 신규 회원 통계
		List<ChartModel> listNew = adminService.chartNewM();

		GoogleChartDTO goNew = new GoogleChartDTO();

		goNew.addColumn("DAY", "string");
		goNew.addColumn("신규 회원수", "number");
		goNew.createRows(listNew.size());

		for (int i = 0; i < listNew.size(); i++) {
			goNew.addCell(i, listNew.get(i).getKey() + "(일)");
			goNew.addCell(i, listNew.get(i).getValue());
		}

		String jsonNew = gson.toJson(goNew.getResult());

		// 전체 회원 통계
		List<ChartModel> listAll = adminService.chartAllM();

		GoogleChartDTO goAll = new GoogleChartDTO();

		goAll.addColumn("DAY", "string");
		goAll.addColumn("전체 회원수", "number");
		goAll.createRows(listAll.size());

		for (int i = 0; i < listAll.size(); i++) {
			goAll.addCell(i, listAll.get(i).getKey() + "(월)");
			goAll.addCell(i, listAll.get(i).getValue());
		}

		String jsonAll = gson.toJson(goAll.getResult());
		System.out.println(jsonAll);

		// 신규회원 성별 통계
		List<ChartModel> newMemberGender = adminService.newMemberGender();
		GoogleChartDTO pie1 = new GoogleChartDTO();

		pie1.addColumn("성별", "string");
		pie1.addColumn("number", "number");
		pie1.createRows(newMemberGender.size());

		for (int i = 0; i < newMemberGender.size(); i++) {
			pie1.addCell(i, Integer.parseInt(newMemberGender.get(i).getKey()) == 1 ? "남자" : "여자");
			pie1.addCell(i, newMemberGender.get(i).getValue());
		}
		String newGenderPie = gson.toJson(pie1.getResult());
		mv.addObject("newGenderPie", newGenderPie);

		// 신규회원 연령 통계
		List<ChartModel> newMemberAge = adminService.newMemberAge();
		GoogleChartDTO pie2 = new GoogleChartDTO();

		pie2.addColumn("연령대", "string");
		pie2.addColumn("number", "number");
		pie2.createRows(newMemberAge.size());

		for (int i = 0; i < newMemberAge.size(); i++) {
			pie2.addCell(i, newMemberAge.get(i).getKey() + "0 년대");
			pie2.addCell(i, newMemberAge.get(i).getValue());
		}
		String newAgePie = gson.toJson(pie2.getResult());
		mv.addObject("newAgePie", newAgePie);

		// 신규회원 지역 통계
		List<ChartModel> newMemberRegion = adminService.newMemberRegion();
		GoogleChartDTO pie3 = new GoogleChartDTO();

		pie3.addColumn("지역", "string");
		pie3.addColumn("number", "number");
		pie3.createRows(newMemberRegion.size());

		for (int i = 0; i < newMemberRegion.size(); i++) {
			pie3.addCell(i, newMemberRegion.get(i).getKey());
			pie3.addCell(i, newMemberRegion.get(i).getValue());
		}
		String newRegionPie = gson.toJson(pie3.getResult());
		mv.addObject("newRegionPie", newRegionPie);

		// 전체 회원 성별 통계
		List<ChartModel> memberGender = adminService.memberGender();
		GoogleChartDTO pie4 = new GoogleChartDTO();

		pie4.addColumn("성별", "string");
		pie4.addColumn("number", "number");
		pie4.createRows(memberGender.size());

		for (int i = 0; i < memberGender.size(); i++) {
			pie4.addCell(i, Integer.parseInt(memberGender.get(i).getKey()) == 1 ? "남자" : "여자");
			pie4.addCell(i, memberGender.get(i).getValue());
		}
		String genderPie = gson.toJson(pie4.getResult());
		mv.addObject("genderPie", genderPie);

		// 전체 회원 나이 통계
		List<ChartModel> memberAge = adminService.memberAge();
		GoogleChartDTO pie5 = new GoogleChartDTO();

		pie5.addColumn("연령대", "string");
		pie5.addColumn("number", "number");
		pie5.createRows(memberAge.size());

		for (int i = 0; i < memberAge.size(); i++) {
			pie5.addCell(i, memberAge.get(i).getKey() + "0 년대");
			pie5.addCell(i, memberAge.get(i).getValue());
		}
		String agePie = gson.toJson(pie5.getResult());
		mv.addObject("agePie", agePie);

		// 전체 회원 지역 통계
		List<ChartModel> memberRegion = adminService.memberRegion();
		GoogleChartDTO pie6 = new GoogleChartDTO();

		pie6.addColumn("지역", "string");
		pie6.addColumn("number", "number");
		pie6.createRows(memberRegion.size());

		for (int i = 0; i < memberRegion.size(); i++) {
			pie6.addCell(i, memberRegion.get(i).getKey());
			pie6.addCell(i, memberRegion.get(i).getValue());
		}
		String regionPie = gson.toJson(pie6.getResult());
		mv.addObject("regionPie", regionPie);

		mv.addObject("jsonAll", jsonAll);
		mv.addObject("jsonNew", jsonNew);
		mv.addObject("request", 1);
		mv.setViewName("adminChart");

		return mv;
	}

	@RequestMapping("/admin/chart/order.do")
	public ModelAndView chartO() {

		Gson gson = new Gson();

		// 최근 7일 날짜별 주문량 조회
		List<ChartModel> weekOrderNum = adminService.weekOrderNum();
		GoogleChartDTO line1 = new GoogleChartDTO();

		line1.addColumn("day", "string");
		line1.addColumn("주문수", "number");
		line1.createRows(weekOrderNum.size());

		for (int i = 0; i < weekOrderNum.size(); i++) {
			line1.addCell(i, weekOrderNum.get(i).getKey());
			line1.addCell(i, weekOrderNum.get(i).getValue());
		}
		String jsonNew = gson.toJson(line1.getResult());
		mv.addObject("jsonNew", jsonNew);

		// 최근 7일 날짜별 판매량 조회
		List<ChartModel> weekSales = adminService.weekSales();
		GoogleChartDTO sales1 = new GoogleChartDTO();

		sales1.addColumn("day", "string");
		sales1.addColumn("판매금액", "number");
		sales1.createRows(weekSales.size());

		for (int i = 0; i < weekSales.size(); i++) {
			sales1.addCell(i, weekSales.get(i).getKey());
			sales1.addCell(i, weekSales.get(i).getPrice());
		}
		String salesNew = gson.toJson(sales1.getResult());
		mv.addObject("salesNew", salesNew);

		// 주간 성별 구분
		List<ChartModel> weekOrderGender = adminService.weekOrderGender();
		GoogleChartDTO pie1 = new GoogleChartDTO();

		pie1.addColumn("성별", "string");
		pie1.addColumn("number", "number");
		pie1.createRows(weekOrderGender.size());

		for (int i = 0; i < weekOrderGender.size(); i++) {
			pie1.addCell(i, Integer.parseInt(weekOrderGender.get(i).getKey()) == 1 ? "남자" : "여자");
			pie1.addCell(i, weekOrderGender.get(i).getValue());
		}
		String newGenderPie = gson.toJson(pie1.getResult());
		mv.addObject("newGenderPie", newGenderPie);

		// 주간 연령 구분
		List<ChartModel> weekOrderAge = adminService.weekOrderAge();
		GoogleChartDTO pie2 = new GoogleChartDTO();

		pie2.addColumn("연령대", "string");
		pie2.addColumn("number", "number");
		pie2.createRows(weekOrderAge.size());

		for (int i = 0; i < weekOrderAge.size(); i++) {
			pie2.addCell(i, weekOrderAge.get(i).getKey() + "0 년대");
			pie2.addCell(i, weekOrderAge.get(i).getValue());
		}
		String newAgePie = gson.toJson(pie2.getResult());
		mv.addObject("newAgePie", newAgePie);

		// 주간 지역 구분
		List<ChartModel> weekOrderRegion = adminService.weekOrderRegion();
		GoogleChartDTO pie3 = new GoogleChartDTO();

		pie3.addColumn("지역", "string");
		pie3.addColumn("number", "number");
		pie3.createRows(weekOrderRegion.size());

		for (int i = 0; i < weekOrderRegion.size(); i++) {
			pie3.addCell(i, weekOrderRegion.get(i).getKey());
			pie3.addCell(i, weekOrderRegion.get(i).getValue());
		}
		String newRegionPie = gson.toJson(pie3.getResult());
		System.out.println(newRegionPie);

		mv.addObject("newRegionPie", newRegionPie);

		// 달별 주문량
		List<ChartModel> monthOrderNum = adminService.monthOrderNum();
		GoogleChartDTO line2 = new GoogleChartDTO();

		line2.addColumn("day", "string");
		line2.addColumn("주문수", "number");
		line2.createRows(monthOrderNum.size());

		for (int i = 0; i < monthOrderNum.size(); i++) {
			line2.addCell(i, monthOrderNum.get(i).getKey());
			line2.addCell(i, monthOrderNum.get(i).getValue());
		}
		String jsonAll = gson.toJson(line2.getResult());
		mv.addObject("jsonAll", jsonAll);

		// 달별 판매량
		List<ChartModel> monthSales = adminService.monthSales();
		GoogleChartDTO sales2 = new GoogleChartDTO();

		sales2.addColumn("day", "string");
		sales2.addColumn("판매 금액", "number");
		sales2.createRows(monthSales.size());

		for (int i = 0; i < monthSales.size(); i++) {
			sales2.addCell(i, monthSales.get(i).getKey());
			sales2.addCell(i, monthSales.get(i).getPrice());
		}
		String salesAll = gson.toJson(sales2.getResult());
		mv.addObject("salesAll", salesAll);

		// 달별 성별 구분
		List<ChartModel> monthOrderGender = adminService.monthOrderGender();
		GoogleChartDTO pie4 = new GoogleChartDTO();

		pie4.addColumn("항목", "string");
		pie4.addColumn("값", "number");
		pie4.createRows(monthOrderGender.size());

		for (int i = 0; i < monthOrderGender.size(); i++) {
			pie4.addCell(i, Integer.parseInt(monthOrderGender.get(i).getKey()) == 1 ? "남자" : "여자");
			pie4.addCell(i, monthOrderGender.get(i).getValue());
		}
		String genderPie = gson.toJson(pie4.getResult());
		System.out.println(genderPie);
		mv.addObject("genderPie", genderPie);

		// 달별 연령 구분
		List<ChartModel> monthOrderAge = adminService.monthOrderAge();
		GoogleChartDTO pie5 = new GoogleChartDTO();

		pie5.addColumn("항목", "string");
		pie5.addColumn("값", "number");
		pie5.createRows(monthOrderAge.size());

		for (int i = 0; i < monthOrderAge.size(); i++) {
			pie5.addCell(i, monthOrderAge.get(i).getKey() + "0 년대");
			pie5.addCell(i, monthOrderAge.get(i).getValue());
		}
		String agePie = gson.toJson(pie5.getResult());
		mv.addObject("agePie", agePie);

		// 달별 지역 구분
		List<ChartModel> monthOrderRegion = adminService.monthOrderRegion();
		GoogleChartDTO pie6 = new GoogleChartDTO();

		pie6.addColumn("항목", "string");
		pie6.addColumn("값", "number");
		pie6.createRows(monthOrderRegion.size());

		for (int i = 0; i < monthOrderRegion.size(); i++) {
			pie6.addCell(i, monthOrderRegion.get(i).getKey());
			pie6.addCell(i, monthOrderRegion.get(i).getValue());
		}
		String regionPie = gson.toJson(pie6.getResult());
		mv.addObject("regionPie", regionPie);

		mv.addObject("request", 2);
		mv.setViewName("adminChart");
		return mv;

	}

	@RequestMapping("/admin/chart/book.do")
	public ModelAndView chartB() {

		List<BooksModel> bookSelling = adminService.bookSelling();
		List<BooksModel> monthBookSelling = adminService.monthBookSelling();
		List<BooksModel> weekBookSelling = adminService.weekBookSelling();

		mv.addObject("bookSelling", bookSelling);
		mv.addObject("monthBookSelling", monthBookSelling);
		mv.addObject("weekBookSelling", weekBookSelling);
		mv.setViewName("adminChartBook");
		return mv;
	}

}
