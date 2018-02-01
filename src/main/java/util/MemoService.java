package util;

import java.util.List;

import vo.DUserVO;
import vo.DMemoSetVO;
import vo.DMemoVO;

public interface MemoService {
	
	int MEMO_SET_DIARY = 1;
	
	List<DMemoSetVO> getMemoSetList(DUserVO user);
	
	int insertMemoSet(DMemoSetVO vo);
	
	int updateMemoSet(DMemoSetVO vo);
	
	List<DMemoVO> getMemoList(DMemoSetVO vo);
	
	DMemoVO getMemo(DMemoVO vo);
	
	int insertMemo(DMemoVO mvo);

	int updateMemo(DMemoVO mvo);
}
