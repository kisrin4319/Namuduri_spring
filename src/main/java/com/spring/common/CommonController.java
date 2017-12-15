package com.spring.common;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CommonController {

	Logger log = Logger.getLogger(this.getClass());

	ModelAndView mv = new ModelAndView();

	@RequestMapping("/common/contact.do")
	public ModelAndView Contact(HttpServletRequest request) {

		mv.setViewName("contact");
		return mv;
	}

	// mailSending 코드
	@RequestMapping("/common/mailSending.do")
	public ModelAndView mailSending(HttpServletRequest request) {

		try {
			SimpleEmail email = new SimpleEmail();

			email.setCharset("UTF-8");
			email.setHostName("smtp.gmail.com"); // SMTP서버 설정
			email.setSmtpPort(587);
			email.setSSL(true);
			email.setAuthentication("kisrin4319", "aaudlfdnutzkthsi");

			email.addTo("wnsgh8879@naver.com", "wnsgh8879"); // 수신자를 추가
			email.setFrom(request.getParameter("tomail"), request.getParameter("tomail")); // 보내는 사람 지정
			email.setSubject(request.getParameter("name") + "님이 보낸 메일입니다."); // 메일 제목
			email.setContent(request.getParameter("message"), "text/plain; charset=euc-kr");
			email.send(); // 메일 발송
			
		} catch (EmailException e) {
			e.printStackTrace();
		}

		mv.setViewName("redirect:/main.do");

		return mv;
	}
	@RequestMapping("/common/subScribe.do")
	public ModelAndView Subscribe(HttpServletRequest request) {
		try {
			SimpleEmail email = new SimpleEmail();

			email.setCharset("UTF-8");
			email.setHostName("smtp.gmail.com"); // SMTP서버 설정
			email.setSmtpPort(587);
			email.setSSL(true);
			email.setAuthentication("kisrin4319", "aaudlfdnutzkthsi");

			email.addTo(request.getParameter("subscribe"), request.getParameter("subscribe")); // 수신자를 추가
			email.setFrom("khiclass@gmail.com", "khiclass@gmail.com"); // 보내는 사람 지정
			email.setSubject("khiclass@gmail.com님이 보낸 메일입니다."); // 메일 제목
			email.setContent("저희 홈페이지를 구독 해주셔서 감사합니다!", "text/plain; charset=euc-kr");
			email.send(); // 메일 발송
			
		} catch (EmailException e) {
			e.printStackTrace();
		}

		mv.setViewName("redirect:/main.do");

		return mv;
	}
	//지도 열기 코드
	
	@RequestMapping("/common/openMap.do")
	public ModelAndView openMap() {
		mv.setViewName("/common/map");		
		return mv;
	}

}