package com.spring.mypage;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.member.MemberModel;

@Controller
public class MypageController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private MypageService mypageService;
	
	ModelAndView mv;
	String session_id;
	
	//mypage
	@RequestMapping(value = "/mypage.do")
	public ModelAndView mypage() {
		mv = new ModelAndView();
		
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
	public ModelAndView memberModify() {
		mv = new ModelAndView();
		
		mv.setViewName("memberModify");
		return mv;
	}
	
	@RequestMapping(value = "/member/memberModify.do")
	@ResponseBody
	public Map<String, Object> memberModify(HttpServletRequest request, HttpSession session) throws Exception {
		
		Map<String, Object> object = new HashMap<String, Object>();
		
		mv = new ModelAndView();
		MemberModel memberModel = new MemberModel();
		
		memberModel.setMember_id(session_id);
		
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
		/*if(member != null) {
			if(memberModel.getMember_pw().equals("member_pw")) {
				object.put("returnVal", "1");
			} else {
				object.put("returnVal", "0");
			}
		} else {
			object.put("returnVal", "0");
		}*/
		return object;
	}
	
	/*//5. 주문상세내역 보기
	@RequestMapping("/mypage/memberOrderDetail.do")
	public ModelAndView memberOrderDetail(HttpServletRequest request, HttpSession session) throws Exception {
		
	}*/
	
}
