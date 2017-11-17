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
	public Object insertMember(MemberModel memberModel) {
		return sqlSessionTemplate.insert("member.memberInfo", memberModel);
	}
	
	//아이디 중복확인
	@Override
	public MemberModel idCheck(String idChk) {
		return sqlSessionTemplate.selectOne("member.idCheck", idChk);
	}
	
	

}
