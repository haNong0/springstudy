package com.lec.board;

public class Board {
	
	

	private int bno;
	private String subject;
	private String writer;
	private String crtdate;
	private int readcnt;
	private String content;
	
	
	
	
	public Board() {
		
		this.bno = 0;
		this.subject = null;
		this.writer = null;
		this.crtdate = null;
		this.readcnt = 0;
		this.content = null;
	}




	public int getBno() {
		return bno;
	}




	public void setBno(int bno) {
		this.bno = bno;
	}




	public String getSubject() {
		return subject;
	}




	public void setSubject(String subject) {
		this.subject = subject;
	}




	public String getWriter() {
		return writer;
	}




	public void setWriter(String writer) {
		this.writer = writer;
	}




	public String getCrtdate() {
		return crtdate;
	}




	public void setCrtdate(String crtdate) {
		this.crtdate = crtdate;
	}




	public int getReadcnt() {
		return readcnt;
	}




	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}




	public String getContent() {
		return content;
	}




	public void setContent(String content) {
		this.content = content;
	}




	@Override
	public String toString() {
		return "Board [bno=" + bno + ", subject=" + subject + ", writer=" + writer + ", crtdate=" + crtdate
				+ ", readcnt=" + readcnt + ", content=" + content + "]";
	} 
	
	
	
}

