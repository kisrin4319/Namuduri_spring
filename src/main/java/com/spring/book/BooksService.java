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
	public List<Map<String, Object>> booksList(String book_category){
		return sqlSessionTemplate.selectList("book.selectBookList", book_category);
	}
	
	// 책 검색 목록
	@Override
	public List<Map<String, Object>> booksSearchList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("book.selectSearchList", map);
	}
	
	//도서 목록 (등록 순서)
	@Override
	public List<BooksModel> booksListDate() {
		return sqlSessionTemplate.selectList("book.selectDateList");
	}

	//도서 목록(BestSeller)
	@Override
	public List<BooksModel> bestSellerList() {	
		return sqlSessionTemplate.selectList("book.bestSellerList");
	}

	//도서 목록(새로 나올 책)
	@Override
	public List<BooksModel> newBookList() {
		return sqlSessionTemplate.selectList("book.NewBookList");
	}

	//도서 목록(가격 범위 지정)
	@Override
	public List<BooksModel> SliderBookList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("book.SliderBookList",map);
	}
	
	// 책 하나 선택
	@Override
	public BooksModel bookOne(int book_num) {
		return sqlSessionTemplate.selectOne("book.selectBookOne", book_num);
	}
	
	// star_point포함한 책 내용보기
	@Override
	public Map<String, Object> book_star(int book_num) {
		return sqlSessionTemplate.selectOne("book.bookStar", book_num);
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

	// 베스트셀러 TOP2 뽑기
	@Override
	public List<Map<String, Object>> top2() {
		return sqlSessionTemplate.selectList("book.top2");
	}

}