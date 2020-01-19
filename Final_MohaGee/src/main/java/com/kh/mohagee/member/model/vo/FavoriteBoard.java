package com.kh.mohagee.member.model.vo;

import java.sql.Date;

public class FavoriteBoard {
	
	private int bNo;
	private int userNo;
	private String bTitle;
	private String bTag;
	private String bContent;
	private int cNo;
	private String bUrl;
	private String bCategory;
	private int bCount;
	private Date bDate;
	private String titleFilename;
	private String bFileType;
	
	public FavoriteBoard() {
		super();
	}

	public FavoriteBoard(int bNo, int userNo, String bTitle, String bTag, String bContent, int cNo, String bUrl,
			String bCategory, int bCount, Date bDate, String titleFilename, String bFileType) {
		super();
		this.bNo = bNo;
		this.userNo = userNo;
		this.bTitle = bTitle;
		this.bTag = bTag;
		this.bContent = bContent;
		this.cNo = cNo;
		this.bUrl = bUrl;
		this.bCategory = bCategory;
		this.bCount = bCount;
		this.bDate = bDate;
		this.titleFilename = titleFilename;
		this.bFileType = bFileType;
	}

	@Override
	public String toString() {
		return "FavoriteBoard [bNo=" + bNo + ", userNo=" + userNo + ", bTitle=" + bTitle + ", bTag=" + bTag
				+ ", bContent=" + bContent + ", cNo=" + cNo + ", bUrl=" + bUrl + ", bCategory=" + bCategory
				+ ", bCount=" + bCount + ", bDate=" + bDate + ", titleFilename=" + titleFilename + ", bFileType="
				+ bFileType + "]";
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

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
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

	public String getbUrl() {
		return bUrl;
	}

	public void setbUrl(String bUrl) {
		this.bUrl = bUrl;
	}

	public String getbCategory() {
		return bCategory;
	}

	public void setbCategory(String bCategory) {
		this.bCategory = bCategory;
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

	public String getTitleFilename() {
		return titleFilename;
	}

	public void setTitleFilename(String titleFilename) {
		this.titleFilename = titleFilename;
	}

	public String getbFileType() {
		return bFileType;
	}

	public void setbFileType(String bFileType) {
		this.bFileType = bFileType;
	}

}