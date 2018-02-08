package util;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import vo.DMemberVO;
import vo.DMemoSetVO;
import vo.DUserVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "mappers.dmember";

	public MemberServiceImpl() {
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see mService.MService#getMemberList()
	 */
	@Override
	public List<DMemberVO> getMemberList() {
		return sqlSession.selectList(namespace + ".getMemberList");
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
		int cnt;
		cnt = sqlSession.insert(namespace + ".insert", member);
		
		DMemoSetVO vo = new DMemoSetVO();
		vo.setMember_seq(member.getSeq());
		vo.setName("Diary");
		cnt = sqlSession.insert("mappers.memo" + ".insertMemoSet", vo);
		
		return cnt;
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
	
	@Override
	public DUserVO getMemberInfo(DUserVO user) {
		return sqlSession.selectOne(namespace + ".getMemberInfo", user);
	}

	@Override
	public List<DUserVO> searchMemberList(DUserVO user) {
		return sqlSession.selectList(namespace + ".searchMemberList", user);
	}

}
