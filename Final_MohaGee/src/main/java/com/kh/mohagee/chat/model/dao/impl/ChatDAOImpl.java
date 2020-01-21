package com.kh.mohagee.chat.model.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mohagee.chat.model.dao.ChatDAO;
import com.kh.mohagee.chat.model.vo.Chat;
import com.kh.mohagee.chat.model.vo.ChatMember;

@Repository
public class ChatDAOImpl implements ChatDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	private String ns = "chat.";
	
	@Override
	public Chat checkRoom(String name) throws Exception {
		return sqlSession.selectOne(ns + "getRoom", name);
	}
	
	@Override
	public void createChatRoom(Chat ch) throws Exception {
		sqlSession.selectList(ns + "createChatRoom", ch);
	}
	
	@Override
	public List<Chat> getRoomList() throws Exception{
		return sqlSession.selectList(ns + "getRoomList");
	}
	
	@Override
	public void addRoomMember(ChatMember mem) throws Exception {
		sqlSession.insert(ns + "addRoomMember" , mem);
	}
	
	@Override
	public List<ChatMember> sameRoomList(ChatMember mem) throws Exception {
		return sqlSession.selectList(ns + "samseRoomList", mem);
	}
	
	@Override
	public void updateRoomMember(ChatMember mem) throws Exception {
		sqlSession.update(ns + "updateRoomMember", mem);
	}
	
	@Override
	public void deleteRoomMember(ChatMember mem) throws Exception {
		sqlSession.delete(ns + "deleteRoomMember", mem);
	}
	
	@Override
	public void updateChatCountInc(Chat ch) throws Exception {
		sqlSession.update(ns + "updateChatCountInc", ch);
	}
	
	@Override
	public void updateChatCountDec(Chat ch) throws Exception {
		sqlSession.update(ns + "updateChatCountDec", ch);
	}
	
	@Override
	public void deleteChat() throws Exception {
		sqlSession.delete(ns + "deleteChat");
	}
	
	@Override
	public List<Chat> searchRoomList(String name) throws Exception {
		return sqlSession.selectList(ns + "searchRoomList", name);
	}
	
	@Override
	public ChatMember getRoomMember(ChatMember mem) throws Exception {
		return sqlSession.selectOne(ns + "getRoomMember", mem); 
	}
	
	

}
