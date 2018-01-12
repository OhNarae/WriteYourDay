package util;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import vo.DMemberVO;
import vo.DUserVO;

@Service
public class MServiceImpl implements MService {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "mappers.dmember";

	public MServiceImpl() {
		System.out.println("MServiceImpl 생성");
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see mService.MService#getMemberList()
	 */
	@Override
	public List<DMemberVO> getMemberList() {
		return sqlSession.selectList(namespace + ".memberList");
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see mService.MService#getMember(vo.MemberVO)
	 */
	@Override
	public DMemberVO getMember(DUserVO user) {
		return sqlSession.selectOne(namespace + ".getMember", user);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see mService.MService#loginCheck(vo.UserVO)
	 */
	@Override
	public DUserVO loginCheck(DUserVO user) {
		return sqlSession.selectOne(namespace + ".loginCheck", user);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see mService.MService#mInert(vo.MemberVO)
	 */
	@Override
	public int insert(DMemberVO member) {
		return sqlSession.insert(namespace + ".insert", member);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see mService.MService#mUpdate(vo.MemberVO)
	 */
	@Override
	public int update(DMemberVO member) {
		return sqlSession.update(namespace + ".update", member);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see mService.MService#mDelete(vo.UserVO)
	 */
	@Override
	public int delete(DUserVO user) {
		return sqlSession.delete(namespace + ".delete", user);
	}

	@Override
	public int idCheck(DMemberVO member) {
		return (int) sqlSession.selectOne(namespace + ".idCheck", member);
	}

}
