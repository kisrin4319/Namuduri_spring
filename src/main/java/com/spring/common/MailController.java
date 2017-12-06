package com.spring.common;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MailController {

	Logger log = Logger.getLogger(this.getClass());

	ModelAndView mv = new ModelAndView();

	@Autowired
	private JavaMailSender mailSender; // xml에 등록한 bean autowired

	@RequestMapping("/common/contact.do")
	public ModelAndView Contact(HttpServletRequest request) {

		mv.addObject("contact");

		return mv;
	}

	// mailSending 코드
	@RequestMapping(value = "/mail/mailSending")
	public String mailSending(HttpServletRequest request) {
		String tomail = request.getParameter("tomail"); // 받는 사람 이메일
		String name = request.getParameter("name"); // 이름
		String content = request.getParameter("message"); // 내용
		try {
			MimeMessage message = mailSender.createMimeMessage();

			message.setFrom(new InternetAddress("khiclass@gmail.com"));
			message.addRecipient(RecipientType.TO, new InternetAddress(tomail));
			message.setSubject(name);
			message.setText(content, "utf-8", "html");

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

		return "redirect:/main.do";
	}
}