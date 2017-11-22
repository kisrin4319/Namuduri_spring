package com.spring.admin;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class AdminValidator implements Validator{

	@Override
	public boolean supports(Class<?> arg0) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		
		/*BooksModel booksModel = (BooksModel) target;*/
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "book_name", "book_name");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "book_content", "book_content");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "book_price", "book_price");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "book_base_count", "book_base_count");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "book_publish_date", "book_publish_date");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "company_id", "company_id");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "book_auth", "book_auth");
	}

}
