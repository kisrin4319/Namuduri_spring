package com.spring.admin;

import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.book.BooksModel;

@Service
public class AdminService implements AdminDao {
	
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override //사용 여부에 상관없이 모든 책의 목록을 불러옴
	public List<BooksModel> booksListAll() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("book.selectBooksAll");
	}
	
	@Override
	public BooksModel selectOne(int book_num) {
		return sqlSessionTemplate.selectOne("book.adminSelectOne", book_num);
	}

	@Override
	public BooksModel selectNewest() {
		return sqlSessionTemplate.selectOne("book.selectNewest");
	}
	
	@Override //도서 정보 등록
	public void insertBook(BooksModel book) {
		// TODO Auto-generated method stub
		
		/*MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		while(iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			
		}*/
		
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


}
