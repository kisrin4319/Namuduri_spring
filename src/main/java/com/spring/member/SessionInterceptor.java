package com.spring.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SessionInterceptor extends HandlerInterceptorAdapter{

	//controller가 수행되기전 동작
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		
		Object member_id = request.getSession().getAttribute("member_id");
		//int member_admin = (Integer)request.getSession().getAttribute("member_admin");
		
		/*try {
			if(request.getSession().getAttribute("member_id") == null) {
				response.sendRedirect("/");
			return false;
			}
		} catch(Exception ex){
			ex.printStackTrace();
		}*/
		
		/*if(request.getRequestURI().equals("/namuduri/member/loginForm.do") || request.getRequestURI().equals("/namuduri/member/memberInfo.do")) {
			if(member_id != null) { //아이디가 있을 떄
				if(member_admin == 0) { //일반회원이면
					//관리자 권한이 필요한 페이지인가?
					
					
				} else {
					//관리자 권한이 필요한 페이지가 아니면
				}
				response.sendRedirect(request.getContextPath() + "/main.do");
				return true;
			} else {
				return true;
			}
			
			if(request.getSession().getAttribute("member_id") != null && (Integer)request.getSession().getAttribute("member_admin") == 0) {
							//아아디가 존재하고, 일반회원이면
				adminChk = false;
				String str = "";
				str.indexOf("admin")
				
				//관리자 페이지
			} else {
				
				response.sendRedirect(request.getContextPath() + "/namuduri/main.do");
				adminChk = true;
			}

		}*/
		
		
		if(member_id != null) { //아이디가 있을 때
			if((request.getRequestURI().indexOf("admin")>0) && !member_id.equals("admin")) {
				
				response.sendRedirect(request.getContextPath() + "/main.do");
				
			} else {
				return true;
			}
			
		} else { //아이디가 없을 떄 
			if(request.getRequestURI().indexOf("basket")>0 || request.getRequestURI().indexOf("order")>0 || request.getRequestURI().indexOf("mypage")>0) {
				
				response.sendRedirect(request.getContextPath() + "/member/loginForm.do");
				
			} else {
				return true;
			}
		}
		return false;
		
		/*
		if(member_id == null) { //아이디가 없을 떄
			
			response.sendRedirect(request.getContextPath() + "/member/loginForm.do");
			return false;
		} */
			
	}
	
	//controller가 수행된 후에 동작
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception{
		
	}
}
