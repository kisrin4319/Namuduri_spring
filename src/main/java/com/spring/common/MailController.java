package com.spring.common;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MailController {

	Logger log = Logger.getLogger(this.getClass());

	ModelAndView mv = new ModelAndView();

	@RequestMapping("/common/contact.do")
	public ModelAndView Contact(HttpServletRequest request) {

		mv.setViewName("contact");
		return mv;
	}

	// mailSending 코드
	@RequestMapping(value = "/mail/mailSending")
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

}