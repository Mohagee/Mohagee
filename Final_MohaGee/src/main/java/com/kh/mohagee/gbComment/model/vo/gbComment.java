package com.kh.mohagee.gbComment.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class gbComment implements Serializable{

	private int bcNo;
	private int bNo;
	private int userNo;
	private String bcContent;
	private Date bcDate;
	private String bcStatus;
	private int bbcNo;
	
	public gbComment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public gbComment(int bcNo, int bNo, int userNo, String bcContent, Date bcDate, String bcStatus, int bbcNo) {
		super();
		this.bcNo = bcNo;
		this.bNo = bNo;
		this.userNo = userNo;
		this.bcContent = bcContent;
		this.bcDate = bcDate;
		this.bcStatus = bcStatus;
		this.bbcNo = bbcNo;
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

	public int getBbcNo() {
		return bbcNo;
	}

	public void setBbcNo(int bbcNo) {
		this.bbcNo = bbcNo;
	}

	@Override
	public String toString() {
		return "GymBoardComment [bcNo=" + bcNo + ", bNo=" + bNo + ", userNo=" + userNo + ", bcContent=" + bcContent
				+ ", bcDate=" + bcDate + ", bcStatus=" + bcStatus + ", bbcNo=" + bbcNo + "]";
	}
	
	
}
