package com.spring.member;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private MemberService memberService;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	ModelAndView mv;
	String session_id;
	String member_id;
	
	//로그인 폼
	@RequestMapping(value="/member/loginForm.do", method=RequestMethod.GET)
	public String loginForm() {
		return "loginForm";
	}
	
	//로그인 처리
	@RequestMapping(value="/member/loginForm.do", method=RequestMethod.POST)
	public ModelAndView loginCheck(@RequestParam String member_id, @RequestParam String member_pw, HttpServletRequest request) {
		
		mv = new ModelAndView();
		MemberModel memberModel = new MemberModel();
		
		memberModel = memberService.SelectOne(member_id);
		passwordEncoder = new BCryptPasswordEncoder();
		
		System.out.println("=============================================================");
		
		String password =memberModel.getMember_pw();
		String encryptPassword = passwordEncoder.encode(password);
		System.out.println(encryptPassword);
		
		if(passwordEncoder.matches(password, encryptPassword)){
			System.out.println("계정정보 일치");
			}else{
			System.out.println("계정정보 불일치");
			}
		
		System.out.println("=============================================================");
		//로그인 성공
		if (passwordEncoder.matches(member_pw, memberModel.getMember_pw())){
			
			HttpSession session = request.getSession();
			session.setAttribute("member_id", member_id);
			
			mv.setViewName("redirect:/main.do");
			return mv;
		} else {
			//로그인 실패
			mv.setViewName("member/loginError");
			return mv;
			
		}
		
	}
	
	//로그아웃
	@RequestMapping("/member/logOut.do")
	public ModelAndView logOut(HttpSession session) {
		
		MemberModel memberModel = new MemberModel();
		
		session_id = (String)session.getAttribute("member_id");
		memberModel.setMember_id(session_id);
		
		if(session != null) {
			session.invalidate();
		}
		
		mv.setViewName("redirect:/main.do");
		return mv;
	}
	
	// MemberModel초기화
	@ModelAttribute("member")
	public MemberModel formBack() {
		return new MemberModel();
		
	}
	//회원가입 폼
	@RequestMapping(value="/member/memberInfo.do", method=RequestMethod.GET)
	public ModelAndView memberJoin() {
		
		mv = new ModelAndView();
		
		mv.setViewName("memberInfo");
		return mv;
	}
	//회원가입
	@RequestMapping(value="/member/memberInfo.do", method=RequestMethod.POST)
	public ModelAndView memberJoin2(@ModelAttribute("member") MemberModel memberModel, BindingResult result) {
		
		// validation binding
		new MemberValidator().validate(memberModel, result);
		
		//회원가입 에러시 회원가입폼으로 이동
		if(result.hasErrors()) {
			
			mv = new ModelAndView();
			
			mv.setViewName("memberInfo");
			return mv;
		} else {
			passwordEncoder = new BCryptPasswordEncoder();
			
			System.out.println("=============================================================");
			
			String password = memberModel.getMember_pw();
			String encryptPassword = passwordEncoder.encode(password);
			System.out.println(encryptPassword);
			
			memberModel.setMember_pw(encryptPassword);
			
			memberService.insertMember(memberModel);
			
			mv.addObject("memberModel", memberModel);
			mv.setViewName("loginForm");
			return mv;	
		}
		
	}
	//아이디 중복확인
	@RequestMapping("/member/idCheck.do")
	public ModelAndView idCheck(HttpServletRequest request) {
		
		mv= new ModelAndView();
		
		String member_id = request.getParameter("member_id");
		int count = memberService.idCheck(member_id);
		
		mv.addObject("count", count);
		mv.addObject("member_id", member_id);
		mv.setViewName("member/idCheck");
		
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
	@RequestMapping(value="/member/zipCheckForm.do", method=RequestMethod.POST)
	public ModelAndView zipCheck(@ModelAttribute ZipcodeModel zipcodeModel, HttpServletRequest request) throws Exception{
			
		mv = new ModelAndView();
			
		String area3;
			
		List<ZipcodeModel> zipcodeList = new ArrayList<ZipcodeModel>();
		area3 = request.getParameter("area3");
			
		mv.addObject("zipcodeList", zipcodeList);
			
		if(area3 != null) {
			zipcodeList = memberService.zipCheck(area3);
			mv.addObject("area3", area3);
			mv.addObject("zipcodeList", zipcodeList);
		}
			
		mv.setViewName("member/zipCheck");
		return mv;
	}
	
}