package com.spring.member;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.social.connect.Connection;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.impl.GoogleTemplate;
import org.springframework.social.google.api.plus.Person;
import org.springframework.social.google.api.plus.PlusOperations;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.common.FaceBook;
import com.spring.common.kakao;

@Controller
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

	@RequestMapping(value = "/member/googleSignIn.do")
	public ModelAndView doGoogleSignInActionPage(HttpServletResponse response) {
		mv = new ModelAndView();
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
		mv.addObject("url", url);
		mv.setViewName("login/googleLogin");
		return mv;
	}

	@RequestMapping("/member/oauth2callback.do")
	public ModelAndView doSessionAssignActionPage(HttpServletRequest request) {
		mv = new ModelAndView();
		System.out.println("/member/googleSignInCallback");
		String code = request.getParameter("code");

		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, googleOAuth2Parameters.getRedirectUri(),
				null);
		String accessToken = accessGrant.getAccessToken();
		Long expireTime = accessGrant.getExpireTime();
		if (expireTime != null && expireTime < System.currentTimeMillis()) {
			accessToken = accessGrant.getRefreshToken();
		}
		Connection<Google> connection = googleConnectionFactory.createConnection(accessGrant);
		Google google = connection == null ? new GoogleTemplate(accessToken) : connection.getApi();
		PlusOperations plusOperations = google.plusOperations();
		Person person = plusOperations.getGoogleProfile();

		MemberModel memberModel = new MemberModel();

		memberModel.setMember_id(person.getDisplayName());
		memberModel.setMember_name(person.getDisplayName());

		HttpSession session = request.getSession();
		session.setAttribute("member_id", memberModel.getMember_id());

		mv.setViewName("redirect:/main.do");
		return mv;

	}

	@RequestMapping(value = "/member/facebook.do", method = RequestMethod.GET)
	public String facebookStart() {

		return "redirect:" + FaceBook.loginPage();
	}

	@RequestMapping(value = "/member/facebookCallback.do", method = RequestMethod.GET)
	public ModelAndView facebookResult(@RequestParam("code") String code, HttpServletRequest request) {
		mv = new ModelAndView();
		System.out.println("code :" + code);

		// access_token 받기
		/*
		 * String parsingAccess_token =
		 * FaceBook.accessTokenParsing((String)FaceBook.getAcessToken(code));
		 * System.out.println("parsingAccess_token :"+ parsingAccess_token);
		 */

		String UserData = (String) FaceBook.getUser(FaceBook.accessTokenParsing((String) FaceBook.getAcessToken(code)));
		System.out.println("UserData :" + UserData);

		JSONObject jsonObject = FaceBook.UserDataParsing(UserData);
		System.out.println("jsonObject : " + jsonObject);
		System.out.println("id :" + jsonObject.get("id"));
		System.out.println("gender :" + jsonObject.get("gender"));
		System.out.println("name :" + jsonObject.get("name"));
		System.out.println("email : " + jsonObject.get("email"));

		MemberModel memberModel = new MemberModel();

		memberModel.setMember_id((String)jsonObject.get("email"));
		memberModel.setMember_name((String)jsonObject.get("name"));
		memberModel.setMember_email((String)jsonObject.get("email"));
		
		HttpSession session = request.getSession();
		session.setAttribute("member_id", memberModel.getMember_id());

		mv.setViewName("redirect:/main.do");
		
		return mv;
	}

	
	@RequestMapping(value="/member/kakao.do",method=RequestMethod.GET)
	public String kakao() {
		kakao kakao = new kakao();
		System.out.println("kakao.getCode() :"+kakao.getCode() );
		return "redirect:"+kakao.getCode();
	}
	@RequestMapping(value="/member/kakaoCallback.do",method=RequestMethod.GET)
	public ModelAndView kakaoLogin(@RequestParam("code") String code,HttpServletRequest request) {
		mv = new ModelAndView();
		System.out.println("code :" + code);
		
		String data = (String)kakao.getHtml((kakao.getAccesToken(code)));
		
		System.out.println("data :"+ data);
		
		Map<String, String> map = kakao.JsonStringMap(data);
		System.out.println("map :" +map);
		System.out.println("access_token :" +map.get("access_token"));
		System.out.println("refresh_token :" +map.get("refresh_token"));
		System.out.println("scope :" +map.get("scope"));
		System.out.println("token_type :" +map.get("token_type"));
		System.out.println("expires_in :" +map.get("expires_in"));
		
		//사용자 전체 정보 받아오기를 시작하겠습니다.
		String list = kakao.getAllList(map.get("access_token"));
		System.out.println("list : "+list);
		
		Map<String, String> getAllListMap  = kakao.JsonStringMap(list);
		System.out.println("getAllListMap :"+getAllListMap);
		System.out.println("nickName : "+getAllListMap.get("nickName"));

		MemberModel memberModel = new MemberModel();

		memberModel.setMember_id(getAllListMap.get("nickName"));
		memberModel.setMember_name(getAllListMap.get("nickName"));
		
		HttpSession session = request.getSession();
		session.setAttribute("member_id", memberModel.getMember_id());
		
		mv.setViewName("redirect:/main.do");
		
		return mv;
	}
	
	/*@RequestMapping(value="/Facebook.do", method=RequestMethod.GET)
	public String facebookStart() {
		
		return "redirect:"+FaceBook.loginPage();
	}
	
	@RequestMapping(value="/Namuduri2.do", method=RequestMethod.GET)
	public String facebookResult(@RequestParam("code") String code) {
		
		mv = new ModelAndView();
		
		System.out.println("code : " +code);
		
		//access_token 받기
		String access_token = (String)FaceBook.getAcessToken(code);
		//System.out.println("access_token : "+access_token);
		
		String parsingAccess_token = FaceBook.accessTokenParsing(access_token);
		//System.out.println("parsingAccess_token :" +parsingAccess_token);
		
		String UserData = (String)FaceBook.getUser(parsingAccess_token);
		//System.out.println("UserData :" +UserData);
		
		JSONObject jsonObject = FaceBook.UserDataParsing(UserData);
		//System.out.println("jsonObject: "+jsonObject);
		//System.out.println("id :"+(String)jsonObject.get("id"));
		
		JSONObject jsonObject2 = FaceBook.UserDataParsing((String)jsonObject.get("picture").toString());
		//System.out.println("jsonObject2 :" +jsonObject2);
		Map<String, String> map = FaceBook.JsonStringMap(jsonObject2.get("data").toString());
		//System.out.println("is_silhouette :" +(String)map.get("is_silhouette"));
		//System.out.println("url:"+(String)map.get("url"));
		
		MemberModel memberModel = new MemberModel();
		
		memberModel.getMember_id(UserData.get);
		
		return "main.do";
	}*/

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

	// 회원가입 폼
	@RequestMapping(value = "/member/memberInfo.do", method = RequestMethod.GET)
	public ModelAndView memberJoin() {

		mv = new ModelAndView();

		mv.setViewName("memberInfo");
		return mv;
	}

	// 회원가입
	@RequestMapping(value = "/member/memberInfo.do", method = RequestMethod.POST)
	public ModelAndView memberJoin2(@ModelAttribute("member") MemberModel memberModel, BindingResult result,
			HttpServletRequest request) {

		// validation binding
		new MemberValidator().validate(memberModel, result);

		// 회원가입 에러시 회원가입폼으로 이동
		if (result.hasErrors()) {
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
			memberModel.setMember_email(request.getParameter("member_email")+"@"+request.getParameter("member_email1"));
			memberService.insertMember(memberModel);

			mv.addObject("memberModel", memberModel);
			mv.setViewName("loginForm");
			return mv;
		}
	}

	// 아이디 중복확인
	@RequestMapping(value = "/member/idCheck.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody int idCheck(HttpServletRequest request) {
		int count = memberService.idCheck(request.getParameter("member_id"));
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