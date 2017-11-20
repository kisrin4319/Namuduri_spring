package com.spring.order;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.spring.basket.BasketModel;
import com.spring.book.BooksModel;

@Service
public class OrderService implements OrderDao{

	@Resource 
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int totalSum(String member_id) {
		return sqlSessionTemplate.selectOne("order.totalSum", member_id);
	}

	@Override
	public int selectSum(int basket_num) {
		return sqlSessionTemplate.selectOne("order.selectSum", basket_num);
	}		

	
	@Override
	public BasketModel BasketSelect(int basket_num) {
		return sqlSessionTemplate.selectOne("order.basketSelect", basket_num);
	}


}
