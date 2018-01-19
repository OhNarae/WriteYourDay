package vo;

public class FriendVO {

	private int friend_seq;
	private int me_member_seq;
	private int you_member_seq;
	private String create_date;

	@Override
	public String toString() {
		return "FriendVO [friend_seq=" + friend_seq + ", me_member_seq=" + me_member_seq + ", you_member_seq="
				+ you_member_seq + ", create_date=" + create_date + "]";
	}

	public int getFriend_seq() {
		return friend_seq;
	}

	public void setFriend_seq(int friend_seq) {
		this.friend_seq = friend_seq;
	}

	public int getMe_member_seq() {
		return me_member_seq;
	}

	public void setMe_member_seq(int me_member_seq) {
		this.me_member_seq = me_member_seq;
	}

	public int getYou_member_seq() {
		return you_member_seq;
	}

	public void setYou_member_seq(int you_member_seq) {
		this.you_member_seq = you_member_seq;
	}

	public String getCreate_date() {
		return create_date;
	}

	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}

}
