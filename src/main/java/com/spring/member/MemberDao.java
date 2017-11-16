package com.spring.member;

import java.util.List;

public interface MemberDao {

	//로그인 체크
	public MemberModel loginCheck(MemberModel memberModel);
	//우편번호 검색
	public List<ZipcodeModel> zipCheck(String zip);
	//회원가입
	public Object insertMember(MemberModel memberModel);
}