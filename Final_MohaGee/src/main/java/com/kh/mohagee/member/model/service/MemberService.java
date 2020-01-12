package com.kh.mohagee.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mohagee.member.model.dao.MemberDAO;
import com.kh.mohagee.member.model.vo.Member;

@Service
public class MemberService {
	
	@Autowired
	MemberDAO memberDao;

	public int insertMember(Member member) {
		return memberDao.insertMember(member);
	}

	public Member selectNickName(String userId) {
		return memberDao.selectNickName(userId);
	}

	public Member selectOneMember(Member member) {
		return memberDao.selectOneMember(member);
	}

	public String findEmail(Member member) {
		return memberDao.findEmail(member);
	}

	public int updateConfirm(String email) {
		return memberDao.updateConfirm(email);
	}

	public int findPassword(Member member) {
		return memberDao.findPassword(member);
	}

	public int updateTemPass(Member member) {
		return memberDao.updateTemPass(member);
	}

	public Member selectMyPage(int userNo) {
		return memberDao.selectMyPage(userNo);
	}

}
