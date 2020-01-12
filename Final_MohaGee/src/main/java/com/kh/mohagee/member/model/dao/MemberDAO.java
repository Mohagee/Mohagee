package com.kh.mohagee.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mohagee.member.model.vo.Member;

@Repository
public class MemberDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int insertMember(Member member) {
		return sqlSession.insert("member-mapper.insertMember", member);
	}

	public Member selectNickName(String userId) {
		return sqlSession.selectOne("member-mapper.selectNickName", userId);
	}

	public Member selectOneMember(Member member) {
		return sqlSession.selectOne("member-mapper.selectOneMember", member);
	}

	public String findEmail(Member member) {
		return sqlSession.selectOne("member-mapper.selectFindEmail", member);
	}

	public int updateConfirm(String email) {
		return sqlSession.update("member-mapper.updateConfirm", email);
	}

	public int findPassword(Member member) {
		return sqlSession.selectOne("member-mapper.selectFindPassword", member);
	}

	public int updateTemPass(Member member) {
		return sqlSession.update("member-mapper.updateTemPass", member);
	}

	public Member selectMyPage(int userNo) {
		return sqlSession.selectOne("member-mapper.selectMyPage", userNo);
	}

}
