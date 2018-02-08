package util;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import vo.DCashbookVO;
import vo.DEventShareVO;
import vo.DEventVO;
import vo.DUserVO;
import vo.WDay;
import vo.DMemoSetVO;
import vo.DMemoVO;
import vo.DTalkVO;

@Service
public class DiaryServiceImpl implements DiaryService {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "mappers.diary";

	@Override
	public List<DEventVO> getEventList(WDay wday) {
		return sqlSession.selectList(namespace + ".getEventList", wday);
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
	
	@Override
	public int deleteEvent(DEventVO event) {
		return sqlSession.delete(namespace + ".deleteEvent", event);
	}
	
	@Override
	public List<DEventVO> getCashbookList(WDay days) {
		return sqlSession.selectList(namespace + ".getCashList", days);
	}
	
	@Override
	public int insertCashbook(DCashbookVO cash) {
		return sqlSession.insert(namespace + ".insertCash", cash);
	}
	
	@Override
	public int deleteCashbook(DCashbookVO cash) {
		return sqlSession.delete(namespace + ".deleteCash", cash);
	}
	
	@Override
	public int insertEventShare(DEventShareVO share) {
		return sqlSession.insert(namespace + ".insertEventShare", share);
	}
	
	@Override
	public List<DEventShareVO> getEventShareList(DEventShareVO share) {
		return sqlSession.selectList(namespace + ".getEventShareList", share);
	}
	
	@Override
	public int updateEventShare(DEventShareVO share) {
		return sqlSession.update(namespace + ".updateEventShare", share);
	}

	@Override
	public int copyEvent(DEventShareVO share) {

		int cnt = 0;
		cnt = sqlSession.insert(namespace + ".copyEvent", share);
		cnt = sqlSession.update(namespace + ".updateEventShare", share);
		
		return cnt;
	}
}
