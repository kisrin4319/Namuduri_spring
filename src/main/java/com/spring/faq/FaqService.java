package com.spring.faq;

import java.util.List;
import java.util.Map;

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
		return sqlSessionTemplate.selectList("faq.faqList"); //전체 목록
	}
	
	@Override
	public List<FaqModel> AfaqList(){
		return sqlSessionTemplate.selectList("faq.AfaqList"); //배송 문의
	}
	
	@Override
	public List<FaqModel> BfaqList(){
		return sqlSessionTemplate.selectList("faq.BfaqList"); //도서 문의
	}
	
	@Override
	public List<FaqModel> CfaqList(){
		return sqlSessionTemplate.selectList("faq.CfaqList"); //기타 문의
	}

	@Override
	public List<FaqModel> DfaqList(){
		return sqlSessionTemplate.selectList("faq.DfaqList"); //멤버 문의
	}
	
	// faq 내용 보기
	@Override
	public FaqModel faqDetail(int faq_num) {
		return sqlSessionTemplate.selectOne("faq.selectFaqOne", faq_num);
	}
	
	// faq 검색
	@Override
	public List<FaqModel> Search1(String search) {
		return sqlSessionTemplate.selectList("faq.Search1", "%" + search + "%");
	}

	@Override
	public List<FaqModel> Search2(String search) {
		return sqlSessionTemplate.selectList("faq.Search2", "%" + search + "%");
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
	
	// faq 조회수
	@Override
	public void updateReadcount(Map<String, Object> map) {
		sqlSessionTemplate.update("faq.updateReadcount", map);
	}


}
