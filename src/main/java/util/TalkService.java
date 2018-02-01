package util;

import java.util.List;
import vo.DTalkVO;

public interface TalkService {
	
	List<DTalkVO> getTalkList(DTalkVO vo);
	
	int insertTalk(DTalkVO vo);
}
