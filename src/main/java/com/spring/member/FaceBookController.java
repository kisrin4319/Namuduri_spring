package com.spring.member;

import java.util.Map;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.springframework.social.connect.ConnectionRepository;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FaceBookController {

	private Facebook facebook;
	private ConnectionRepository connectionRepository;
	
	@RequestMapping(value="/Facebook.do", method=RequestMethod.GET)
	public String facebookStart() {
		
		return "redirect:"+FaceBook.loginPage();
	}
	
	@RequestMapping(value="/Namuduri2.do", method=RequestMethod.GET)
	public String facebookResult(@RequestParam("code") String code) {
		
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
		
		return "main.do";
	}
	
	/*//갱그리
	@Inject
	public FaceBookController(Facebook facebook, ConnectionRepository connectionRepository) {
		this.facebook = facebook;
		this.connectionRepository = connectionRepository;
	}
	
	@RequestMapping(value="/")
	public String home(MemberModel memberModel) {
		if(connectionRepository.findPrimaryConnection(FaceBook.class) != null) {
			memberModel.addAttribute("facebookProfile", facebook.userOperations().getUserProfile());
		}
		
		return "index";
	}
	
	@RequestMapping(value="/login")
	public String Login(MemberModel memberModel) {
		return "login";
	}*/
}
