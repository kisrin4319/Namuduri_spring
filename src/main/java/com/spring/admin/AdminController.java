package com.spring.admin;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;
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

	@RequestMapping("/admin/main.do") // 관리자 페이지
	public ModelAndView adminMain() throws Exception {
		mv.setViewName("admin");
		return mv;
	}

	////////////////////////////////////////////////////////////////////

	@RequestMapping(value="/admin/memberList.do", method=RequestMethod.GET) // 회원 조회
	public ModelAndView memberList(HttpServletRequest request)
			throws Exception {

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		List<MemberModel> memberList = new ArrayList<MemberModel>();
		memberList = adminService.memberListAll();
		
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
	
	@RequestMapping(value="/admin/memberList.do", method=RequestMethod.POST) // 회원 검색
	public ModelAndView memberSearch(HttpServletRequest request) {
		
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
		int active = Integer.parseInt(request.getParameter("active"));
		
		if(searchKeyword.trim().isEmpty()) {
			searchKeyword = null;
		}
		
		if(date_min.trim().isEmpty()) {
			date_min = null;
		}
		
		if(date_max.trim().isEmpty()) {
			date_max = null;
		}
		
		map.put("searchNum", searchNum);
		map.put("searchKeyword", searchKeyword);
		map.put("date_min", date_min);
		map.put("date_max", date_max);
		map.put("active", active);
		
		if(searchNum==0 && searchKeyword==null && date_min==null && date_max==null && active==0) {
			memberList = adminService.memberListAll();
		}else {
			memberList = adminService.searchMember(map);
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

	@RequestMapping(value = "/admin/memberInfo.do", method = RequestMethod.GET) // 회원 상세보기
	public ModelAndView memberDetail(@RequestParam(required = true) String member_id, HttpServletRequest request)
			throws Exception {

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		MemberModel view = adminService.memberView(member_id);
		List<OrderModel> orderList = mypageService.getOrderTradeNumList(member_id);

		mv.addObject("view", view);
		mv.addObject("orderList", orderList);
		mv.addObject("listCount", orderList.size());
		mv.addObject("currentPage", currentPage);
		mv.setViewName("adminMemberDetail");

		return mv;
	}

	@RequestMapping(value = "/admin/memberInfo.do", method = RequestMethod.POST) // 회원 정보 수정
	public ModelAndView memberModify(@ModelAttribute MemberModel memberModel, BindingResult result,
			HttpServletRequest request) throws Exception {

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		adminService.memberModify(memberModel);
		MemberModel view = adminService.memberView(request.getParameter("member_id"));

		mv.addObject("view", view);
		mv.addObject("currentPage", currentPage);
		mv.setViewName("adminMemberDetail");

		return mv;
	}

	@RequestMapping("/admin/memberDelete.do") // 회원 정보 삭제
	public ModelAndView memberDelete(@RequestParam String member_id, HttpServletRequest request) throws Exception {

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		MemberModel memberModel = new MemberModel();
		memberModel.setMember_id(member_id);

		mypageService.memberDelete(memberModel);
		// 차단, 블랙리스트 등..? 관리자에서는 회원의 사용 여부만을 변경. 회원이 탈퇴 시 정보 삭제.

		mv.addObject("currentPage", currentPage);
		mv.setViewName("redirect:/admin/memberList.do");

		return mv;
	}

	//////////////////////////////////////////////////////////////////

	@RequestMapping(value="/admin/bookList.do", method=RequestMethod.GET) // 도서 리스트
	public ModelAndView bookList(HttpServletRequest request) throws Exception {
		// 전체 책 리스트, 메인에 보여지는 것만. 메인에 보여지지 않는 것만. //한 페이지 내에서 다른 세개의 리스트를 출력가능할까..?
		// 카테고리 관리 기능 추가

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		/*
		 * String searchNum = request.getParameter("searchNum"); String searchKeyword =
		 * request.getParameter("searchKeyword");
		 * 
		 * Map<String, Object> map = new HashMap<String, Object>();
		 */
		List<BooksModel> booksList = adminService.bookListAll();

		/*
		 * if((searchNum==null || searchNum.trim().isEmpty() || searchNum.equals("0"))
		 * && (searchKeyword==null || searchKeyword.trim().isEmpty() ||
		 * searchKeyword.equals("0"))) { booksList = adminService.booksListAll(); } else
		 * { map.put("searchNum", searchNum); map.put("searchKeyword", searchKeyword);
		 * 
		 * booksList = adminService.searchBook(map); }
		 */

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
	
	@RequestMapping(value="/admin/bookList.do", method=RequestMethod.POST) // 도서 검색
	public ModelAndView bookSearch(HttpServletRequest request) {
		
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
		int active = Integer.parseInt(request.getParameter("active"));
		
		if(searchKeyword.trim().isEmpty()) {
			searchKeyword = null;
		}
		
		if(date_min.trim().isEmpty()) {
			date_min = null;
		}
		
		if(date_max.trim().isEmpty()) {
			date_max = null;
		}
		
		map.put("searchNum", searchNum);
		map.put("searchKeyword", searchKeyword);
		map.put("date_min", date_min);
		map.put("date_max", date_max);
		map.put("active", active);
		
		if(searchNum==0 && searchKeyword==null && date_min==null && date_max==null && active==0) {
			booksList = adminService.bookListAll();
		}else {
			booksList = adminService.searchBook(map);
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

	@RequestMapping("/admin/bookDetail.do") // 도서 상세보기
	public ModelAndView bookDetail(HttpServletRequest request) throws Exception {

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

		mv.addObject("reviewPage", reviewPage);
		mv.addObject("currentPage", currentPage);
		mv.addObject("view", view);
		mv.addObject("review", review);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("totalCount", totalCount);
		mv.setViewName("adminBookDetail");

		return mv;
	}

	public String getFile(HttpServletRequest request, MultipartFile multipartFile)
			throws IllegalStateException, IOException {

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
		String filePath = request.getSession().getServletContext().getRealPath("/") + "upload";

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
	public ModelAndView bookWrite(HttpServletRequest request, @ModelAttribute("view") BooksModel booksModel,
			BindingResult result) throws Exception {

		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile multipartFile = multipartRequest.getFile("book_image");
		String book_image = null;

		if (multipartFile.isEmpty() == false) {

			book_image = getFile(request, multipartFile);
		}

		booksModel.setBook_image(book_image);

		adminService.insertBook(booksModel);
		BooksModel view = adminService.selectNewest();

		mv.addObject("currentPage", 1);
		mv.addObject("view", view);
		mv.setViewName("adminBookDetail");

		return mv;

	}

	@RequestMapping(value = "/admin/bookModify.do", method = RequestMethod.GET)
	public ModelAndView bookModifyForm(@RequestParam int book_num, @RequestParam int currentPage) throws Exception {

		BooksModel view = adminService.bookDetail(book_num);

		mv.addObject("view", view);
		mv.addObject("currentPage", currentPage);
		mv.setViewName("adminBookDetail");

		return mv;
	}

	@RequestMapping(value = "/admin/bookModify.do", method = RequestMethod.POST) // 도서 수정하기
	public ModelAndView bookModify(HttpServletRequest request, @ModelAttribute("view") BooksModel booksModel,
			int currentPage) throws Exception {

		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile multipartFile = multipartRequest.getFile("book_image");
		String book_image = null;

		if (multipartFile.isEmpty() == false) // 파일이 존재할 때
		{
			book_image = getFile(request, multipartFile);
		} else { // 파일이 존재하지 않을때
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

	@RequestMapping("/admin/bookDelete.do") // 도서 삭제하기
	public ModelAndView bookDelete(@RequestParam int book_num, @RequestParam int currentPage) throws Exception {

		adminService.deleteBook(book_num);

		mv.addObject("currentPage", currentPage);
		mv.setViewName("redirect:/admin/bookList.do");

		return mv;
	}

	@RequestMapping("/admin/reviewDelete.do") // 리뷰 삭제하기
	public ModelAndView reviewDelete(@RequestParam int review_num, @RequestParam int book_num) throws Exception {

		adminService.deleteReview(review_num);

		mv.addObject("book_num", book_num);
		mv.setViewName("redirect:/admin/bookDetail.do");

		return mv;
	}

	/////////////////////////////////////////////////////////////////

	@RequestMapping(value="/admin/orderList.do", method=RequestMethod.GET) // 주문 조회하기
	public ModelAndView orderList(HttpServletRequest request) throws Exception {
		
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		/*String searchNum = request.getParameter("searchNum");
		String searchKeyword = request.getParameter("searchKeyword");*/

		
		List<OrderModel> orderList = adminService.selectOrderAll();
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
	
	@RequestMapping(value="/admin/orderList.do", method=RequestMethod.POST) // 주문 검색
	public ModelAndView orderSearch(HttpServletRequest request) {
		
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
		int active = Integer.parseInt(request.getParameter("active"));
		int pay_s = Integer.parseInt(request.getParameter("payment_status"));
		int trans_s = Integer.parseInt(request.getParameter("order_trans_status"));
		
		if(searchKeyword.trim().isEmpty()) {
			searchKeyword = null;
		}
		
		if(date_min.trim().isEmpty()) {
			date_min = null;
		}
		
		if(date_max.trim().isEmpty()) {
			date_max = null;
		}
		
		map.put("searchNum", searchNum);
		map.put("searchKeyword", searchKeyword);
		map.put("date_min", date_min);
		map.put("date_max", date_max);
		map.put("active", active);
		map.put("pay_s", pay_s);
		map.put("trans_s", trans_s);
		
		if(searchNum==0 && searchKeyword==null && date_min==null && date_max==null && active==0 && pay_s==0 && trans_s==0) {
			orderList = adminService.selectOrderAll();
		}else {
			orderList = adminService.searchOrder(map);
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

	@RequestMapping(value = "/admin/orderDetail.do", method = RequestMethod.GET) // 주문 상세보기
	public ModelAndView orderDetail(@RequestParam String order_trade_num, HttpServletRequest request) throws Exception {

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		OrderModel view = adminService.selectOrder(order_trade_num);
		List<OrderDetailModel> orderDetailList = adminService.selectOrderDetail(order_trade_num);
		MemberModel viewMember = memberService.SelectOne(view.getMember_id());

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

		adminService.modifyOrder(orderModel);

		mv.addObject("order_trade_num", orderModel.getOrder_trade_num());
		mv.addObject("currentPage", currentPage);
		mv.setViewName("redirect:/admin/orderDetail.do");

		return mv;
	}

	/////////////////////////////////////////////////////////////////
	
	@RequestMapping("/admin/chart/member.do")
	public ModelAndView chartM() {
		
		JSONObject data = new JSONObject();
		
		JSONArray colsData = new JSONArray();
		JSONObject cols1 = new JSONObject();
		JSONObject cols2 = new JSONObject();
		
		cols1.put("id", "dayNo");
		cols1.put("label", "날짜");
		cols1.put("type", "Date");
		
		cols2.put("id", "item_C");
		cols2.put("label", "회원 수");
		cols2.put("type", "number");
		
		colsData.put(cols1);
		colsData.put(cols2);
		
		System.out.println(colsData);
		/*[{"id":"dayNo","label":"날짜","type":"String"},{"id":"item_C","label":"회원 수","type":"number"}]*/
		
		
		JSONArray rowsData = new JSONArray(); //rows 리스트
		JSONObject rowData = new JSONObject(); //{"c":한 행의 object값들을 담은 JSONArray}
		JSONArray row = new JSONArray(); //한 행에 필요한 JSONObject들을 담기 위한 JSONArray
		JSONObject row1 = new JSONObject(); //"property":value의 한 쌍
		JSONObject row2 = new JSONObject();
		
		List<ChartModel> list = adminService.chartM();
		System.out.println(list);
		
		/*rowData를 list의 행만큼 만들어서 rowsData안에 넣기!*/
		for(int i=0; i<list.size(); i++) {
			
			ChartModel chartModel = list.get(i);
			
				row1.put("v", chartModel.getDayNo());
				row.put(row1);
				
				row2.put("v", chartModel.getItem_C());
				row.put(row2);
				
				rowData.put("c", row);
				
				
		}
		
		rowsData.put(rowData);
		
		data.put("cols", colsData);
		data.put("rows", rowsData);
		
		
		System.out.println(data);
	
		
		/*mv.addObject("data", data);*/
		mv.addObject("list", list);
		mv.setViewName("adminChart");
		
		return mv;
	}
}
