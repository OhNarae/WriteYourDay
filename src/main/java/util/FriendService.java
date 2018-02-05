package util;

import java.util.List;

import vo.DFriendVO;
import vo.DUserVO;

public interface FriendService {
	
	List<DUserVO> getFriendList(DUserVO vo);
	
	int insertFriend(DUserVO me, DUserVO you);
	
	DFriendVO getFriend(DFriendVO vo);
}
