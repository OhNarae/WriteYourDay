package util;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import vo.DUserVO;
import vo.MemoSetVO;
import vo.MemoVO;

@Service
public class MemoServiceImpl implements MemoService {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "mappers.memo";
	
	@Override
	public List<MemoSetVO> getMemoSetList(DUserVO user) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".getMemoSetList", user);
	}

	@Override
	public int insertMemoSet(MemoSetVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace + ".insertMemoSet", vo);
	}

	@Override
	public List<MemoVO> getMemoList(MemoSetVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".getMemoList", vo);
	}

	@Override
	public MemoVO getMemo(MemoVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".getMemo", vo);
	}

	@Override
	public int insertMemo(MemoVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace + ".insertMemo", vo);
	}

	@Override
	public int updateMemo(MemoVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + ".updateMemo", vo);
	}

}
