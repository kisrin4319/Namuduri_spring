package com.spring.book;

import java.util.List;
import java.util.Map;

public interface BooksDao {

	// 책 목록
	List<BooksModel> booksList(String book_category);
	
	// 책 검색 목록
	List<BooksModel> booksSearchList(Map<String, Object> map);
	
	// 책 내용보기
	BooksModel bookOne(int book_num);
	
	// 리뷰 목록
	List<ReviewModel> reviewList(int book_num);
	
	// 리뷰 등록
	boolean reviewWrite(ReviewModel review);
}
