package com.spring.admin;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.book.BooksModel;
import com.spring.member.MemberModel;
import com.spring.order.OrderDetailModel;
import com.spring.order.OrderModel;

@Service
public class AdminService implements AdminDao {
	
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override //사용 여부에 상관없이 모든 책의 목록을 불러옴
	public List<BooksModel> booksListAll() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("book.selectBooksAll");
	}
	
	@Override //사용 여부에 관계없이 도서 번호에 해당되는 정보를 불러옴.
	public BooksModel selectOne(int book_num) {
		return sqlSessionTemplate.selectOne("book.adminSelectOne", book_num);
	}

	@Override //가장 최근에 등록된 도서 정보를 불러옴
	public BooksModel selectNewest() {
		return sqlSessionTemplate.selectOne("book.selectNewest");
	}
	
	@Override //도서 정보 등록
	public void insertBook(BooksModel book) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert("book.writeBook", book);
	}

	@Override //도서 정보 수정
	public void modifyBook(BooksModel book) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("book.modifyBook", book);
	}

	@Override //도서 정보 삭제
	public void deleteBook(int book_num) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.delete("book.deleteBook", book_num);
	}

	@Override //도서 리뷰 삭제
	public void deleteReview(int review_num) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.delete("book.deleteReview", review_num);
	}

	@Override //주문 리스트 불러옴
	public List<OrderModel> selectOrderAll() {
		return sqlSessionTemplate.selectList("order.selectAll");
	}

	@Override //주문 정보 수정
	public void modifyOrder(OrderModel book) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("order.modifyOrder", book);
	}
	
	@Override //주문 정보 불러오기
	public OrderModel selectOrder(String order_trade_num) {
		return sqlSessionTemplate.selectOne("order.selectOrder", order_trade_num);
	}
	
	@Override //주문 상세 정보 리스트 불러오기
	public List<OrderDetailModel> selectOrderDetail(String order_trade_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("order.selectOrderDetail", order_trade_num);
	}

	@Override
	public List<MemberModel> searchMember(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("member.selectSearchList", map);
	}

	@Override
	public List<BooksModel> searchBook(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("book.adminSearchList", map);
	}

	@Override
	public List<OrderModel> searchOrder(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("order.selectSearchList", map);
	}

}
