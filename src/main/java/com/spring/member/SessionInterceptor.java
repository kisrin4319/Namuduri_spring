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
		
		if(member_id != null) { //아이디가 있을 때
			if((request.getRequestURI().indexOf("admin")>0) && !member_id.equals("admin")) {
				
				response.sendRedirect(request.getContextPath() + "/main.do");
				
			} else {
				return true;
			}
			
		} else { //아이디가 없을 떄 
			if(request.getRequestURI().indexOf("basket")>0 || request.getRequestURI().indexOf("order")>0 || request.getRequestURI().indexOf("mypage")>0 || request.getRequestURI().indexOf("wish")>0 || request.getRequestURI().indexOf("review")>0 || request.getRequestURI().toLowerCase().indexOf("modify") >0 || request.getRequestURI().toLowerCase().indexOf("delete") >0
					|| request.getRequestURI().toLowerCase().indexOf("write") >0 || request.getRequestURI().toLowerCase().indexOf("reply") >0 || request.getRequestURI().toLowerCase().indexOf("admin") >0) {
				
				response.sendRedirect(request.getContextPath() + "/member/loginForm.do");
				
			} else {
				return true;
			}
		}
		return false;
	}
	
	//controller가 수행된 후에 동작
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception{
		
	}
}
