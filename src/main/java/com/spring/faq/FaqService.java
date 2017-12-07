package com.spring.faq;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class FaqService implements FaqDao{
	
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	// faq 목록
	@Override
	public List<FaqModel> faqList(){
		return sqlSessionTemplate.selectList("faq.faqList");
	}
	
	// faq 내용 보기
	@Override
	public FaqModel faqDetail(int faq_num) {
		return sqlSessionTemplate.selectOne("faq.selectFaqOne", faq_num);
	}
		
	// faq 작성
	@Override
	public boolean faqWrite(FaqModel faqModel) {
		sqlSessionTemplate.insert("faq.faqWrite", faqModel);
		return true;
	}
		
	// faq 수정
	@Override
	public void faqModify(FaqModel faqModel) {
		sqlSessionTemplate.update("faq.faqModify", faqModel);
	}

	// faq 삭제
	@Override
	public void faqDelete(int faq_num) {
		sqlSessionTemplate.delete("faq.faqDelete", faq_num);
	}
}
