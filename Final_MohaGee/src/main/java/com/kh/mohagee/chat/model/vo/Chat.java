package com.kh.mohagee.chat.model.vo;

import java.io.Serializable;

public class Chat implements Serializable {
	
	private int chatno;
	private String name;
	private String pwd;
	private int totalcount;
	private int remaincount;
	private String content;
	
	
	public Chat() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Chat(int chatno, String name, String pwd, int totalcount, int remaincount, String content) {
		super();
		this.chatno = chatno;
		this.name = name;
		this.pwd = pwd;
		this.totalcount = totalcount;
		this.remaincount = remaincount;
		this.content = content;
	}


	public int getChatno() {
		return chatno;
	}


	public void setChatno(int chatno) {
		this.chatno = chatno;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getPwd() {
		return pwd;
	}


	public void setPwd(String pwd) {
		this.pwd = pwd;
	}


	public int getTotalcount() {
		return totalcount;
	}


	public void setTotalcount(int totalcount) {
		this.totalcount = totalcount;
	}


	public int getRemaincount() {
		return remaincount;
	}


	public void setRemaincount(int remaincount) {
		this.remaincount = remaincount;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	@Override
	public String toString() {
		return "Chat [chatno=" + chatno + ", name=" + name + ", pwd=" + pwd + ", totalcount=" + totalcount
				+ ", remaincount=" + remaincount + ", content=" + content + "]";
	}
	
	

}
