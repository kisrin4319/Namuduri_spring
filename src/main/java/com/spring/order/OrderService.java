package com.spring.order;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.spring.basket.BasketModel;
import com.spring.book.BooksModel;

@Service
public class OrderService implements OrderDao {

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	// 1. 전체구매 금액 합계 구하기
	@Override
	public int totalSum(String member_id) {
		return sqlSessionTemplate.selectOne("order.totalSum", member_id);
	}

	// 2. 선택구매 금액 합계 구하기
	@Override
	public int selectSum(int basket_num) {
		return sqlSessionTemplate.selectOne("order.selectSum", basket_num);
	}

	// 3. 장바구니 선택 정보
	@Override
	public BasketModel BasketSelect(int basket_num) {
		return sqlSessionTemplate.selectOne("order.basketSelect", basket_num);
	}

	// 4. 단일 구매 정보 DB 입력
	@Override
	public void singleOrder(OrderModel orderModel) {
		sqlSessionTemplate.insert("order.orderBook", orderModel);
	}

	// 5. 단일 구매 도서 DB 입력
	@Override
	public void singleOrderDetail(OrderDetailModel orderDetailModel) {
		sqlSessionTemplate.insert("order.orderDetail", orderDetailModel);
	}

	// 6. 단일 구매 정보 꺼내오기
	@Override
	public OrderModel getOrder(OrderModel orderModel) {
		return sqlSessionTemplate.selectOne("order.getOrder", orderModel);
	}

	// 7. 단일 구매 도서 정보 꺼내오기
	@Override
	public OrderDetailModel getOrderDetail(OrderDetailModel orderDetailModel) {
		return sqlSessionTemplate.selectOne("order.getOrderDetail", orderDetailModel);
	}

	// 8. 주문 후 장바구니 삭제
	@Override
	public void delBasket(int basket_num) {
		sqlSessionTemplate.delete("order.delBasket", basket_num);
	}

	// 9. 주문 후 재고 관리
	@Override
	public void updateStock(BooksModel book) {
		sqlSessionTemplate.update("order.stock", book);
	}
}
