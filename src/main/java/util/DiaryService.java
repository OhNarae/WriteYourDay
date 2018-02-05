package util;

import java.util.List;

import vo.DCashbookVO;
import vo.DEventShareVO;
import vo.DEventVO;
import vo.DUserVO;
import vo.WDay;
import vo.DMemoVO;

public interface DiaryService {
	
	//0:요청, 1:승낙, 2:거절, 3:취소
	int EVENTSHARE_STATUS_REQ = 0;
	int EVENTSHARE_STATUS_OK = 1;
	int EVENTSHARE_STATUS_REJECT = 2;
	int EVENTSHARE_STATUS_CANCEL = 3;
	
	List<DEventVO> getEventList(WDay wday);
	
	DEventVO getEvent(DEventVO event);
	
	int insertEvent(DEventVO event);
	
	int deleteEvent(DEventVO event);
	
	List<DEventVO> getCashbookList(WDay days);
	
	int insertCashbook(DCashbookVO cash);
	
	int deleteCashbook(DCashbookVO cash);
	
	int insertEventShare(DEventShareVO share);
	
	List<DEventShareVO> getEventShareList(DEventShareVO share);
	
	int updateEventShare(DEventShareVO share);
	
	int copyEvent(DEventShareVO share);
}
