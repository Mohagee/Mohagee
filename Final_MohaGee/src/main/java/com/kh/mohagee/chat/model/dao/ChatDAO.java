package com.kh.mohagee.chat.model.dao;

import java.util.List;

import com.kh.mohagee.chat.model.vo.Chat;
import com.kh.mohagee.chat.model.vo.ChatMember;

public interface ChatDAO {
	
	public Chat checkRoom(String name) throws Exception;
	
	public void createChatRoom(Chat ch) throws Exception;
	
	public List<Chat> getRoomList() throws Exception;
	
	public void addRoomMember(ChatMember mem) throws Exception;
	
	public List<ChatMember> sameRoomList(ChatMember mem) throws Exception;
	
	public void updateRoomMember(ChatMember mem) throws Exception;
	
	public void deleteRoomMember(ChatMember mem) throws Exception;
	
	public void updateChatCountInc(Chat ch) throws Exception;
	
	public void updateChatCountDec(Chat ch) throws Exception;
	
	public void deleteChat() throws Exception;
	
	public List<Chat> searchRoomList(String name) throws Exception;

	public ChatMember getRoomMember(ChatMember mem) throws Exception;

}