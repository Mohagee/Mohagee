package com.kh.mohagee.chat.model.vo;

import java.io.Serializable;
import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class Chat implements Serializable {
	
	private int chatNo;
	private int croomNo;
	private int chatsendNo;
	private String chatContent;
	private Timestamp chatsendTime;
	private String chatIsRead;
	
	private String senderName;
	private String croomTitle;

	public Chat() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Chat(int chatNo, int croomNo, int chatsendNo, String chatContent, Timestamp chatsendTime, String chatIsRead,
			String senderName) {
		super();
		this.chatNo = chatNo;
		this.croomNo = croomNo;
		this.chatsendNo = chatsendNo;
		this.chatContent = chatContent;
		this.chatsendTime = chatsendTime;
		this.chatIsRead = chatIsRead;
		this.senderName = senderName;
	}

	public int getChatNo() {
		return chatNo;
	}

	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}

	public int getCroomNo() {
		return croomNo;
	}

	public void setCroomNo(int croomNo) {
		this.croomNo = croomNo;
	}

	public int getChatsendNo() {
		return chatsendNo;
	}

	public void setChatsendNo(int chatsendNo) {
		this.chatsendNo = chatsendNo;
	}

	public String getChatContent() {
		return chatContent;
	}

	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}

	public Timestamp getChatsendTime() {
		return chatsendTime;
	}

	public void setChatsendTime(Timestamp chatsendTime) {
		this.chatsendTime = chatsendTime;
	}

	public String getChatIsRead() {
		return chatIsRead;
	}

	public void setChatIsRead(String chatIsRead) {
		this.chatIsRead = chatIsRead;
	}

	public String getSenderName() {
		return senderName;
	}

	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}

	public String getCroomTitle() {
		return croomTitle;
	}

	public void setCroomTitle(String croomTitle) {
		this.croomTitle = croomTitle;
	}

	@Override
	public String toString() {
		return "Chat [chatNo=" + chatNo + ", croomNo=" + croomNo + ", chatsendNo=" + chatsendNo + ", chatContent="
				+ chatContent + ", chatsendTime=" + chatsendTime + ", chatIsRead=" + chatIsRead + ", senderName="
				+ senderName + "]";
	}
	
	

}
