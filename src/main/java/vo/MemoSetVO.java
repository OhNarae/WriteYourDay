package vo;

public class MemoSetVO {
	
	int member_seq;
	int seq;
	String name;	
	
	@Override
	public String toString() {
		return "MemoSetVO [member_seq=" + member_seq + ", seq=" + seq + ", name=" + name + "]";
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
