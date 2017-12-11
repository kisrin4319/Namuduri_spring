package com.spring.efeelog;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.spring.book.BooksModel;

@Service
public class EFeelogService implements EFeelogDao {
	
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	//검색 리스트
	@Override
	public List<BooksModel> efeelogSearchList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("efeelog.efeelogSearch", map);
	}
	
	//insert
	@Override
	public void EFeelogInsert(EFeelogModel eFeelogModel) {
		sqlSessionTemplate.insert("efeelog.efeelogInsert", eFeelogModel);
	}
	
	//efeelog페이지에서 보여지는 모든 리스트
	@Override
	public List<EFeelogModel> efeelogList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("efeelog.efeelogList", map);
	}
	
	//efeelog 작성
	@Override
	public List<BooksModel> EFeelogDate(List<BooksModel> booksModel) {
		return sqlSessionTemplate.selectList("efeelog.efeelogData", booksModel);
	}

}
