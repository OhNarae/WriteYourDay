package vo;

public class WMonth {
	
	private String month;//2017.01
	private String direction;
	private String date;//2018.01.01
	
	@Override
	public String toString() {
		return "WMonth [month=" + month + ", direction=" + direction + ", date=" + date + "]";
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDirection() {
		return direction;
	}
	public void setDirection(String direction) {
		this.direction = direction;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
}
