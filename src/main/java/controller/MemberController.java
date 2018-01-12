/*package controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import util.MService;
import vo.MemberVO;
import vo.UserVO;


@Controller
public class MemberController {
	
	@Autowired
	private MService mDAO;
	
	@RequestMapping(value="/mlist.do")
	public ModelAndView mlist(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) throws Exception {
	
		List<MemberVO> mList= mDAO.getMemberList();
		mav.addObject("orange", mList);
		
		mav.setViewName("mvcMember/memberList");
		return mav;
	}
	
	@RequestMapping(value="/mdelete.do")
	public ModelAndView mdelete(HttpServletRequest request, HttpServletResponse response, ModelAndView mav, UserVO uvo) throws Exception {

		if (uvo == null  || uvo.getId() == null) {
			HttpSession session = request.getSession(false);
			uvo = (UserVO) session.getAttribute("loginInfo");
		} 

		if (uvo == null) {
			mav.setViewName("");
		} else {
			int cnt = mDAO.mDelete(uvo);
			if (cnt > 0) {
				mav.addObject("isDelete", "T");
				mav.addObject("cnt", cnt);
				mav.addObject("deleteID", uvo.getId());
			} else {
				mav.addObject("isDelete", "F");
			}

			mav.setViewName("mvcMember/mDeleteFinish");
		}
		return mav;
	}
	
	@RequestMapping(value="/mdetail.do")
	public ModelAndView mdetail(HttpServletRequest request, HttpServletResponse response, ModelAndView mav, UserVO uvo) throws Exception {
//		UserVO uvo;
//		String id = request.getParameter("id");
		if (uvo == null || uvo.getId() == null) {
			HttpSession session = request.getSession(false);
			uvo = (UserVO) session.getAttribute("loginInfo");
		}
		
		
		if(uvo==null) {
			mav.setViewName("");
		}else {
			MemberVO mvo = new MemberVO();
			mvo.setId(uvo.getId());
			
			mvo = mDAO.getMember(mvo);
			
			mav.addObject("orange", mvo);
			mav.setViewName("mvcMember/mDetailView");
		}
		
		return mav;
	}
	
	@RequestMapping(value="/mjoin.do")
	public ModelAndView mjoin(HttpServletRequest request, HttpServletResponse response, ModelAndView mav, MemberVO mvo) throws Exception {
//		MemberVO mvo = new MemberVO();
//		mvo.setId(request.getParameter("id"));
//		mvo.setPassword(request.getParameter("password"));
//		mvo.setName(request.getParameter("name"));
//		mvo.setLev(request.getParameter("lev"));
//		mvo.setBirthd(request.getParameter("birthd"));
//		mvo.setPoint(Integer.parseInt(request.getParameter("point")));
//		mvo.setWeight(Float.parseFloat(request.getParameter("weight")));
		
		
		int cnt = mDAO.mInert(mvo);
		if(cnt > 0) {
			mav.addObject("isJoin", "T");
			mav.addObject("cnt", cnt);
			mav.addObject("joinID", mvo.getId());
		}else {
			mav.addObject("isJoin", "F");
		}
		
		mav.setViewName("redirect:mlist.do");
		return mav;
	}
	
	@RequestMapping(value="/mupdate.do")
	public ModelAndView mupdate(HttpServletRequest request, HttpServletResponse response, ModelAndView mav, MemberVO mvo) throws Exception {
		
		HttpSession session = request.getSession(false);
		UserVO uvo = (UserVO) session.getAttribute("loginInfo");
		if (uvo == null) {
			mav.setViewName("");
		} else {
//			MemberVO mvo = new MemberVO();
//			mvo.setId(uvo.getId());
//			mvo.setPassword(uvo.getPassword());
//			mvo.setName(request.getParameter("name"));
//			mvo.setLev(request.getParameter("lev"));
//			mvo.setBirthd(request.getParameter("birthd"));
//			mvo.setPoint(Integer.parseInt(request.getParameter("point")));
//			mvo.setWeight(Float.parseFloat(request.getParameter("weight")));

			
			int cnt = mDAO.mUpdate(mvo);
			if (cnt > 0) {
				mav.addObject("isUpdate", "T");
				mav.addObject("cnt", cnt);
				mav.addObject("updateID", mvo.getId());
			} else {
				mav.addObject("isJoin", "F");
			}

			mav.setViewName("mvcMember/mUpdateFinish");
		}
		
		return mav;
	}
	
	@RequestMapping(value="/mlogin.do")
	public ModelAndView mlogin(HttpServletRequest request, HttpServletResponse response, ModelAndView mav, UserVO uvo) throws Exception {
		uvo = mDAO.loginCheck(uvo);
		if (uvo ==null) {
			mav.setViewName("mvcLogin/login_fail");
		}else {
			HttpSession session = request.getSession() ;
			
			Date time = new Date(session.getCreationTime());
			SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");				
			uvo.setLoginTime(fmt.format(time));
			session.setAttribute("loginInfo", uvo);

			mav.setViewName("mvcLogin/login_success");
		}		
		
		return mav;
	}
	
}
*/