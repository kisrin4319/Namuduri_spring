package com.spring.mypage;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.member.MemberModel;

@Controller
public class MypageController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private MypageService mypageService;
	
	ModelAndView mv;
	String session_id;
	
	//1. 아이디 찾기
	@RequestMapping(value = "/memberfind/findId.do", method = RequestMethod.GET)
	public ModelAndView memberfindIdForm() {
		mv.setViewName("member/findIdForm");
		return mv;
	}
	
	@RequestMapping(value = "/memberfind/findId.do", method = RequestMethod.POST)
	public ModelAndView findId(HttpServletRequest request, HttpSession session) throws Exception {
		mv = new ModelAndView();
		MemberModel memberModel = new MemberModel();
		
		memberModel.setMember_id(session_id);
		
		memberModel.setMember_name(memberModel.getMember_name());
		memberModel.setMember_jumin1(memberModel.getMember_jumin1());
		memberModel.setMember_jumin2(memberModel.getMember_jumin2());
		
		if(memberModel.getMember_name().equals(session_id)) {
			mypageService.findId(memberModel);
			mv.setViewName("memberfind/findIdSucces");
		
		} else {
			mv.setViewName("memberfind/findIdError");
		}
		return mv;
	}
	
	//비밀번호 찾기
	@RequestMapping("/memberfind/findPwForm.do")
	public ModelAndView findPw(HttpServletRequest request, HttpSession session) throws Exception {
		mv = new ModelAndView();
		MemberModel memberModel = new MemberModel();
		
		memberModel.setMember_id(session_id);
		
		memberModel.setMember_id(memberModel.getMember_id());
		memberModel.setMember_email(memberModel.getMember_email());
		
		if(memberModel.getMember_id().equals(session_id)) {
			mypageService.findPw(memberModel);
			
		} else {
			mv.setViewName("redirect:/findPwForm.do");
		}
		return mv;
	}
	
	/*//3. 회원 탈퇴
	@RequestMapping("/mypage/memberOut.do")
	public ModelAndView memberOut(HttpServletRequest request, HttpSession session) throws Exception {
		
	}
	
	//4. 회원정보 수정
	@RequestMapping("/mypage/memberModify.do")
	public ModelAndView memberModify(HttpServletRequest request, HttpSession session) throws Exception {
		
	}
	
	//5. 주문상세내역 보기
	@RequestMapping("/mypage/memberOrderDetail.do")
	public ModelAndView memberOrderDetail(HttpServletRequest request, HttpSession session) throws Exception {
		
	}*/
	
}
