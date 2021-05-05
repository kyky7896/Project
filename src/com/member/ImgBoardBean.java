package com.member;

public class ImgBoardBean {
	
	private int num;
	private String subject;
	private String savefilename;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getSavefilename() {
		return savefilename;
	}
	public void setSavefilename(String savefilename) {
		this.savefilename = savefilename;
	}
	@Override
	public String toString() {
		return "ImgBoardBean [num=" + num + ", subject=" + subject + ", savefilename=" + savefilename + "]";
	}
	
	

}
