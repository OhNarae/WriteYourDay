package util;

import java.util.List;

import vo.DEventVO;
import vo.DUserVO;
import vo.MemoVO;

public interface DiaryService {
	
	List<DEventVO> getEventList(DEventVO event);
	
	DEventVO getEvent(DEventVO event);
	
	int insertEvent(DEventVO event);
}
