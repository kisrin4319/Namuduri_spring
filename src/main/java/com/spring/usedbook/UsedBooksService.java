package com.spring.usedbook;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;


@Service
// 서비스로 등록이 됨
public class UsedBooksService implements UsedBooksDao {
	
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	//1.중고 서적 목록
	@Override
	public List<UsedBooksModel> UsedBooksList(String book_category) {
		return sqlSessionTemplate.selectList("usedbook.selectBooksAll",book_category);
	}

	//2. 중고 서적 검색 목록
	@Override
	public List<UsedBooksModel> UsedBooksSearchList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("usedbook.selectSearchList", map);
	}
	
	//3. 중고 서적 내용 보기
	@Override
	public UsedBooksModel UsedbookOne(int used_book_num) {
		return sqlSessionTemplate.selectOne("usedbook.selectBookOne",used_book_num);
	}
	//4. 중고 서적 등록
	@Override
	public void UsedBooksInsert(UsedBooksModel usedBooksModel) {
		sqlSessionTemplate.insert("usedbook.insertUsedBook",usedBooksModel);
	}

	//5. 중고 서적 수정
	@Override
	public void UsedBooksModify(UsedBooksModel usedBooksModel) {
		sqlSessionTemplate.update("usedbook.modifyUsedBook", usedBooksModel);
	}

	//6. 중고 서적 삭제
	@Override
	public void UsedBooksDelete(int used_book_num) {
		sqlSessionTemplate.delete("usedbook.deleteUsedBook",used_book_num);
	}

	@Override
	public List<UsedBooksModel> SliderBookList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("usedbook.SliderBookList",map);
	}

}