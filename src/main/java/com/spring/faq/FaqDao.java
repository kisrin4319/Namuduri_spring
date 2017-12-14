package com.spring.faq;

import java.util.List;
import java.util.Map;

public interface FaqDao {
	
	// faq 목록
	public List<FaqModel> faqList();
	
	public List<FaqModel> AfaqList();
	
	public List<FaqModel> BfaqList();
	
	public List<FaqModel> CfaqList();
	
	// faq 내용 보기
	public FaqModel faqDetail(int faq_num);
	
	// faq 작성
	public boolean faqWrite(FaqModel faqModel);
	
	// faq 수정
	public void faqModify(FaqModel faqModel);
	
	// faq 삭제
	public void faqDelete(int faq_num);
	
	//검색
	List<FaqModel> Search1(String search);

	List<FaqModel> Search2(String search);
	
	// faq 게시판 조회수
	public void updateReadcount(Map<String, Object> map);

}
