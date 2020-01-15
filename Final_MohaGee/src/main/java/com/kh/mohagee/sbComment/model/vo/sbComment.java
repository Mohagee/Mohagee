package com.kh.mohagee.sbComment.model.vo;

import java.sql.Date;

public class sbComment {
	
	private int bcNo;
	private int bNo;
	private int userNo;
	private String bcContent;
	private Date bcDate;
	private String bcStatus;
	private int bbCno;
	
	
	public sbComment() {
		super();
	}


	public sbComment(int bcNo, int bNo, int userNo, String bcContent, Date bcDate, String bcStatus, int bbCno) {
		super();
		this.bcNo = bcNo;
		this.bNo = bNo;
		this.userNo = userNo;
		this.bcContent = bcContent;
		this.bcDate = bcDate;
		this.bcStatus = bcStatus;
		this.bbCno = bbCno;
	}


	public int getBcNo() {
		return bcNo;
	}


	public void setBcNo(int bcNo) {
		this.bcNo = bcNo;
	}


	public int getbNo() {
		return bNo;
	}


	public void setbNo(int bNo) {
		this.bNo = bNo;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public String getBcContent() {
		return bcContent;
	}


	public void setBcContent(String bcContent) {
		this.bcContent = bcContent;
	}


	public Date getBcDate() {
		return bcDate;
	}


	public void setBcDate(Date bcDate) {
		this.bcDate = bcDate;
	}


	public String getBcStatus() {
		return bcStatus;
	}


	public void setBcStatus(String bcStatus) {
		this.bcStatus = bcStatus;
	}


	public int getBbCno() {
		return bbCno;
	}


	public void setBbCno(int bbCno) {
		this.bbCno = bbCno;
	}


	@Override
	public String toString() {
		return "sbComment [bcNo=" + bcNo + ", bNo=" + bNo + ", userNo=" + userNo + ", bcContent=" + bcContent
				+ ", bcDate=" + bcDate + ", bcStatus=" + bcStatus + ", bbCno=" + bbCno + "]";
	}
	
	
}
