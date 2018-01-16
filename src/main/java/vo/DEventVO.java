package vo;

public class DEventVO {

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	int member_seq;
	int seq;
	String name;
	String startdate;
	String enddate;
	int memo_seq;

	@Override
	public String toString() {
		return "DEventVO [member_seq=" + member_seq + ", seq=" + seq + ", name=" + name + ", startdate=" + startdate
				+ ", enddate=" + enddate + ", memo_seq=" + memo_seq + "]";
	}

	public int getMember_seq() {
		return member_seq;
	}

	public void setMember_seq(int member_seq) {
		this.member_seq = member_seq;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public int getMemo_seq() {
		return memo_seq;
	}

	public void setMemo_seq(int memo_seq) {
		this.memo_seq = memo_seq;
	}

}
