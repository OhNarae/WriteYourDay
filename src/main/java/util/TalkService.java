package util;

import java.util.List;

import vo.DUserVO;
import vo.MemoSetVO;
import vo.MemoVO;

public interface TalkService {
	
	List<MemoSetVO> getMemoSetList(DUserVO user);
	
	int insertMemoSet(MemoSetVO vo);
	
	int updateMemoSet(MemoSetVO vo);
	
	List<MemoVO> getMemoList(MemoSetVO vo);
	
	MemoVO getMemo(MemoVO vo);
	
	MemoVO insertMemo(MemoVO mvo);

	int updateMemo(MemoVO mvo);
}
