package vo;

public class DMemoVO {
	
	int member_seq;
	int set_seq;
	int seq;
	String name;
	String contents;
	
	public DMemoVO() {
		contents="";
	}
	
	@Override
	public String toString() {
		return "MemoVO [member_seq=" + member_seq + ", set_seq=" + set_seq + ", seq=" + seq + ", name=" + name + ", contents=" + contents + "]";
	}
	public int getMember_seq() {
		return member_seq;
	}
	public void setMember_seq(int member_seq) {
		this.member_seq = member_seq;
	}
	public int getSet_seq() {
		return set_seq;
	}
	public void setSet_seq(int set_seq) {
		this.set_seq = set_seq;
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
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
}
