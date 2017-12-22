
package bizUtil;

import java.util.List;

import vo.MemberVO;
import vo.UserVO;

public interface MService {

	List<MemberVO> getMemberList();

	MemberVO getMember(MemberVO mvo);

	UserVO loginCheck(UserVO uvo);

	int mInert(MemberVO mvo);

	int mUpdate(MemberVO mvo);

	int mDelete(UserVO uvo);

}