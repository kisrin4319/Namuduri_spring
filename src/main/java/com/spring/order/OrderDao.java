package com.spring.order;

import java.util.List;

import com.spring.basket.BasketModel;
import com.spring.book.BooksModel;

public interface OrderDao {

	// 1. 전체구매 금액 합계 구하기
	public int totalSum(String member_id);

	// 2. 선택구매 금액 합계 구하기
	public int selectSum(int basket_num);

	// 3. 장바구니 선택 정보
	public BasketModel BasketSelect(int basket_num);

	// 4. 단일 구매 정보 DB 입력
	public void singleOrder(OrderModel orderModel);

	// 5. 단일 구매 도서 DB 입력
	public void singleOrderDetail(OrderDetailModel orderDetailModel);

	// 6. 단일 구매 정보 꺼내오기
	public OrderModel getOrder(OrderModel orderModel);

	// 7. 단일 구매 도서 정보 꺼내오기
	public OrderDetailModel getOrderDetail(OrderDetailModel orderDetailModel);

	// 8. 주문 후 장바구니 삭제
	public void delBasket(int basket_num);

}
