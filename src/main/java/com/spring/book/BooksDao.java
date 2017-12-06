package com.spring.book;

import java.util.List;
import java.util.Map;

public interface BooksDao {

	// 책 목록
	public List<Map<String, Object>> booksList(String book_category);
	
	// 책 검색 목록
	public List<Map<String, Object>> booksSearchList(Map<String, Object> map);
	
	//도서 목록 (등록 순서)
	List<BooksModel> booksListDate();
	
	//도서 목록(BestSeller)
	List<BooksModel> bestSellerList();
	
	//도서 목록(새로 나올 책)
	List<BooksModel> newBookList();
	
	//도서 목록(가격 범위 지정)
	List<BooksModel> SliderBookList(Map<String, Object> map);
	// 책 내용보기
	public BooksModel bookOne(int book_num);
	
	// star_point 포함한 책 내용보기
	public Map<String, Object> book_star(int book_num);
	
	// 리뷰 목록
	public List<ReviewModel> reviewList(int book_num);
	
	// 리뷰 등록
	public boolean reviewWrite(ReviewModel review);
	
	// 베스트셀러 TOP2 뽑기
	public List<Map<String, Object>> top2();

}
