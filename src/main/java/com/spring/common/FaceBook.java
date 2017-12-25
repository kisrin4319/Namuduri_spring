package com.spring.common;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class FaceBook {

	private static String App_ID = "1989435997997041";
	private static String Redirect_URL = "http://localhost:8080/namuduri/member/facebookCallback.do";
	private static String Client_secret = "fb2e6731f5db92ca0d21c55d8c896062";
	public static String loginPage() {
		return "https://www.facebook.com/dialog/oauth?client_id="+App_ID
				+"&redirect_uri="+Redirect_URL
				+"&scope=user_about_me,email";
	}
	
	public static String getAcessToken(String code) {
		return getHtml("https://graph.facebook.com/v2.3/oauth/access_token?client_id="+App_ID
				+ "&redirect_uri="+Redirect_URL
				+ "&client_secret="+Client_secret
				+ "&code="+code,"GET",null);
	}

	private static String getHtml(String url, String method, String authorization) {
		HttpURLConnection httpRequest = null;
		String resultValue = null;
		try {
			URL u = new URL(url);
			httpRequest = (HttpURLConnection) u.openConnection();
			httpRequest.setRequestMethod(method);
			if(authorization!=null) {
				httpRequest.setRequestProperty("Authorization", authorization);
			}
			httpRequest.connect();
			BufferedReader in = new BufferedReader(new InputStreamReader(httpRequest.getInputStream(), "UTF-8"));
			
			StringBuffer sb = new StringBuffer();
			String line = null;
			while((line = in.readLine())!=null) {
				sb.append(line);
				sb.append("\n");
			}
			resultValue = sb.toString().trim();
		} catch (IOException e) {
		} finally {
			if(httpRequest!=null) {
				httpRequest.disconnect();
			}
		}
		return resultValue;
	}
	
	public static String accessTokenParsing(String access_token) {
		JSONParser jsonParser = new JSONParser();
		try {
			JSONObject jsonObject = (JSONObject) jsonParser.parse(access_token);
			return (String) jsonObject.get("access_token");
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
	//유저 정보 가져오기
	public static String getUser(String token) {
		return getHtml("https://graph.facebook.com/v2.7/me?fields=id"
				+ "%2Cname%2Cemail%2Cgender"
				+ "&access_token="+token, "GET", null);
	}
	
	//UserData Parsing
	public static JSONObject UserDataParsing(String UserData) {
		JSONParser jsonParser = new JSONParser();
		try {
			JSONObject jsonObject = (JSONObject) jsonParser.parse(UserData);
			return jsonObject;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
}
