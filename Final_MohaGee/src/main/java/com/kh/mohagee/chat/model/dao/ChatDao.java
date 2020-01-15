package com.kh.mohagee.chat.model.dao;

import java.util.List;

import com.kh.mohagee.chat.model.vo.Chat;
import com.kh.mohagee.chat.model.vo.ChatRoom;
import com.kh.mohagee.member.model.vo.Member;

public interface ChatDao {

	List<ChatRoom> selectChatRoomList(int userNo);

	List<Chat> selectRecentChat(int userNo);

	void insertChat(Chat chat);

	List<Integer> selectCroomUser(int croomNo);

	List<Chat> selectChatList(int croomNo);

	ChatRoom selectCroom(ChatRoom cr);

	int selectChatRoomSeq();

	int insertChatRoom(ChatRoom cr);

	void deleteChatRoom(int croomIndex);

	void updateCroom(ChatRoom cr);

	List<Member> selectChatUser(int croomNo);

}