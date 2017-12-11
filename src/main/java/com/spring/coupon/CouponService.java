package com.spring.coupon;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class CouponService implements CouponDao {

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<CouponModel> couponList() {
		return sqlSessionTemplate.selectList("coupon.couponList");
	}

	@Override
	public void CouponInsert() {
		sqlSessionTemplate.insert("coupon.writeCoupon");
	}

	@Override
	public int CouponSelectOne(String coupon_code) {
		return sqlSessionTemplate.selectOne("coupon.couponSelectOne",coupon_code);
	}

	@Override
	public int CouponUse(String coupon_code) {
		return sqlSessionTemplate.selectOne("coupon.couponUse",coupon_code);
	}
	
	@Override
	public void CouponDelete(String coupon_code) {
		sqlSessionTemplate.delete("coupon.deleteCoupon",coupon_code);

	}

	@Override
	public void CouponDeleteAll() {
		sqlSessionTemplate.delete("coupon.deleteCouponAll");

	}

	

}
