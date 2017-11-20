package com.spring.member;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class MemberValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		
		//MemberModel을 유효성검사 지목함
		return MemberModel.class.isAssignableFrom(clazz);
	}
	
	@Override
	public void validate(Object target, Errors errors) {
		MemberModel member = (MemberModel) target;
			
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_id", "member_id");
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_pw", "member_pw");
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_name", "member_name");
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_jumin1", "member_jumin1");
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_jumin2", "member_jumin2");
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_email", "member_email");
				
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_mobile", "member_mobile");
		
		if(member.getMember_zipcode() == null || member.getMember_zipcode().trim().isEmpty()) {
			errors.rejectValue("member_zipcode", "member_zipcode");
		}
		
		if(member.getMember_addr1() == null || member.getMember_addr1().trim().isEmpty()) {
			errors.rejectValue("member_addr1", "member_addr1");
		}
		
		if(member.getMember_addr2() == null || member.getMember_addr2().trim().isEmpty()) {
			errors.rejectValue("member_addr2", "member_addr2");
		}
		
		
	}
}
