package vo;

public class DCashbookVO {

	private int member_seq;
	private int seq;
	private String pay_date;
	private String pay_place;
	private String pay_things;
	private int price;

	@Override
	public String toString() {
		return "DCashbookVO [member_seq=" + member_seq + ", seq=" + seq + ", pay_date=" + pay_date + ", pay_place="
				+ pay_place + ", pay_things=" + pay_things + ", price=" + price + "]";
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

	public String getPay_date() {
		return pay_date;
	}

	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}

	public String getPay_place() {
		return pay_place;
	}

	public void setPay_place(String pay_place) {
		this.pay_place = pay_place;
	}

	public String getPay_things() {
		return pay_things;
	}

	public void setPay_things(String pay_things) {
		this.pay_things = pay_things;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
}
