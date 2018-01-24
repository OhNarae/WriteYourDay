package util;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import vo.DUserVO;
import vo.MemoSetVO;
import vo.MemoVO;
import vo.TalkVO;

@Service
public class FriendServiceImpl implements FriendService {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "mappers.dfriend";

	@Override
	public List<DUserVO> getFriendList(DUserVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".getFriendList", vo);
	}

	@Override
	public int insertFriend(DUserVO me, DUserVO you) {
		
		HashMap<String, DUserVO> input = new HashMap<String, DUserVO>();
		input.put("me", me);
		input.put("you", you);
		
		return sqlSession.insert(namespace + ".insert", input);
	}
}
