package com.kh.mohagee.gymBoard.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class GymBoard implements Serializable{
	
	private int bNo;
	private int userNo;
	private String bWriter;
	private String bTitle;
	private String bCategory;
	private String bTag;
	private String bContent;
	private int cNo;
	private int bCount;
	private Date bDate;
	private String bStatus;
	
	
	public GymBoard() {
		super();
		// TODO Auto-generated constructor stub
	}


	public GymBoard(int bNo, int userNo, String bWriter, String bTitle, String bCategory, String bTag, String bContent,
			int cNo, int bCount, Date bDate, String bStatus) {
		super();
		this.bNo = bNo;
		this.userNo = userNo;
		this.bWriter = bWriter;
		this.bTitle = bTitle;
		this.bCategory = bCategory;
		this.bTag = bTag;
		this.bContent = bContent;
		this.cNo = cNo;
		this.bCount = bCount;
		this.bDate = bDate;
		this.bStatus = bStatus;
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


	public String getbWriter() {
		return bWriter;
	}


	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}


	public String getbTitle() {
		return bTitle;
	}


	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}


	public String getbCategory() {
		return bCategory;
	}


	public void setbCategory(String bCategory) {
		this.bCategory = bCategory;
	}


	public String getbTag() {
		return bTag;
	}


	public void setbTag(String bTag) {
		this.bTag = bTag;
	}


	public String getbContent() {
		return bContent;
	}


	public void setbContent(String bContent) {
		this.bContent = bContent;
	}


	public int getcNo() {
		return cNo;
	}


	public void setcNo(int cNo) {
		this.cNo = cNo;
	}


	public int getbCount() {
		return bCount;
	}


	public void setbCount(int bCount) {
		this.bCount = bCount;
	}


	public Date getbDate() {
		return bDate;
	}


	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}


	public String getbStatus() {
		return bStatus;
	}


	public void setbStatus(String bStatus) {
		this.bStatus = bStatus;
	}

	@Override
	public String toString() {
		return "Board [bNo=" + bNo + ", userNo=" + userNo + ", bWriter=" + bWriter + ", bTitle=" + bTitle
				+ ", bCategory=" + bCategory + ", bTag=" + bTag + ", bContent=" + bContent + ", cNo=" + cNo
				+ ", bCount=" + bCount + ", bDate=" + bDate + ", bStatus=" + bStatus + "]";
	}
	
	
	
}
