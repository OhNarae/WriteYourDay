package vo;

import java.util.List;

public class DEventVO {
	
	int member_seq;
	int event_seq;
	String title;
	String start_date;
	String end_date;
	String color;

	public List<MemoVO> memo_list;
	
	@Override
	public String toString() {
		return "DEventVO [member_seq=" + member_seq + ", event_seq=" + event_seq + ", title=" + title + ", start_date="
				+ start_date + ", end_date=" + end_date + ", color=" + color + "]";
	}

	public int getMember_seq() {
		return member_seq;
	}

	public void setMember_seq(int member_seq) {
		this.member_seq = member_seq;
	}

	public int getEvent_seq() {
		return event_seq;
	}

	public void setEvent_seq(int event_seq) {
		this.event_seq = event_seq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

}
