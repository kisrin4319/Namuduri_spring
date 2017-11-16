package com.spring.member;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private MemberService memberService;
	
	ModelAndView mv;
	String session_id;
	
	//로그인 폼
	@RequestMapping(value="/member/loginForm.do", method=RequestMethod.GET)
	public String loginForm() {
		return "loginForm";
	}
	
	//로그인 처리
	@RequestMapping(value="/member/loginForm.do", method=RequestMethod.POST)
	public ModelAndView loginCheck(HttpServletRequest request, MemberModel membermodel) {
		
		mv = new ModelAndView();
		MemberModel memberModel = new MemberModel();
		
		MemberModel result = memberService.loginCheck(memberModel);
		
		//로그인 성공
		if (result != null){
			
			HttpSession session = request.getSession();
			
			session.setAttribute("memberModel", result);
			session.setAttribute("session_member_id", result.getMember_id());
			session.setAttribute("session_member_pw", result.getMember_pw());
			
			mv.setViewName("main");
		} else {
			//로그인 실패
			mv.setViewName("member/loginForm");
			return mv;
			
		}
		
		return mv;
	}
	
	//로그아웃
	@RequestMapping("/member/logOut.do")
	public ModelAndView logOut(HttpServletRequest request, MemberModel memberModel) {
		
		HttpSession session = request.getSession(false);
		
		if(session != null) {
			session.invalidate();
		}
		mv.setViewName("member/loginForm");
		return mv;
	}
	
	//우편번호 검색 폼
	@RequestMapping(value="/member/zipCheckForm.do", method=RequestMethod.GET)
	public ModelAndView zipCheckForm(HttpServletRequest request) throws Exception {
		
		mv = new ModelAndView();
		
		mv.setViewName("member/zipCheck");
		return mv;
	}
	
	//우편번호 검색
	@RequestMapping(value="/member/zipCheck.do", method=RequestMethod.POST)
	public ModelAndView zipCheck(HttpServletRequest request) {
		
		mv = new ModelAndView();
		String zip;
		List<ZipcodeModel> zipcodeList = new ArrayList<ZipcodeModel>();
		zip = request.getParameter("zip");
		
		if(zip != null) {
			zipcodeList = memberService.zipCheck(zip);
			mv.addObject("zip", zip);
			mv.addObject("zipcodeList", zipcodeList);
		}
		
		mv.setViewName("member/zipCheck");
		return mv;
	}
	
	//회원가입 폼
	@RequestMapping(value="/member/memberInfo.do", method=RequestMethod.GET)
	public ModelAndView memberJoin() {
		
		mv = new ModelAndView();
		
		mv.setViewName("member/memberInfo");
		return mv;
	}
	
	@RequestMapping(value="/member/memberInfo.do", method=RequestMethod.POST)
	public ModelAndView memberJoin2(@ModelAttribute("member") MemberModel memberModel, BindingResult result) {
		
		// validation binding
		new MemberValidator().validate(memberModel, result);
		
		//회원가입 에러시 회원가입폼으로 이동
		if(result.hasErrors()) {
			
			mv = new ModelAndView();
			
			mv.setViewName("member/memberInfo");
			return mv;
		} else { 
			memberService.insertMember(memberModel);
			
			mv.addObject("memberModel", memberModel);
			mv.setViewName("member/loginForm");
			return mv;	
		}
		
	}
	
}