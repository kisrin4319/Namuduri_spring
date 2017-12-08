package com.spring.efeelog;

import java.util.List;
import java.util.Map;

public interface EFeelogDao {

	public List<EFeelogModel> efeelogSearchList(Map<String, Object> map); 
}
