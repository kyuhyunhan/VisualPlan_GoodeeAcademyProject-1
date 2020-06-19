package model;
import java.util.Date;
public class Board {
	private int btype;
	private int boardno;
	private String id;
	private String title;
	private Date boarddate;
	private String content;
	private int readcnt;
	
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getBoarddate() {
		return boarddate;
	}
	public void setBoarddate(Date boarddate) {
		this.boarddate = boarddate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	@Override
	public String toString() {
		return "Board [btype=" + btype + ", boardno=" + boardno + ", id=" + id + ", title=" + title + ", boarddate="
				+ boarddate + ", content=" + content + ", readcnt=" + readcnt + "]";
	}
}
