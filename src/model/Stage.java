package model;

public class Stage {
	private int planno;
	private int stageno;
	private String stagetitle;
	private int percentage;
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
	public String getStagetitle() {
		return stagetitle;
	}
	public void setStagetitle(String stagetitle) {
		this.stagetitle = stagetitle;
	}
	public int getPercentage() {
		return percentage;
	}
	public void setPercentage(int percentage) {
		this.percentage = percentage;
	}
	@Override
	public String toString() {
		return "Stage [planno=" + planno + ", stageno=" + stageno + ", stagetitle=" + stagetitle + ", percentage="
				+ percentage + "]";
	}
}
