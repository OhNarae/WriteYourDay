package vo;

public class WMonth {
	
	private String month;
	private String direction;
	
	@Override
	public String toString() {
		return "WMonth [month=" + month + ", direction=" + direction + "]";
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

}
