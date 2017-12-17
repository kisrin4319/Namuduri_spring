package com.spring.mypage;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.book.BooksService;
import com.spring.common.Paging;
import com.spring.member.MemberModel;
import com.spring.member.MemberService;
import com.spring.order.OrderModel;
import com.spring.order.OrderService;

@Controller
public class MypageController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private MypageService mypageService;
	@Resource
	private MemberService memberService;
	@Resource
	private OrderService orderService;
	@Resource
	private BooksService booksService;
	
	ModelAndView mv;
	String session_id;
	
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 5;
	private int blockPage = 10;
	private String pagingHtml;
	private Paging paging;
	
	//mypage
	@RequestMapping(value = "/mypage.do")
	public ModelAndView mypage(OrderModel order, HttpServletRequest request, HttpSession session) throws Exception {
		
		mv = new ModelAndView();
		List<OrderModel> orderModel = new ArrayList<OrderModel>();
		
		String member_id = (String) session.getAttribute("member_id");
		
		List<OrderModel> tradeNumList = mypageService.getOrderTradeNumList(member_id);
		for(int i=0; i<tradeNumList.size(); i++) {
			OrderModel model = tradeNumList.get(i);
			String orderTradeNum = model.getOrder_trade_num();
			
			OrderModel getOrderInfo = mypageService.getOrderInfo(orderTradeNum);
			
			orderModel.add(getOrderInfo);
		}
		
		if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		totalCount = orderModel.size();
		
		paging = new Paging(currentPage, totalCount, blockCount, blockPage, "mypage");
		pagingHtml = paging.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(paging.getEndCount() < totalCount) {
			lastCount = paging.getEndCount() + 1;
		}
		orderModel = orderModel.subList(paging.getStartCount(), lastCount);
		
		mv.addObject("orderModel", orderModel);
		mv.addObject("currentPage", currentPage);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("totalCount", totalCount);
		mv.addObject("listCount", orderModel.size());
		mv.setViewName("orderListCheck1");
		mv.setViewName("mypage1");
		return mv;
	}
	
	//1. 아이디 찾기
	@RequestMapping(value = "/member/memberIdFindView.do")
	public ModelAndView memberIdFind() {
		mv = new ModelAndView();
		
		mv.setViewName("findId");
		return mv;
	}
	
	@RequestMapping(value = "/member/memberIdFind.do")
	@ResponseBody
	public Map<String, Object> memberIdFind(HttpServletRequest request, HttpSession session) throws Exception {
		
		Map<String, Object> object = new HashMap<String, Object>();
		
		mv = new ModelAndView();
		MemberModel memberModel = new MemberModel();
		
		memberModel.setMember_id(session_id);
		
		memberModel.setMember_name(request.getParameter("member_name"));
		memberModel.setMember_jumin1(Integer.parseInt(request.getParameter("member_jumin1")));
		memberModel.setMember_jumin2(Integer.parseInt(request.getParameter("member_jumin2")));
		
		MemberModel member = mypageService.memberIdFind(memberModel);
		if(member != null) {
			if(memberModel.getMember_name().equals(member.getMember_name()) && memberModel.getMember_jumin1() == member.getMember_jumin1() && memberModel.getMember_jumin2() == member.getMember_jumin2()) {
				object.put("returnVal", "1");
				object.put("member_id", member.getMember_id());
			}else {
				object.put("returnVal", "0");
			}
		}else {
			object.put("returnVal", "0");
		}
		return object;
	}
	
	//비밀번호 찾기
	@RequestMapping(value = "/member/memberPwFindView.do")
	public ModelAndView memberPwFind() {
		mv = new ModelAndView();
		
		mv.setViewName("findPw");
		return mv;
	}

	@RequestMapping(value = "/member/memberPwFind.do")
	@ResponseBody
	public Map<String, Object> memberPwFind(HttpServletRequest request, HttpSession session) throws Exception {
		
		Map<String, Object> object = new HashMap<String, Object>();
		
		mv = new ModelAndView();
		MemberModel memberModel = new MemberModel();
		
		memberModel.setMember_id(session_id);

		memberModel.setMember_id(request.getParameter("member_id"));
		memberModel.setMember_email(request.getParameter("member_email"));
		
		MemberModel member = mypageService.memberPwFind(memberModel);
		if(member != null) {
			if(memberModel.getMember_id().equals(member.getMember_id()) && memberModel.getMember_email().equals(member.getMember_email())) {
				object.put("returnVal", "1");
				object.put("member_pw", member.getMember_pw());
			} else {
				object.put("returnVal", "0");
			}
		} else {
			object.put("returnVal", "0");

		}
		return object;
	}
	
	//3. 회원 탈퇴
	@RequestMapping(value = "/member/memberDeleteView.do")
	public ModelAndView memberDelete() {
		mv = new ModelAndView();
		
		mv.setViewName("memberDelete1");
		return mv;
	}
	
	@RequestMapping(value = "/member/memberDelete.do")
	@ResponseBody
	public Map<String, Object> memberDelete(HttpServletRequest request, HttpSession session) throws Exception {
		
		Map<String, Object> object = new HashMap<String, Object>();
		
		mv = new ModelAndView();
		MemberModel memberModel = new MemberModel();
		
		memberModel.setMember_id(session_id);
		memberModel.setMember_id(request.getParameter("member_id"));
		memberModel.setMember_pw(request.getParameter("member_pw"));
		
		int member = mypageService.memberDelete(memberModel);
		
		if(member > 0) {
			object.put("returnVal", "1");
		}else {
			object.put("returnVal", "0");
		}
		return object;
	}
	
	//4. 회원정보 수정
	@RequestMapping(value = "/member/memberModifyView.do")
	public ModelAndView memberModify(MemberModel member, HttpServletRequest request , HttpSession session) throws Exception {
		
		mv = new ModelAndView();
		
		String member_id = (String) session.getAttribute("member_id");
		
		MemberModel memberInfo = mypageService.getMemberInfo(member_id);
		/**
		 * void = 반환되는 값 없음(ex. mypageService.getMemberInfo(member_id);)
		 * int = 정수형 반환(ex. int memberInfo = mypageService.getMemberInfo(member_id);)
		 * vo = vo 반환(ex. MemberModel memberInfo = mypageService.getMemberInfo(member_id);)
		 */
		mv.addObject("memberInfo", memberInfo);
		mv.setViewName("memberModify");

		return mv;
	}
	
	@RequestMapping(value = "/member/memberModify.do")
	@ResponseBody
	public Map<String, Object> memberModify(HttpServletRequest request, HttpSession session) throws Exception {
		
		Map<String, Object> object = new HashMap<String, Object>();
		
		mv = new ModelAndView();
		MemberModel memberModel = new MemberModel();
		
		memberModel.setMember_id(request.getParameter("member_id"));
		memberModel.setMember_pw(request.getParameter("member_pw"));
		memberModel.setMember_name(request.getParameter("member_name"));
		memberModel.setMember_jumin1(Integer.parseInt(request.getParameter("member_jumin1")));
		memberModel.setMember_jumin2(Integer.parseInt(request.getParameter("member_jumin2")));
		memberModel.setMember_zipcode(request.getParameter("member_zipcode"));
		memberModel.setMember_addr1(request.getParameter("member_addr1"));
		memberModel.setMember_addr2(request.getParameter("member_addr2"));
		memberModel.setMember_mobile(request.getParameter("member_mobile"));
		memberModel.setMember_phone(request.getParameter("member_phone"));
		memberModel.setMember_email(request.getParameter("member_email"));
		memberModel.setMember_email_get(request.getParameter("member_email_get"));
		
		int member = mypageService.memberModify(memberModel);
		
		if(member > 0) {
			object.put("returnVal", "1");	
		}else {
			object.put("returnVal", "0");
		}
		return object;
	}
	
	//주문/배송 조회
	@RequestMapping(value = "/order/orderListCheckView.do")
	public ModelAndView orderListCheck(OrderModel order, HttpServletRequest request, HttpSession session) throws Exception {
		
		mv = new ModelAndView();
		List<OrderModel> orderModel = new ArrayList<OrderModel>();
		
		String session_id = (String) session.getAttribute("member_id");
		
		MemberModel memberInfo = memberService.SelectOne(session_id);
		
		List<OrderModel> tradeNumList = mypageService.getOrderTradeNumList(session_id);
		for(int i=0; i<tradeNumList.size(); i++) {
			OrderModel model = tradeNumList.get(i);
			String orderTradeNum = model.getOrder_trade_num();
			
			OrderModel getOrderInfo = mypageService.getOrderInfo(orderTradeNum);
			
			orderModel.add(getOrderInfo);
		}
		
		if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		totalCount = orderModel.size();
		
		paging = new Paging(currentPage, totalCount, blockCount, blockPage, "orderListCheckView");
		pagingHtml = paging.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(paging.getEndCount() < totalCount) {
			lastCount = paging.getEndCount() + 1;
		}
		orderModel = orderModel.subList(paging.getStartCount(), lastCount);
		
		mv.addObject("memberInfo", memberInfo);
		mv.addObject("orderModel", orderModel);
		mv.addObject("currentPage", currentPage);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("totalCount", totalCount);
		mv.addObject("listCount", orderModel.size());
		mv.setViewName("orderListCheck1");
		return mv;
	}
	
	//5. 주문상세내역 보기
	@RequestMapping(value = "/order/memberOrderDetailView.do")
	public ModelAndView memberOrderDetail(String order_trade_num, HttpServletRequest request, HttpSession session) throws Exception {
		
		mv = new ModelAndView();
		
		String session_id = (String) session.getAttribute("member_id");
		
		MemberModel memberInfo = memberService.SelectOne(session_id);
		
		Map<String, Object> memberOrderDetail = mypageService.memberOrderDetail(order_trade_num);
		
		mv.addObject("memberOrderDetail", memberOrderDetail);
		mv.addObject("memberInfo", memberInfo);
		mv.setViewName("orderDetail");
		return mv;
	}
	
	//6. 주문내역 취소
	@RequestMapping(value = "/order/memberOrderCancel.do")
	@ResponseBody
	public String memberOrderCancel(OrderModel orderModel, HttpServletRequest request, HttpSession session, String order_trade_num) {
		
		String returnVal = "";

		int result = mypageService.memberOrderCancel(order_trade_num);
		
		if(result > 0) {
			returnVal = "1";
		}else {
			returnVal = "0";
		}
		
		return returnVal;
		
	}

}