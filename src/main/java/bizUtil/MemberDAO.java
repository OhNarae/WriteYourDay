package bizUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import vo.MemberVO;
import vo.UserVO;

@Repository("mdao")
public class MemberDAO {
	private Connection CN;
	private PreparedStatement PST;
	private ResultSet RS;
	
	// JDBC ���� ����
	public List<MemberVO> getMemberList() {
		List<MemberVO> mlist = null;

		String sql = "select * from member"; // All ������� >= ���
		try {
			CN = JDBCUtil.getConnection();
			PST = CN.prepareStatement(sql);
			RS = PST.executeQuery();
			if (RS.next()) {
				mlist = new ArrayList<>();
				do {
					MemberVO memberVO = new MemberVO();
					memberVO.setId(RS.getString("id"));
					memberVO.setPassword(RS.getString("password"));
					memberVO.setName(RS.getString("name"));
					memberVO.setLev(RS.getString("lev"));
					memberVO.setBirthd(RS.getString("birthd"));
					memberVO.setPoint(RS.getInt("point"));
					memberVO.setWeight(RS.getFloat("weight"));

					mlist.add(memberVO);
				} while (RS.next());
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally { JDBCUtil.close(RS,  PST, CN); }

		return mlist;
	}

	public MemberVO getMember(MemberVO mvo) {
		MemberVO memberVO = null;

		String sql = "select * from member where id = ?"; // All ������� >= ���
		try {
			CN = JDBCUtil.getConnection();
			PST = CN.prepareStatement(sql);
			PST.setString(1, mvo.getId());
			
			RS = PST.executeQuery();
			if (RS.next()) {				
				memberVO = new MemberVO();
				memberVO.setId(RS.getString("id"));
				memberVO.setPassword(RS.getString("password"));
				memberVO.setName(RS.getString("name"));
				memberVO.setLev(RS.getString("lev"));
				memberVO.setBirthd(RS.getString("birthd"));
				memberVO.setPoint(RS.getInt("point"));
				memberVO.setWeight(RS.getFloat("weight"));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally { JDBCUtil.close(RS,  PST, CN); }

		return memberVO;
	}

	public UserVO loginCheck(UserVO uvo) {

		String sql = "select * from member where id = ? and password = ?"; // All ������� >= ���
		try {
			CN = JDBCUtil.getConnection();
			PST = CN.prepareStatement(sql);
			PST.setString(1, uvo.getId());
			PST.setString(2, uvo.getPassword());
			
			RS = PST.executeQuery();
			if (RS.next()) {				
				uvo.setId(RS.getString("id"));
				uvo.setPassword(RS.getString("password"));
				uvo.setLev(RS.getString("lev"));
			}else {
				uvo =null;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally { JDBCUtil.close(RS,  PST, CN); }

		return uvo;
	}

	public int mInert(MemberVO mvo) {
		int cnt = 0;
		
		String sql = "insert into member values(?, ?, ?, ?, ?, ?, ?)";
		try {
			CN = JDBCUtil.getConnection();
			PST = CN.prepareStatement(sql);
			PST.setString(1, mvo.getId());
			PST.setString(2, mvo.getPassword());
			PST.setString(3, mvo.getName());
			PST.setString(4, mvo.getLev());
			PST.setString(5, mvo.getBirthd());			
			PST.setInt(6, mvo.getPoint());
			PST.setFloat(7, mvo.getWeight());

			cnt = PST.executeUpdate();
			if (cnt > 0) {
				System.out.println(cnt + "���� �ڷᰡ ����Ǿ����ϴ�. ");
			} else {
				System.out.println("*** ����� �ڷᰡ �����ϴ�. ");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(PST, CN);
		}

		return cnt;
	}

	//�����ʿ���
	public int mUpdate(MemberVO mvo) {
		int cnt = 0;

		String sql = "update member set password = ?, name = ?, lev = ?, birthd = ?, point = ?, weight = ? where id = ?";
		try {
			CN = JDBCUtil.getConnection();
			PST = CN.prepareStatement(sql);
			PST.setString(1, mvo.getPassword());
			PST.setString(2, mvo.getName());
			PST.setString(3, mvo.getLev());
			PST.setString(4, mvo.getBirthd());			
			PST.setInt(5, mvo.getPoint());
			PST.setFloat(6, mvo.getWeight());
			PST.setString(7, mvo.getId());

			cnt = PST.executeUpdate();
			if (cnt > 0) {
				System.out.println("*** ������ �����Ͽ����ϴ�. ");
			} else {
				System.out.println("*** ������ �ڷᰡ �����ϴ�. ");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(PST, CN);
		}

		return cnt;
	}

	public int mDelete(UserVO uvo) {
		int cnt = 0;
		
		String sql = "delete member where id = ?";
		try {
			CN = JDBCUtil.getConnection();
			PST = CN.prepareStatement(sql);
			PST.setString(1, uvo.getId());

			cnt = PST.executeUpdate();
			if (cnt > 0) {
				System.out.println("*** ������ �����Ͽ����ϴ�. ");
			} else {
				System.out.println("*** ������ �ڷᰡ �����ϴ�. ");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(PST, CN);
		}

		return cnt;
	}
}
