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

	@Override
	public List<BooksModel> efeelogSearchList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("efeelog.efeelogSearch", map);
	}
	
	@Override
	public void EFeelogInsert(EFeelogModel eFeelogModel) {
		sqlSessionTemplate.insert("efeelog.efeelogInsert", eFeelogModel);
	}
	
	@Override
	public List<EFeelogModel> efeelogList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("efeelog.efeelogList", map);
	}
}
