package model;

public class ToDo {
	private int planno;
	private int stageno;
	private int no;
	private String item;
	private boolean checked;
	public int getPlanno() {
		return planno;
	}
	public void setPlanno(int planno) {
		this.planno = planno;
	}
	public int getStageno() {
		return stageno;
	}
	public void setStageno(int stageno) {
		this.stageno = stageno;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	@Override
	public String toString() {
		return "ToDo [planno=" + planno + ", stageno=" + stageno + ", no=" + no + ", item=" + item + ", checked="
				+ checked + "]";
	}
	
}
