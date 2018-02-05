package vo;

public class DEventShareVO {
	
	int member_seq;
	int event_seq;
	int you_member_seq;
	int status;// 0:요청, 1:승낙, 2:거절, 3:취소
	String req_date;
	String resp_date;
	String cancle_date;
	
	String member_id;//요청한 ID
	String event_title;//이벤트 타이틀
	
	@Override
	public String toString() {
		return "DEventShareVO [member_seq=" + member_seq + ", event_seq=" + event_seq + ", you_member_seq="
				+ you_member_seq + ", status=" + status + ", req_date=" + req_date + ", resp_date=" + resp_date
				+ ", cancle_date=" + cancle_date + ", member_id=" + member_id + ", event_title=" + event_title + "]";
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
	public int getYou_member_seq() {
		return you_member_seq;
	}
	public void setYou_member_seq(int you_member_seq) {
		this.you_member_seq = you_member_seq;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getReq_date() {
		return req_date;
	}
	public void setReq_date(String req_date) {
		this.req_date = req_date;
	}
	public String getResp_date() {
		return resp_date;
	}
	public void setResp_date(String resp_date) {
		this.resp_date = resp_date;
	}
	public String getCancle_date() {
		return cancle_date;
	}
	public void setCancle_date(String cancle_date) {
		this.cancle_date = cancle_date;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getEvent_title() {
		return event_title;
	}
	public void setEvent_title(String event_title) {
		this.event_title = event_title;
	}
}
