package com.spring.mypage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.admin.AdminService;
import com.spring.book.BooksModel;
import com.spring.book.BooksService;
import com.spring.common.CommonController;
import com.spring.common.Paging;
import com.spring.member.MemberModel;
import com.spring.member.MemberService;
import com.spring.order.OrderDetailModel;
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
	@Resource
	private AdminService adminService;
	
	@Resource
	private CommonController commonController;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	ModelAndView mv;
	String session_id;

	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 5;
	private int blockPage = 10;
	private String pagingHtml;
	private Paging paging;

	// mypage
	@RequestMapping(value = "/mypage.do")
	public ModelAndView mypage(OrderModel order, HttpServletRequest request, HttpSession session) throws Exception {

		mv = new ModelAndView();
		List<OrderModel> orderModel = new ArrayList<OrderModel>();

		String member_id = (String) session.getAttribute("member_id");

		List<OrderModel> tradeNumList = mypageService.getOrderTradeNumList(member_id);
		for (int i = 0; i < tradeNumList.size(); i++) {
			OrderModel model = tradeNumList.get(i);
			String orderTradeNum = model.getOrder_trade_num();

			OrderModel getOrderInfo = mypageService.getOrderInfo(orderTradeNum);

			orderModel.add(getOrderInfo);
		}

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		totalCount = orderModel.size();

		paging = new Paging(currentPage, totalCount, blockCount, blockPage, "mypage");
		pagingHtml = paging.getPagingHtml().toString();

		int lastCount = totalCount;

		if (paging.getEndCount() < totalCount) {
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

	// 1. 아이디 찾기
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
		if (member != null) {
			if (memberModel.getMember_name().equals(member.getMember_name())
					&& memberModel.getMember_jumin1() == member.getMember_jumin1()
					&& memberModel.getMember_jumin2() == member.getMember_jumin2()) {
				object.put("returnVal", "1");
				object.put("member_id", member.getMember_id());
			} else {
				object.put("returnVal", "0");
			}
		} else {
			object.put("returnVal", "0");
		}
		return object;
	}

	// 비밀번호 찾기
	@RequestMapping(value = "/member/memberPwFindView.do")
	public ModelAndView memberPwFind() {
		mv = new ModelAndView();

		mv.setViewName("findPw");
		return mv;
	}

	@RequestMapping(value = "/member/memberPwFind.do")
	@ResponseBody
	public Map<String, Object> memberPwFind(HttpServletRequest request, HttpSession session) throws Exception {

		StringBuffer buffer = new StringBuffer();
		Random random = new Random();
		String chars[] = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,0,1,2,3,4,5,6,7,8,9"
				.split(",");

		Map<String, Object> object = new HashMap<String, Object>();

		mv = new ModelAndView();
		MemberModel memberModel = new MemberModel();

		memberModel.setMember_id(request.getParameter("member_id"));
		memberModel.setMember_email(request.getParameter("member_email"));

		MemberModel member = mypageService.memberPwFind(memberModel);
		if (member != null) {
			for (int i = 0; i < 10; i++) {
				buffer.append(chars[random.nextInt(chars.length)]);
				System.out.println(buffer);
			}
			String temppw = String.valueOf(buffer);
			memberModel.setMember_pw(String.valueOf(buffer));

			// 암호화 해서 맵으로 넘김
			// buffer의 임시비밀번호를 memberModel의 pw 에 셋을 해주고 이걸 다시 불러와서 암호화를 한다
			// 암호화 한걸 member_id와 같이 map으로 넘겨서 해당 id에 password를 update해준다
			passwordEncoder = new BCryptPasswordEncoder();
			String password = passwordEncoder.encode(buffer);

			Map<String, Object> param = new HashMap<String, Object>();
			param.put("member_id", memberModel.getMember_id());
			param.put("member_pw", password);

			int result = mypageService.memberPwUpdate(param);

			try {
				SimpleEmail email = new SimpleEmail();
				memberModel.setMember_email(request.getParameter("member_email"));
				// String member_email = memberModel.getMember_email();

				email.setCharset("UTF-8");
				email.setHostName("smtp.gmail.com");
				email.setSmtpPort(587);
				email.setSSL(true);
				email.setAuthentication("kisrin4319", "aaudlfdnutzkthsi");

				email.addTo(request.getParameter("member_email"), request.getParameter("member_email"));
				email.setFrom("khiclass@gmail.com", "khiclass@gmail.com");
				email.setSubject("khiclass 님이 보낸 메일입니다.");
				email.setContent("귀하의 임시비밀번호는" + temppw + "입니다." + "로그인 후 비밀번호를 변경해 주시기 바랍니다.",
						"text/plain; charset=euc-kr");
				email.send();

			} catch (EmailException e) {
				e.printStackTrace();
			}

			if (memberModel.getMember_id().equals(member.getMember_id())
					&& memberModel.getMember_email().equals(member.getMember_email())) {
				object.put("returnVal", "1");
				object.put("member_pw", memberModel.getMember_pw());
			} else {
				object.put("returnVal", "0");
			}
		} else {
			object.put("returnVal", "0");

		}
		return object;
	}

	// 3. 회원 탈퇴
	@RequestMapping(value = "/member/memberDeleteView.do")
	public ModelAndView memberDelete() {
		mv = new ModelAndView();

		mv.setViewName("memberDelete1");
		return mv;
	}

	@RequestMapping(value = "/member/memberDelete.do")
	@ResponseBody
	public Map<String, Object> memberDelete(HttpServletRequest request, HttpSession session) throws Exception {

		passwordEncoder = new BCryptPasswordEncoder();
		Map<String, Object> object = new HashMap<String, Object>();

		mv = new ModelAndView();
		MemberModel memberModel = new MemberModel();

		String member_id = request.getParameter("member_id");
		memberModel = memberService.SelectOne(member_id);

		String password = request.getParameter("member_pw");

		if (passwordEncoder.matches(password, memberModel.getMember_pw())) {
			memberModel.setMember_id(member_id);
			memberModel.setMember_pw(memberModel.getMember_pw());
			int member = mypageService.memberDelete(memberModel);
			System.out.println(member);
			if (member > 0) {
				object.put("returnVal", "1");
			} else {
				object.put("returnVal", "0");
			}
		} else {
			object.put("returnVal", "0");
		}

		return object;
	}

	// 4. 회원정보 수정
	@RequestMapping(value = "/member/memberModifyView.do")
	public ModelAndView memberModify(MemberModel member, HttpServletRequest request, HttpSession session)
			throws Exception {

		mv = new ModelAndView();

		String member_id = (String) session.getAttribute("member_id");

		MemberModel memberInfo = mypageService.getMemberInfo(member_id);
		/**
		 * void = 반환되는 값 없음(ex. mypageService.getMemberInfo(member_id);) int = 정수형
		 * 반환(ex. int memberInfo = mypageService.getMemberInfo(member_id);) vo = vo
		 * 반환(ex. MemberModel memberInfo = mypageService.getMemberInfo(member_id);)
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
		memberModel.setMember_bankname(request.getParameter("member_bankname"));
		memberModel.setMember_refund_account(request.getParameter("member_refund_account"));
		memberModel.setMember_account_holder(request.getParameter("member_account_holder"));		
    
		System.out.println("=========================================");

		String password = memberModel.getMember_pw();
		String encryptPassword = passwordEncoder.encode(password);
		System.out.println(encryptPassword);

		memberModel.setMember_pw(encryptPassword);

		int member = mypageService.memberModify(memberModel);

		if (member > 0) {
			object.put("returnVal", "1");
		} else {
			object.put("returnVal", "0");
		}
		return object;
	}

	// 주문/배송 조회
	@RequestMapping(value = "/order/orderListCheckView.do")
	public ModelAndView orderListCheck(OrderModel order, HttpServletRequest request, HttpSession session)
			throws Exception {

		mv = new ModelAndView();
		List<OrderModel> orderModel = new ArrayList<OrderModel>();

		String session_id = (String) session.getAttribute("member_id");

		MemberModel memberInfo = memberService.SelectOne(session_id);

		List<OrderModel> tradeNumList = mypageService.getOrderTradeNumList(session_id);
		for (int i = 0; i < tradeNumList.size(); i++) {
			OrderModel model = tradeNumList.get(i);
			String orderTradeNum = model.getOrder_trade_num();

			OrderModel getOrderInfo = mypageService.getOrderInfo(orderTradeNum);

			orderModel.add(getOrderInfo);
		}

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		totalCount = orderModel.size();

		paging = new Paging(currentPage, totalCount, blockCount, blockPage, "orderListCheckView");
		pagingHtml = paging.getPagingHtml().toString();

		int lastCount = totalCount;

		if (paging.getEndCount() < totalCount) {
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

	// 5. 주문상세내역 보기
	@RequestMapping(value = "/order/memberOrderDetailView.do")
	public ModelAndView memberOrderDetail(String order_trade_num, HttpServletRequest request, HttpSession session)
			throws Exception {

		mv = new ModelAndView();

		List<Map<String, Object>> memberOrderDetail = new ArrayList<Map<String, Object>>();

		String session_id = (String) session.getAttribute("member_id");

		MemberModel memberInfo = memberService.SelectOne(session_id);

		memberOrderDetail = mypageService.memberOrderDetail(order_trade_num);
		OrderModel orderModel = new OrderModel();
		orderModel.setOrder_trade_num(order_trade_num);
		orderModel = orderService.getOrder(orderModel);

		mv.addObject("memberOrderDetail", memberOrderDetail);
		mv.addObject("orderModel", orderModel);
		mv.addObject("memberInfo", memberInfo);
		mv.setViewName("orderDetail");
		return mv;
	}

	// 6. 주문내역 취소
	@RequestMapping(value = "/order/memberOrderCancel.do")
	@ResponseBody
	public String memberOrderCancel(OrderModel orderModel, HttpServletRequest request, HttpSession session,
			String order_trade_num) {

		String returnVal = "";

		int result = mypageService.memberOrderCancel(order_trade_num);

		if (result > 0) {
			returnVal = "1";
			
			List<OrderDetailModel> orderDetailList = new ArrayList<OrderDetailModel>();
			orderDetailList = orderService.orderDetailList(order_trade_num);

			for (int i = 0; i < orderDetailList.size(); i++) {
				BooksModel booksModel = new BooksModel();
				int book_num = orderDetailList.get(i).getBook_num();
				booksModel = booksService.bookOne(book_num);

				booksModel.setBook_current_count(booksModel.getBook_current_count() + orderDetailList.get(i).getOrder_book_count());
				booksModel.setBook_sell_count(booksModel.getBook_sell_count() - orderDetailList.get(i).getOrder_book_count());
				
				adminService.modifyBook(booksModel);
				
			}
		} else {
			returnVal = "0";
		}

		return returnVal;

	}

}