package com.kh.mohagee.chat.model.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mohagee.chat.model.vo.Chat;
import com.kh.mohagee.chat.model.vo.ChatMember;
import com.kh.mohagee.chat.model.service.ChatService;
import com.kh.mohagee.chat.model.dao.ChatDAO;

@Service
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	ChatDAO chatDAO;
	
	@Override
	public Chat checkRoom(String name) throws Exception {
		return chatDAO.checkRoom(name);
	}
	
	@Override
	public void createChatRoom(Chat ch) throws Exception {
		chatDAO.createChatRoom(ch);
	}
	
	@Override
	public List<Chat> getRoomList() throws Exception {
		return chatDAO.getRoomList();
	}
	
	@Override
	public void addRoomMember(ChatMember mem) throws Exception {
		chatDAO.addRoomMember(mem);
	}
	
	@Override
	public ChatMember getRoomMember(ChatMember mem) throws Exception {
		return chatDAO.getRoomMember(mem);
	}
	
	@Override
	public List<ChatMember> sameRoomList(ChatMember mem) throws Exception {
		return chatDAO.sameRoomList(mem);
	}
	
	@Override
	public void updateRoomMember(ChatMember mem) throws Exception {
		chatDAO.updateRoomMember(mem);
	}
	@Override
	public void deleteRoomMember(ChatMember mem) throws Exception {
		chatDAO.updateRoomMember(mem);
	}
	@Override
	public void updateChatCountInc(Chat ch) throws Exception {
		chatDAO.updateChatCountInc(ch);
	}
	
	@Override
	public void updateChatCountDec(Chat ch) throws Exception {
		chatDAO.updateChatCountDec(ch);
	}
	
	@Override
	public void deleteChat() throws Exception {
		chatDAO.deleteChat();
	}
	
	@Override
	public List<Chat> searchRoomList(String name) throws Exception {
		return chatDAO.searchRoomList(name);
	}
	
	
	

}
