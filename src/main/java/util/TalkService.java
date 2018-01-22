package util;

import java.util.List;
import vo.TalkVO;

public interface TalkService {
	
	List<TalkVO> getTalkList(TalkVO vo);
	
	int insertTalk(TalkVO vo);
}
