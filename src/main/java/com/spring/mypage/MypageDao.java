package com.spring.mypage;

import java.util.List;
import java.util.Map;

import com.spring.member.MemberModel;
import com.spring.order.OrderModel;

public interface MypageDao {

	//1. 아이디 찾기
	public MemberModel memberIdFind(MemberModel memberModel);
			
	//2. 비밀번호 찾기
	public MemberModel memberPwFind(MemberModel memberModel);
		
	//3. 회원 탈퇴
	public int memberDelete(MemberModel memberModel);
			
	//4. 회원정보 수정
	public MemberModel getMemberInfo(String member_id);
	
	public int memberModify(MemberModel memberModel);
			
	//5. 주문상세내역 보기
	public List<OrderModel> getOrderTradeNumList(String member_id);
	
	public OrderModel getOrderInfo(String order_trade_num);
	
	public Map<String, Object> memberOrderDetail(String order_trade_num);
	
	//6. 주문내역 취소
	public int memberOrderCancel(String order_trade_num);
	
	
}
