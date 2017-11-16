package com.spring.basket;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class BasketService implements BasketDao {

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	//1. 장바구니 목록
	@Override
	public List<BasketModel> basketList(BasketModel basketModel) {
		return sqlSessionTemplate.selectList("basket.basketList",basketModel);
	}
	
	//2. 장바구니에 기존의 상품이 존재하는지 확인 , 장바구니 상품 하나 선택
	@Override
	public int BasketSelectOne(BasketModel basketModel) {
		return sqlSessionTemplate.selectOne("basket.basketSelectOne",basketModel);
	}	
	
	//3. 장바구니 추가
	@Override
	public void BasketInsert(BasketModel basketModel) {
		sqlSessionTemplate.insert("basket.basketInsert",basketModel);
	}
	
	//4.장바구니 전체 금액
	@Override
	public int sumMoney(BasketModel basketModel) {
		return sqlSessionTemplate.selectOne("basket.sumMoney",basketModel);
	}
	
	//5. 장바구니 수정
	@Override
	public void BasketModify(BasketModel basketModel) {
		sqlSessionTemplate.update("basket.basketModify",basketModel);		
	}

	//6. 장바구니에 기존의 상품이 존재 하면 수정(수량 추가)
	@Override
	public void BasketUpdate(BasketModel basketModel) {
		sqlSessionTemplate.update("basket.basketUpdate",basketModel);
	}

	//7. 장바구니 한 개 삭제
	@Override
	public void BasketDelete(int basket_book_num) {
		sqlSessionTemplate.delete("basket.basketDelete", basket_book_num);
	}

	//8. 장바구니 전체 삭제
	@Override
	public void BasketDeleteAll(String member_id) {
		sqlSessionTemplate.delete("basket.basketDeleteAll",member_id);
	}		
}
