package com.spring.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.Data;

@Controller
@Data
public class MemberController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource
	private MemberService memberService;

	@Resource
	private GoogleConnectionFactory googleConnectionFactory;

	@Resource
	private OAuth2Parameters googleOAuth2Parameters;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	ModelAndView mv;
	String session_id;
	String member_id;

	// 로그인 폼
	@RequestMapping(value = "/member/loginForm.do", method = RequestMethod.GET)
	public String loginForm() {
		return "loginForm";
	}

	// 로그인 처리
	@RequestMapping(value = "/member/loginForm.do", method = RequestMethod.POST)
	public ModelAndView loginCheck(@RequestParam String member_id, @RequestParam String member_pw,
			HttpServletRequest request) {

		mv = new ModelAndView();
		MemberModel memberModel = new MemberModel();

		memberModel = memberService.SelectOne(member_id);
		passwordEncoder = new BCryptPasswordEncoder();

		System.out.println("=============================================================");

		String password = memberModel.getMember_pw();
		String encryptPassword = passwordEncoder.encode(password);
		System.out.println(encryptPassword);

		if (passwordEncoder.matches(password, encryptPassword)) {
			System.out.println("계정정보 일치");
		} else {
			System.out.println("계정정보 불일치");
		}

		System.out.println("=============================================================");
		// 로그인 성공
		if (passwordEncoder.matches(member_pw, memberModel.getMember_pw())) {

			HttpSession session = request.getSession();
			session.setAttribute("member_id", member_id);

			mv.setViewName("redirect:/main.do");
			return mv;
		} else {
			// 로그인 실패
			mv.setViewName("member/loginError");
			return mv;

		}

	}

	@RequestMapping(value = "/member/googleSignIn")
	public void doGoogleSignInActionPage(HttpServletResponse response) {
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);

		PrintWriter out;
		try {
			out = response.getWriter();
			out.write(url);
			out.flush();
			out.close();
		} catch (IOException e) {
			throw new RuntimeException(e.getMessage(), e);
		}
	}

	/*@RequestMapping("/member/googleSignInCallback")
	public String doSessionAssignActionPage(HttpServletRequest request) {
		System.out.println("/member/googleSignInCallback");
		String code = request.getParameter("code");

		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, googleOAuth2Parameters.getRedirectUri(),
				null);

		String accessToken = accessGrant.getAccessToken();
		Long expireTime = accessGrant.getExpireTime();
		if (expireTime != null && expireTime < System.currentTimeMillis()) {
			accessToken = accessGrant.getRefreshToken();
			System.out.printf("accessToken is expired. refresh token = {}", accessToken);
		}

		PlusOperations plusOperations = google.plusOperations();
		Person person = plusOperations.getGoogleProfile();

		MemberModel member = new MemberModel();
		member.setMember_id(person.getDisplayName());
		member.setMember_name(person.getDisplayName());

		HttpSession session = request.getSession();
		session.setAttribute("_MEMBER_", member);

		System.out.println(person.getDisplayName());

		return "redirect:/";*/
		/*
		 * System.out.println(person.getAccountEmail());
		 * System.out.println(person.getAboutMe());
		 * System.out.println(person.getDisplayName());
		 * System.out.println(person.getEtag());
		 * System.out.println(person.getFamilyName());
		 * System.out.println(person.getGender());
		 */

	/*}*/

	// 로그아웃
	@RequestMapping("/member/logOut.do")
	public ModelAndView logOut(HttpSession session) {

		MemberModel memberModel = new MemberModel();

		session_id = (String) session.getAttribute("member_id");
		memberModel.setMember_id(session_id);

		if (session != null) {
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
	public ModelAndView memberJoin2(@ModelAttribute("member") MemberModel memberModel, BindingResult result, HttpServletRequest request) {
		
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
		
		/*//아이디 중복체크
        boolean isDuplicateUserID = this.memberService.checkDuplicateUserID(memberInfoVO.getUsrId());
        
        if(isDuplicateUserID){
            mv.setViewName("member/memberInfo");
            mv.addObject("duplicateUserId","이미사용중인 아이디입니다.");
            return mv;
        }
        mv.setViewName("redirect:/member/loginForm");
        this.memberService.joinMember();
    }
    return mv;*/

		
	}

	// 아이디 중복확인
	@RequestMapping(value="/member/idCheck.do",method = { RequestMethod.GET, RequestMethod.POST})	
	public @ResponseBody int idCheck(MemberModel memberModel, Model model,HttpServletRequest request) {
		mv = new ModelAndView();
		memberModel.setMember_id(request.getParameter("member_id"));
		int count = memberService.idCheck(memberModel);
		return count;
	}

	// 우편번호 검색 폼
	@RequestMapping(value = "/member/zipCheckForm.do", method = RequestMethod.GET)
	public ModelAndView zipCheckForm(HttpServletRequest request) throws Exception {

		mv = new ModelAndView();

		mv.setViewName("member/zipCheck");
		return mv;
	}

	// 우편번호 검색
	@RequestMapping(value = "/member/zipCheckForm.do", method = RequestMethod.POST)
	public ModelAndView zipCheck(@ModelAttribute ZipcodeModel zipcodeModel, HttpServletRequest request)
			throws Exception {

		mv = new ModelAndView();

		String area3;

		List<ZipcodeModel> zipcodeList = new ArrayList<ZipcodeModel>();
		area3 = request.getParameter("area3");

		mv.addObject("zipcodeList", zipcodeList);

		if (area3 != null) {
			zipcodeList = memberService.zipCheck(area3);
			mv.addObject("area3", area3);
			mv.addObject("zipcodeList", zipcodeList);
		}

		mv.setViewName("member/zipCheck");
		return mv;
	}
}