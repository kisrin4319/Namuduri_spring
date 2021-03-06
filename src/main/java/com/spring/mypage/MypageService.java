package com.spring.mypage;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.spring.book.BooksModel;
import com.spring.member.MemberModel;
import com.spring.order.OrderModel;

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
	public MemberModel getMemberInfo(String member_id) {
		return sqlSessionTemplate.selectOne("member.memberSelectOne", member_id);
	}
	
	@Override
	public int memberModify(MemberModel memberModel) {
		return sqlSessionTemplate.update("member.memberModify", memberModel);
	}
	
	//5. 주문상세내역 보기
	@Override
	public List<OrderModel> getOrderTradeNumList(String member_id) {
		return sqlSessionTemplate.selectList("order.getOrderTradeNumList", member_id);
	}
	
	@Override
	public OrderModel getOrderInfo(String order_trade_num) {
		return sqlSessionTemplate.selectOne("order.selectOrder", order_trade_num);
	}
	
	@Override
	public List<Map<String, Object>> memberOrderDetail(String order_trade_num) {
		return sqlSessionTemplate.selectList("order.memberOrderDetail", order_trade_num);
	}
	
	//6. 주문내역 취소
	@Override
	public int memberOrderCancel(String order_trade_num) {
		return sqlSessionTemplate.update("order.orderCancel", order_trade_num);
	}

	public int memberPwUpdate(Map<String, Object> param) {
		return sqlSessionTemplate.update("member.memberPwUpdate", param);
	}
	
	public List<Map<String, Object>> bookNumIn(String order_trade_num) {
		return sqlSessionTemplate.selectList("order.bookNumIn", order_trade_num);
	}
	
}
