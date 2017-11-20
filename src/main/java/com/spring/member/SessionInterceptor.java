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
		
		if(request.getRequestURI().equals("/namuduri/member/loginForm.do") || request.getRequestURI().equals("/namuduri/member/memberInfo.do")) {
			if(member_id != null) {
				response.sendRedirect(request.getContextPath() + "/main.do");
				return true;
			} else {
				return true;
			}

		}
		
		if(member_id == null && !(request.getRequestURI().equals("/namuduri/main.do"))) {
			response.sendRedirect(request.getContextPath() + "/member/loginForm.do");
			return false;
		} else {
			return true;
		}
			
	}
	
	//controller가 수행된 후에 동작
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception{
		
	}
}
