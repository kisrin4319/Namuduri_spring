package com.spring.member;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class MemberService implements MemberDao{

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	//로그인 처리
	@Override
	public MemberModel loginCheck(MemberModel memberModel) {
		return sqlSessionTemplate.selectOne("member.loginCheck", memberModel);
	}
	
	//우편번호 검색
	@Override
	public List<ZipcodeModel> zipCheck(String zip) {
		return sqlSessionTemplate.selectList("member.zipCheck", zip);
	}
	
	//회원가입
	@Override
	public void insertMember(MemberModel memberModel) {
		sqlSessionTemplate.insert("member.memberInfo", memberModel);
	}
	
	//아이디 중복확인
	@Override
	public int idCheck(MemberModel memberModel) {
		return sqlSessionTemplate.selectOne("member.idCheck", memberModel);
	}

	//회원 정보 가져오기
	@Override
	public MemberModel SelectOne(String member_id) {
		return sqlSessionTemplate.selectOne("member.memberSelectOne",member_id);
	}

	//회원 리스트 가져오기
	@Override
	public List<MemberModel> memberList() {
		return sqlSessionTemplate.selectList("member.memberList");
	}
	
	

}
