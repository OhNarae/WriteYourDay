package util;

import java.util.List;

import vo.DCashbookVO;
import vo.DEventVO;
import vo.DUserVO;
import vo.WDay;
import vo.DMemoVO;

public interface DiaryService {
	
	List<DEventVO> getEventList(DEventVO event);
	
	DEventVO getEvent(DEventVO event);
	
	int insertEvent(DEventVO event);
	
	int deleteEvent(DEventVO event);
	
	List<DEventVO> getCashbookList(WDay days);
	
	int insertCashbook(DCashbookVO cash);
	
	int deleteCashbook(DCashbookVO cash);
}
