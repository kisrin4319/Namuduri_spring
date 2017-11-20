package com.spring.basket;

import java.util.List;

public interface BasketDao {
	
	//1.장바구니 목록
	public List<BasketModel> basketList(BasketModel basketModel);

	//2.장바구니 상품 한개 선택 , 장바구니에 기존의 상품이 존재하는 지 확인
	public int BasketSelectOne(BasketModel basketModel);

	//3.장바구니 추가
	public void BasketInsert(BasketModel basketModel);
	
	//4.장바구니 전체 금액
	public int sumMoney(BasketModel basketModel);	

	//5. 장바구니 수정
	public void BasketModify(BasketModel basketModel);
	
	//6. 장바구니에 기존의 상품이 존재 하면 수정(수량 추가)
	public void BasketUpdate(BasketModel basketModel);
	
	//7. 장바구니 한 개 삭제
	public void BasketDelete(int basket_book_num);
	
	//8. 장바구니 전체 삭제
	public void BasketDeleteAll(String member_id);

}
