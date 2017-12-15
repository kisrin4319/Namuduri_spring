package com.spring.member;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FaceBookController {

	@RequestMapping(value="/Facebook.do", method=RequestMethod.GET)
	public String facebookStart() {
		
		return "redirect:"+FaceBook.loginPage();
	}
	
	@RequestMapping(value="/Namuduri2.do", method=RequestMethod.GET)
	public String facebookResult(@RequestParam("code") String code) {
		System.out.println("code : " +code);
		
		//access_token 받기
		String access_token = (String)FaceBook.getAcessToken(code);
		System.out.println("access_token : "+access_token);
		
		String parsingAccess_token = FaceBook.accessTokenParsing(access_token);
		System.out.println("parsingAccess_token :" +parsingAccess_token);
		
		String UserData = (String)FaceBook.getUser(parsingAccess_token);
		System.out.println("UserData :" +UserData);
		
		JSONObject jsonObject = FaceBook.UserDataParsing(UserData);
		System.out.println("jsonObject: "+jsonObject);
		System.out.println("id :"+(String)jsonObject.get("id"));
		
		return null;
	}
}
