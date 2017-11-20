package com.spring.mypage;

import com.spring.member.MemberModel;
import com.spring.order.OrderDetailModel;

public interface MypageDao {

	//1. 아이디 찾기
	public MemberModel memberIdFind(MemberModel memberModel);
			
	//2. 비밀번호 찾기
	public MemberModel memberPwFind(MemberModel memberModel);
		
	//3. 회원 탈퇴
	public int memberDelete(MemberModel memberModel);
			
	//4. 회원정보 수정
	public int memberModify(MemberModel memberModel);
			
	//5. 주문상세내역 보기
	public void memberOrderDetail(OrderDetailModel orderDetailModel);
	
	//6. 주문내역 취소
	public Object memberOrderCancel(OrderDetailModel orderDetailModel);
}
