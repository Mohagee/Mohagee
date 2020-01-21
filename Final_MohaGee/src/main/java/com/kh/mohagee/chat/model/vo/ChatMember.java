package com.kh.mohagee.chat.model.vo;

import java.io.Serializable;

public class ChatMember implements Serializable {

	private int chmemno;
	private String id;
	private String room;
	private String priroom;
	
	
	public ChatMember() {
		super();
		// TODO Auto-generated constructor stub
	}


	public ChatMember(int chmemno, String id, String room, String priroom) {
		super();
		this.chmemno = chmemno;
		this.id = id;
		this.room = room;
		this.priroom = priroom;
	}


	public int getChmemno() {
		return chmemno;
	}


	public void setChmemno(int chmemno) {
		this.chmemno = chmemno;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getRoom() {
		return room;
	}


	public void setRoom(String room) {
		this.room = room;
	}


	public String getPriroom() {
		return priroom;
	}


	public void setPriroom(String priroom) {
		this.priroom = priroom;
	}


	@Override
	public String toString() {
		return "ChatMember [chmemno=" + chmemno + ", id=" + id + ", room=" + room + ", priroom=" + priroom + "]";
	}
	
	

}
