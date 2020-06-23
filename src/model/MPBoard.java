package model;

public class MPBoard {
	private int planno;
	private String id;
	private String title;
	private String detail;
	
	public int getPlanno() {
		return planno;
	}
	public void setPlanno(int planno) {
		this.planno = planno;
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
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	@Override
	public String toString() {
		return "MPBoard [planno=" + planno + ", id=" + id + ", title=" + title + ", detail=" + detail + "]";
	}
}
