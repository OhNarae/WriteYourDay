package util;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import vo.DUserVO;
import vo.DMemoSetVO;
import vo.DMemoVO;

@Service
public class MemoServiceImpl implements MemoService {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "mappers.memo";
	
	@Override
	public List<DMemoSetVO> getMemoSetList(DUserVO user) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".getMemoSetList", user);
	}

	@Override
	public int insertMemoSet(DMemoSetVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace + ".insertMemoSet", vo);
	}
	
	@Override
	public int updateMemoSet(DMemoSetVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + ".updateMemoSet", vo);
	}

	@Override
	public List<DMemoVO> getMemoList(DMemoSetVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".getMemoList", vo);
	}

	@Override
	public DMemoVO getMemo(DMemoVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".getMemo", vo);
	}

	@Override
	public int insertMemo(DMemoVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace + ".insertMemo", vo);
	}

	@Override
	public int updateMemo(DMemoVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + ".updateMemo", vo);
	}

}
