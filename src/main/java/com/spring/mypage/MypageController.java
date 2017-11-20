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
	@RequestMapping(value = "/member/memberPwFind.do", method = RequestMethod.GET)
	public ModelAndView memberPwFind() {
		mv = new ModelAndView();
		
		mv.setViewName("findPw");
		return mv;
	}
	
	@RequestMapping(value = "/member/memberPwFind.do", method = RequestMethod.POST)
	public ModelAndView memberPwFind(HttpServletRequest request, HttpSession session) throws Exception {
		
		session_id = "test3";
		mv = new ModelAndView();
		MemberModel memberModel = new MemberModel();
		
		memberModel.setMember_id(session_id);
		
		/*String id = request.getParameter("member_id");
		String email = request.getParameter("member_email");
		
		System.out.println(id + email);*/
		
		memberModel.setMember_id(request.getParameter("member_id"));
		memberModel.setMember_email(request.getParameter("member_email"));
		
		/*memberModel.setMember_id(memberModel.getMember_id());
		memberModel.setMember_email(memberModel.getMember_email());*/
		
		if(memberModel.getMember_id().equals(session_id)) {
			mypageService.memberPwFind(memberModel);
			mv.setViewName("findPw");
		} else {
			mv.setViewName("findPw");
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
