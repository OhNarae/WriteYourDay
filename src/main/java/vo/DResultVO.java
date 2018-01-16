package vo;

import java.util.List;

public class DResultVO {
	List<DMemberVO> mList;
	Boolean result;
	String resultMsg;

	public List<DMemberVO> getmList() {
		return mList;
	}

	public void setmList(List<DMemberVO> mList) {
		this.mList = mList;
	}

	public Boolean getResult() {
		return result;
	}

	public void setResult(Boolean result) {
		this.result = result;
	}

	public String getResultMsg() {
		return resultMsg;
	}

	public void setResultMsg(String resultMsg) {
		this.resultMsg = resultMsg;
	}

}
