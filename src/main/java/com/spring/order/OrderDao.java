package com.spring.order;

import java.util.List;

import com.spring.basket.BasketModel;
import com.spring.book.BooksModel;

public interface OrderDao {

	public int totalSum(String member_id);
	
	public int selectSum(int basket_num);

	public BasketModel BasketSelect(int basket_num);
}
