package com.kh.mohagee.chat.model.vo;

public class ChatRoom {
	
	private int croomIndex;
	private int croomNo;
	private int userNo;
	private String croomTitle;
	
	
	public ChatRoom() {
		super();
		// TODO Auto-generated constructor stub
	}


	public ChatRoom(int croomIndex, int croomNo, int userNo, String croomTitle) {
		super();
		this.croomIndex = croomIndex;
		this.croomNo = croomNo;
		this.userNo = userNo;
		this.croomTitle = croomTitle;
	}


	public int getCroomIndex() {
		return croomIndex;
	}


	public void setCroomIndex(int croomIndex) {
		this.croomIndex = croomIndex;
	}


	public int getCroomNo() {
		return croomNo;
	}


	public void setCroomNo(int croomNo) {
		this.croomNo = croomNo;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public String getCroomTitle() {
		return croomTitle;
	}


	public void setCroomTitle(String croomTitle) {
		this.croomTitle = croomTitle;
	}


	@Override
	public String toString() {
		return "ChatRoom [croomIndex=" + croomIndex + ", croomNo=" + croomNo + ", userNo=" + userNo + ", croomTitle="
				+ croomTitle + "]";
	}
	
	

}
