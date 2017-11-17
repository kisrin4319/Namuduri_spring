package com.spring.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.spring.book.BooksModel;

public interface AdminDao {
	
	//admin에서만 사용할 기능
	//카테고리 관리
	//베스트, 추천, 신간 제품 관리
	//주문과 배송 탭 나누기. 취소된 주문은 배송 탭에서 보이지 않도록 하기. 
	//회원 등급. 마일리지..

	public List<BooksModel> booksListAll();
	
	/*List<BooksModel> booksUseNList();*/
	
	public BooksModel selectNewest();
	
	public BooksModel selectOne();
	
	public void insertBook(BooksModel book);
	
	public void modifyBook(BooksModel book);
	
	public void deleteBook(int book_num);
	
	public void deleteReview(int review_num);
	
}
