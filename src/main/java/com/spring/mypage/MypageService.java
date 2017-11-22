package com.spring.mypage;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.spring.member.MemberModel;
import com.spring.order.OrderDetailModel;

@Service
public class MypageService implements MypageDao {

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	//1. 아이디 찾기
	@Override
	public MemberModel memberIdFind(MemberModel memberModel) {
		return sqlSessionTemplate.selectOne("member.findId", memberModel);
	}
	
	//2. 비밀번호 찾기
	@Override
	public MemberModel memberPwFind(MemberModel memberModel) {
		return sqlSessionTemplate.selectOne("member.findPw", memberModel);
	}
	
	//3. 회원 탈퇴
	@Override
	public int memberDelete(MemberModel memberModel) {
		return sqlSessionTemplate.delete("member.memberDelete", memberModel);
	}
	
	//4. 회원정보 수정
	@Override
	public int memberModify(MemberModel memberModel) {
		return sqlSessionTemplate.update("member.memberModify", memberModel);
	}
	
	//5. 주문상세내역 보기
	@Override
	public OrderDetailModel memberOrderDetail(String order_trade_num) {
		return sqlSessionTemplate.selectOne("order.memberOrderDetail", order_trade_num);
	}
	
	//6. 주문내역 취소
	@Override
	public void memberOrderCancel(String order_trade_num) {
		sqlSessionTemplate.delete("order.orderCancel", order_trade_num);
	}
}
