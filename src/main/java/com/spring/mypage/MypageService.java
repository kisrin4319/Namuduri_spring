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
	public void findId(MemberModel memberModel) {
		sqlSessionTemplate.selectOne("member.findId", memberModel);
	}
	
	//2. 비밀번호 찾기
	@Override
	public void findPw(MemberModel memberModel) {
		sqlSessionTemplate.selectOne("member.findPw", memberModel);
	}
	
	//3. 회원 탈퇴
	@Override
	public void memberOut(MemberModel memberModel) {
		sqlSessionTemplate.delete("member.memberOut", memberModel);
	}
	
	//4. 회원정보 수정
	@Override
	public void memberModify(MemberModel memberModel) {
		sqlSessionTemplate.update("member.memberModify", memberModel);
	}
	
	//5. 주문상세내역 보기
	@Override
	public void memberOrderDetail(OrderDetailModel orderDetailModel) {
		sqlSessionTemplate.selectOne("order.memberOrderDetail", orderDetailModel);
	}
}
