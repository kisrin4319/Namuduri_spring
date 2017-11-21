package com.spring.admin;

import java.util.List;
import java.util.Map;

import com.spring.book.BooksModel;
import com.spring.member.MemberModel;
import com.spring.order.OrderDetailModel;
import com.spring.order.OrderModel;

public interface AdminDao {
	
	//admin에서만 사용할 기능
	//카테고리 관리
	//베스트, 추천, 신간 제품 관리
	//주문과 배송 탭 나누기. 취소된 주문은 배송 탭에서 보이지 않도록 하기. 
	//회원 등급. 마일리지..
	
	public List<BooksModel> booksListAll();
	
	/*List<BooksModel> booksUseNList();*/
	
	public BooksModel selectNewest();
	
	public BooksModel selectOne(int book_num);
	
	public void insertBook(BooksModel book);
	
	public void modifyBook(BooksModel book);
	
	public void deleteBook(int book_num);
	
	public void deleteReview(int review_num);
	
	public List<OrderModel> selectOrderAll();
	
	public void modifyOrder(OrderModel book);
	
	public OrderModel selectOrder(String order_trade_num);
	
	public List<OrderDetailModel> selectOrderDetail(String order_trade_num);
	
	public List<MemberModel> searchMember(Map<String, Object> map);
	
	public List<BooksModel> searchBook (Map<String, Object> map);
	
	public List<OrderModel> searchOrder (Map<String, Object> map);
	
}
