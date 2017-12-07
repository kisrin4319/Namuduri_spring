package com.spring.efeelog;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class EFeelogService implements EFeelogDao {
	
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<EFeelogModel> efeelogSearchList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("efeelog.efeelogSearch", map);
	}
}
