package com.kh.mohagee.showBoard.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class ShowBoard implements Serializable {

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
	   private String bStatus;
	   
	   private int bFileno;
	   private int rm;
	   
	   
	public ShowBoard() {
		super();
	}


	public ShowBoard(int bNo, int userNo, String bTitle, String bTag, String bContent, int cNo, String bUrl,
			String bCategory, int bCount, Date bDate, String titleFilename, String bFileType, String bStatus,
			int bFileno, int rm) {
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
		this.bStatus = bStatus;
		this.bFileno = bFileno;
		this.rm = rm;
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


	public String getbStatus() {
		return bStatus;
	}


	public void setbStatus(String bStatus) {
		this.bStatus = bStatus;
	}


	public int getbFileno() {
		return bFileno;
	}


	public void setbFileno(int bFileno) {
		this.bFileno = bFileno;
	}


	public int getRm() {
		return rm;
	}


	public void setRm(int rm) {
		this.rm = rm;
	}


	@Override
	public String toString() {
		return "ShowBoard [bNo=" + bNo + ", userNo=" + userNo + ", bTitle=" + bTitle + ", bTag=" + bTag + ", bContent="
				+ bContent + ", cNo=" + cNo + ", bUrl=" + bUrl + ", bCategory=" + bCategory + ", bCount=" + bCount
				+ ", bDate=" + bDate + ", titleFilename=" + titleFilename + ", bFileType=" + bFileType + ", bStatus="
				+ bStatus + ", bFileno=" + bFileno + ", rm=" + rm + "]";
	}

	
}
