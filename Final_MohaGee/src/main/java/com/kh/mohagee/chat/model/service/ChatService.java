package com.kh.mohagee.chat.model.service;

import java.util.List;

import com.kh.mohagee.chat.model.vo.Chat;
import com.kh.mohagee.chat.model.vo.ChatRoom;
import com.kh.mohagee.member.model.vo.Member;

public interface ChatService {

	List<ChatRoom> selectChatRoomList(int userNo);

	List<Chat> selectRecentChat(int userNo);

	void insertChat(Chat chat);

	List<Integer> selectCroomUser(int croomNo);
	
	List<Chat> selectChatList(int croomNo);

	ChatRoom selectCroom(ChatRoom cr);

	int insertChatRoom(List<ChatRoom> crList);

	int insertChatRoom(ChatRoom cr);

	void deleteChatRoom(int croomIndex);

	void updateCroom(ChatRoom cr);

	List<Member> selectChatUser(int croomNo);

	int inviteChatRoom(List<ChatRoom> crList);

}
