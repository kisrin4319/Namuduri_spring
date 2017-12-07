package com.spring.faq;

import java.util.List;

public interface FaqDao {
	
	// faq 목록
	public List<FaqModel> faqList();
	
	// faq 내용 보기
	public FaqModel faqDetail(int faq_num);
	
	// faq 작성
	public boolean faqWrite(FaqModel faqModel);
	
	// faq 수정
	public void faqModify(FaqModel faqModel);
	
	// faq 삭제
	public void faqDelete(int faq_num);

}
