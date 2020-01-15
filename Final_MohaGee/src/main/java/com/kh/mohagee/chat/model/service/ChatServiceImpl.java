package com.kh.mohagee.chat.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mohagee.chat.model.dao.ChatDao;
import com.kh.mohagee.chat.model.exception.ChatException;
import com.kh.mohagee.chat.model.vo.Chat;
import com.kh.mohagee.chat.model.vo.ChatRoom;
import com.kh.mohagee.member.model.vo.Member;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	private ChatDao chatDao;

	@Override
	public List<ChatRoom> selectChatRoomList(int userNo) {
		return chatDao.selectChatRoomList(userNo);
	}

	@Override
	public List<Chat> selectRecentChat(int userNo) {
		return chatDao.selectRecentChat(userNo);
	}

	@Override
	public void insertChat(Chat chat) {
		chatDao.insertChat(chat);
	}

	@Override
	public List<Integer> selectCroomUser(int croomNo) {
		return chatDao.selectCroomUser(croomNo);
	}

	@Override
	public List<Chat> selectChatList(int croomNo) {
		return chatDao.selectChatList(croomNo);
	}

	@Override
	public ChatRoom selectCroom(ChatRoom cr) {
		return chatDao.selectCroom(cr);
	}

	@Override
	public int insertChatRoom(List<ChatRoom> crList) {
		int result = 0;
		int croomNo = chatDao.selectChatRoomSeq();

		for (ChatRoom cr : crList) {
			cr.setCroomNo(croomNo);
			result = chatDao.insertChatRoom(cr);

			if (result == 0) {
				throw new ChatException();
			}
		}

		return croomNo;
	}

	@Override
	public int inviteChatRoom(List<ChatRoom> crList) {
		int result = 0;
		for (ChatRoom cr : crList) {
			result = chatDao.insertChatRoom(cr);

			if (result == 0) {
				throw new ChatException();
			}
		}
		return result;
	}

	@Override
	public void deleteChatRoom(int croomIndex) {
		chatDao.deleteChatRoom(croomIndex);

	}

	@Override
	public void updateCroom(ChatRoom cr) {
		chatDao.updateCroom(cr);
	}

	@Override
	public List<Member> selectChatUser(int croomNo) {
		return chatDao.selectChatUser(croomNo);
	}

	@Override
	public int insertChatRoom(ChatRoom cr) {
		
		return 0;
	}

}
