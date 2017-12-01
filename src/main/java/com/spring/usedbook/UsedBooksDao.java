package com.spring.usedbook;

import java.util.List;
import java.util.Map;

public interface UsedBooksDao {

	//1. 중고 서적 목록
	List<UsedBooksModel> UsedBooksList(String book_category);
	
	//2. 중고 서적 검색 목록
	List<UsedBooksModel> UsedBooksSearchList(Map<String, Object> map);
	
	//3. 중고 서적 내용보기
	UsedBooksModel UsedbookOne(int book_num);
	
	//4. 중고 서적 등록
	public void UsedBooksInsert(UsedBooksModel usedBooksModel);
	
	//5. 중고 서적 수정
	public void UsedBooksModify(UsedBooksModel usedBooksModel);
	
	//6. 중고 서적 삭제
	public void UsedBooksDelete(int used_book_num);
}
