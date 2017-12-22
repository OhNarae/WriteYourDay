package bizUtil;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import vo.MemberVO;
import vo.UserVO;

@Service("mservice")
public class MServiceImpl implements MService {

	@Autowired
	@Qualifier("mdao")
	private MemberDAO mDAO;

	public MServiceImpl() {
		System.out.println("MServiceImpl 积己磊");
	}
	
	public MServiceImpl(MemberDAO mDAO) {
		System.out.println("MServiceImpl 积己磊  MemberDAO 林涝 罐扁");
		this.mDAO = mDAO;
	}
	
	/* (non-Javadoc)
	 * @see mService.MService#getMemberList()
	 */
	@Override
	public List<MemberVO> getMemberList() {
		return mDAO.getMemberList();
	}

	/* (non-Javadoc)
	 * @see mService.MService#getMember(vo.MemberVO)
	 */
	@Override
	public MemberVO getMember(MemberVO mvo) {
		return mDAO.getMember(mvo);
	}

	/* (non-Javadoc)
	 * @see mService.MService#loginCheck(vo.UserVO)
	 */
	@Override
	public UserVO loginCheck(UserVO uvo) {
		return mDAO.loginCheck(uvo);
	}

	/* (non-Javadoc)
	 * @see mService.MService#mInert(vo.MemberVO)
	 */
	@Override
	public int mInert(MemberVO mvo) {
		return mDAO.mInert(mvo);
	}

	/* (non-Javadoc)
	 * @see mService.MService#mUpdate(vo.MemberVO)
	 */
	@Override
	public int mUpdate(MemberVO mvo) {
		return mDAO.mUpdate(mvo);
	}

	/* (non-Javadoc)
	 * @see mService.MService#mDelete(vo.UserVO)
	 */
	@Override
	public int mDelete(UserVO uvo) {
		return mDAO.mDelete(uvo);
	}
}
