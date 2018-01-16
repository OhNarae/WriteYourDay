
package util;

import java.util.List;

import vo.DMemberVO;
import vo.DUserVO;

public interface MemberService {

	List<DMemberVO> getMemberList();

	DMemberVO getMember(DUserVO mvo);

	DUserVO loginCheck(DUserVO uvo);

	int insert(DMemberVO mvo);

	int update(DMemberVO mvo);

	int delete(DUserVO uvo);

	int idCheck(DMemberVO mvo);
}