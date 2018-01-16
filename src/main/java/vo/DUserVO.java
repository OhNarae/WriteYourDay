package vo;

public class DUserVO {

	int seq;
	String id;
	String password;
	String loginTime;

	public DUserVO() {}
	
	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}
	
	public DUserVO(String id, String password) {
		this.id = id;
		this.password = password;
	}
	
	public DUserVO(String id, String password, String loginTime) {
		this.id = id;
		this.password = password;
		this.loginTime = loginTime;
	}
	
	@Override
	public String toString() {
		return "DUserVO [seq=" + seq + ", id=" + id + ", password=" + password + ", loginTime=" + loginTime + "]";
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getLoginTime() {
		return loginTime;
	}
	public void setLoginTime(String loginTime) {
		this.loginTime = loginTime;
	}
}
