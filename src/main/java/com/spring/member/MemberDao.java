package com.spring.member;

import java.util.List;

public interface MemberDao {

	//로그인 체크
	public MemberModel loginCheck(MemberModel memberModel);
	
	//우편번호 검색
	public List<ZipcodeModel> zipCheck(String zip);
	
	//회원가입
	public void insertMember(MemberModel memberModel);
	
	//아이디 중복확인
	public int idCheck(String member_id);
	
	// 회원 정보 가져오기
	public MemberModel SelectOne(String member_id);
	
	// 회원 리스트 가져오기
	public List<MemberModel> memberList();

	

	
}
