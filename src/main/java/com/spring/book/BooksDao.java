package com.spring.book;

import java.util.List;
import java.util.Map;

public interface BooksDao {

	// 책 목록
	public List<BooksModel> booksList(String book_category);
	
	// 책 검색 목록
	public List<BooksModel> booksSearchList(Map<String, Object> map);
	
	//도서 목록 (등록 순서)
	List<BooksModel> booksListDate();
	
	//도서 목록(BestSeller)
	List<BooksModel> bestSellerList();
	// 책 내용보기
	public BooksModel bookOne(int book_num);
	
	// 리뷰 목록
	public List<ReviewModel> reviewList(int book_num);
	
	// 리뷰 등록
	public boolean reviewWrite(ReviewModel review);
	
	// 베스트셀러 TOP2 뽑기
	public List<BooksModel> top2();
	
	// 평점 구하기
	public int star(int book_num);
}
