package com.spring.usedbook;

import java.util.List;
import java.util.Map;

public interface UsedBooksDao {

	//1. 중고 서적 목록
	List<UsedBooksModel> UsedBooksList(String book_category);
	
	//2. 중고 서적 검색 목록
	List<UsedBooksModel> UsedBooksSearchList(Map<String, Object> map);
	
	//도서 목록(가격 범위 지정)
	List<UsedBooksModel> SliderBookList(Map<String, Object> map);
	
	//3. 중고 서적 내용보기
	UsedBooksModel UsedbookOne(int used_book_num);
	
	//4. 중고 서적 등록
	public void UsedBooksInsert(UsedBooksModel usedBooksModel);
	
	//5. 중고 서적 수정
	public void UsedBooksModify(UsedBooksModel usedBooksModel);
	
	//6. 중고 서적 삭제
	public void UsedBooksDelete(int used_book_num);
	
	//7. NEW BOOKS에 중고상품 띄우기
	public List<UsedBooksModel> NewList(int book_num);
	
	//8. Book Detail에서 중고상품 선택시 중고 리스트로 이동
	public List<UsedBooksModel> selectUsed(int used_book_num);
	
	//실적 확인용 (중고 거래 등록 권한)
	public int checkResult(String member_id);
}
