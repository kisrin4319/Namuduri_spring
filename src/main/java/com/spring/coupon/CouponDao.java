package com.spring.coupon;

import java.util.List;

public interface CouponDao {

	//1.쿠폰 리스트
	public List<CouponModel> couponList();
	
	//2. 쿠폰 생성
	public void CouponInsert();
	
	//3. 쿠폰 확인
	public int CouponSelectOne(String coupon_code);
	
	//5. 쿠폰 사용
	public int CouponUse(String coupon_code);
	//6. 쿠폰 삭제
	public void CouponDelete(String coupon_code);
	
	//7. 만료 쿠폰 삭제
	public void CouponDeleteAll();
	
	
}
