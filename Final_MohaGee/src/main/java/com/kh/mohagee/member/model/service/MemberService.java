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

}
