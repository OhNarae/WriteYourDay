package util;

import java.util.List;

import vo.DUserVO;

public interface FriendService {
	
	List<DUserVO> getFriendList(DUserVO vo);
	
	int insertFriend(DUserVO me, DUserVO you);
}
