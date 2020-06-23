package model;

import java.util.Date;

public class Reply {
	private int btype;
	private int boardno;
	private int replyno;
	private String id;
	private String comment;
	private Date replydate;
	
	public int getBtype() {
		return btype;
	}
	public void setBtype(int btype) {
		this.btype = btype;
	}
	public int getBoardno() {
		return boardno;
	}
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}
	public int getReplyno() {
		return replyno;
	}
	public void setReplyno(int replyno) {
		this.replyno = replyno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getReplydate() {
		return replydate;
	}
	public void setReplydate(Date replydate) {
		this.replydate = replydate;
	}
	@Override
	public String toString() {
		return "Reply [btype=" + btype + ", boardno=" + boardno + ", replyno=" + replyno + ", id=" + id + ", comment="
				+ comment + ", replydate=" + replydate + "]";
	}
}
