package com.spring.wishlist;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class WishService implements WishDao{

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 위시리스트
	@Override
	public List<WishModel> wishList(WishModel wishModel) {
		return sqlSessionTemplate.selectList("wishlist.wishList", wishModel);
	}

	// 위시리스트 추가
	@Override
	public void wishInsert(WishModel wishModel) {
		sqlSessionTemplate.insert("wishlist.wishInsert", wishModel);
	}

	// 위시리스트 삭제
	@Override
	public void wishDelete(int wish_num) {
		sqlSessionTemplate.delete("wishlist.wishDelete", wish_num);
	}

	// 위시리스트 상품 중복 여부 확인
	@Override
	public int wishConfirm(WishModel wishModel) {
		return sqlSessionTemplate.selectOne("wishlist.wishConfirm", wishModel);
	}

	// 위시리스트 상품 중복 시 수량 업데이트
	@Override
	public void wishUpdate(WishModel wishModel) {
		sqlSessionTemplate.update("wishlist.wishUpdate", wishModel);
	}

	// 위시리스트 전체삭제
	@Override
	public void wishDeleteAll(String member_id) {
		sqlSessionTemplate.delete("wishlist.wishDeleteAll", member_id);
	}

	// 위시리스트 코멘트 수정
	@Override
	public void wishComment(WishModel wishModel) {
		sqlSessionTemplate.update("wishlist.commentModify", wishModel);
		
	}
	
	

}
