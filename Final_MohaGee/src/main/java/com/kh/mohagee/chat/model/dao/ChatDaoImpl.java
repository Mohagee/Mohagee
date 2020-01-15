package com.kh.mohagee.chat.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mohagee.chat.model.vo.Chat;
import com.kh.mohagee.chat.model.vo.ChatRoom;
import com.kh.mohagee.member.model.vo.Member;

@Repository
public class ChatDaoImpl implements ChatDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<ChatRoom> selectChatRoomList(int userNo) {
		return sqlSession.selectList("chat.selectChatRoomList", userNo);
	}

	@Override
	public List<Chat> selectRecentChat(int userNo) {
		return sqlSession.selectList("chat.selectRecentChat", userNo);
	}

	@Override
	public void insertChat(Chat chat) {
		sqlSession.insert("chat.insertChat", chat);
	}

	@Override
	public List<Integer> selectCroomUser(int croomNo) {
		return sqlSession.selectList("chat.selectCroomUser", croomNo);
	}

	@Override
	public List<Chat> selectChatList(int croomNo) {
		return sqlSession.selectList("chat.selectChatList", croomNo);
	}

	@Override
	public ChatRoom selectCroom(ChatRoom cr) {
		return sqlSession.selectOne("chat.selectCroom", cr);
	}

	@Override
	public int selectChatRoomSeq() {
		return sqlSession.selectOne("chat.selectChatRoomSeq");
	}

	@Override
	public int insertChatRoom(ChatRoom cr) {
		return sqlSession.insert("chat.insertChatRoom", cr);
	}

	@Override
	public void deleteChatRoom(int croomIndex) {
		sqlSession.delete("chat.deleteChatRoom", croomIndex);
	}

	@Override
	public void updateCroom(ChatRoom cr) {
		sqlSession.update("chat.updateCroom", cr);

	}

	@Override
	public List<Member> selectChatUser(int croomNo) {
		return sqlSession.selectList("chat.selectChatUser", croomNo);
	}

}
