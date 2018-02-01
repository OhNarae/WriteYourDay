package util;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import vo.DUserVO;
import vo.DMemoSetVO;
import vo.DMemoVO;
import vo.DTalkVO;

@Service
public class TalkServiceImpl implements TalkService {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "mappers.dtalk";

	@Override
	public List<DTalkVO> getTalkList(DTalkVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".getTalkList", vo);
	}

	@Override
	public int insertTalk(DTalkVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace + ".insertTalk", vo);
	}
}
