package com.spring.efeelog;

import java.util.List;
import java.util.Map;

import com.spring.book.BooksModel;

public interface EFeelogDao {

	public List<BooksModel> efeelogSearchList(Map<String, Object> map);
	
	public void EFeelogInsert(EFeelogModel eFeelogModel);
	
	public List<EFeelogModel> efeelogList(Map<String, Object> map);
	
	public List<BooksModel> EFeelogDate(List<BooksModel> booksModel);
}
