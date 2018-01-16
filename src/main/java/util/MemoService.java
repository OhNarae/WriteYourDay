package util;

import java.util.List;

import vo.DUserVO;
import vo.MemoSetVO;
import vo.MemoVO;

public interface MemoService {
	
	List<MemoSetVO> getMemoSetList(DUserVO user);
	
	int insertMemoSet(MemoSetVO vo);
	
	List<MemoVO> getMemoList(MemoSetVO vo);
	
	MemoVO getMemo(MemoVO vo);
	
	int insertMemo(MemoVO mvo);

	int updateMemo(MemoVO mvo);
}
