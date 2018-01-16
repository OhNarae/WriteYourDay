package vo;

public class MemoVO {
	
	int set_seq;
	int seq;
	String name;
	String contents;
	
	@Override
	public String toString() {
		return "MemoVO [set_seq=" + set_seq + ", seq=" + seq + ", name=" + name + ", contents=" + contents + "]";
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
