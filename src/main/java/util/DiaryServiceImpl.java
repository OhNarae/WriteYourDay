package util;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import vo.DEventVO;
import vo.DUserVO;
import vo.MemoSetVO;
import vo.MemoVO;
import vo.TalkVO;

@Service
public class DiaryServiceImpl implements DiaryService {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "mappers.diary";

	@Override
	public List<DEventVO> getEventList(DEventVO event) {
		return sqlSession.selectList(namespace + ".getEventList", event);
	}
	
	@Override
	public DEventVO getEvent(DEventVO event) {

		sqlSession.selectOne(namespace + ".getEvent", event);
		sqlSession.selectList(namespace + ".getEventMemo", event.memo_list);
		return event;
	}


	@Override
	public int insertEvent(DEventVO event) {
		
		return sqlSession.insert(namespace + ".insertEvent", event);
	}
}
