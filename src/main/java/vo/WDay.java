package vo;

public class WDay {
	
	int member_seq;
	private String start_date;
	private String end_date;
	
	@Override
	public String toString() {
		return "WDay [member_seq=" + member_seq + ", start_date=" + start_date + ", end_date=" + end_date + "]";
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public int getMember_seq() {
		return member_seq;
	}
	public void setMember_seq(int member_seq) {
		this.member_seq = member_seq;
	}
}
