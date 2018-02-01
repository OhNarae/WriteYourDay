package util;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import vo.DCashbookVO;
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
	public List<DEventVO> getEventList(DEventVO event) {
		System.out.println("getEventList DEventVO: " + event.toString());
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
	
	@Override
	public int deleteEvent(DEventVO event) {
		return sqlSession.delete(namespace + ".deleteEvent", event);
	}
	
	@Override
	public List<DEventVO> getCashbookList(WDay days) {
		System.out.println("getCashbookList WDay: " + days.toString());
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
}
