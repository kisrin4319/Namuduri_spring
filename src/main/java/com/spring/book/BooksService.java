package com.spring.book;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;


@Service
// 서비스로 등록이 됨
public class BooksService implements BooksDao {
	
	@Resource
	// 어플리케이션에서 필요로 하는 자원을 자동 연결할 때 사용함
	// @autowired는 타입으로 @resource는 이름으로 연결한다는 점이 차이점.
	private SqlSessionTemplate sqlSessionTemplate;

	// 책 목록
	@Override
	public List<BooksModel> booksList(String book_category) {
		return sqlSessionTemplate.selectList("book.selectBookList",book_category);
	}
	
	// 책 검색 목록
	@Override
	public List<BooksModel> booksSearchList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("book.selectSearchList", map);
	}
	
	@Override
	public List<BooksModel> booksListDate() {
		return sqlSessionTemplate.selectList("book.selectDateList");
	}

	@Override
	public List<BooksModel> bestSellerList() {	
		return sqlSessionTemplate.selectList("book.bestSellerList");
	}


	// 책 내용 보기
	@Override
	public BooksModel bookOne(int book_num) {
		return sqlSessionTemplate.selectOne("book.selectBookOne", book_num);
	}

	// 리뷰 목록
	@Override
	public List<ReviewModel> reviewList(int book_num) {
		return sqlSessionTemplate.selectList("book.selectReviewList", book_num);
	}

	// 리뷰 작성
	@Override
	public boolean reviewWrite(ReviewModel review) {
		sqlSessionTemplate.insert("book.reviewWrite", review);
		return true;
	}

	
}