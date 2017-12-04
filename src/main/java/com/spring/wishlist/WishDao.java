package com.spring.wishlist;

import java.util.List;

public interface WishDao {

	// 위시리스트 띄우기
	public List<WishModel> wishList(WishModel wishModel);
	
	// 위시리스트 추가하기
	public void wishInsert(WishModel wishModel);
	
	// 위시리스트 삭제하기
	public void wishDelete(int wish_num);
	
	// 위시리스트 상품 중복 여부 확인
	public int wishConfirm(WishModel wishModel);
	
	// 위시리스트 상품 중복 시 수량 업데이트
	public void wishUpdate(WishModel wishModel);
	
	// 위시리스트 전체 삭제
	public void wishDeleteAll(String member_id);
	
	// 위시리스트 코멘트 수정
	public void wishComment(WishModel wishModel);
}
