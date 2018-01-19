package controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import util.MemberService;
import vo.DMemberVO;
import vo.DUserVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private MemberService mService;


	@RequestMapping(value = "/login.do")
	public ModelAndView login(HttpServletRequest request, ModelAndView mav, DUserVO user) {

		if (user == null || user.getId() == null || user.getPassword() == null) {
			HttpSession session = request.getSession(false);
			user = (DUserVO) session.getAttribute("loginInfo");
			if (null != user) {
				mav.setViewName("redirect:month.do");
				return mav; // 로그인 된 상태
			}

			mav.setViewName("main/login");
			return mav;
		}

		// 로그인 확인
		user = mService.loginCheck(user);
		if (user == null) {
			mav.addObject("msg", "login fail");
			mav.setViewName("main/login");
		} else {
			HttpSession session = request.getSession();
			SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date time = new Date();
			time.setTime(session.getCreationTime());
			user.setLoginTime(fmt.format(time));

			session.setAttribute("loginInfo", user);
			mav.setViewName("redirect:month.do");
		}

		return mav;
	}

	@RequestMapping(value = "/join.do")
	public ModelAndView join(HttpServletRequest request, ModelAndView mav, DMemberVO member) {

		if (member == null || member.getId() == null) {
			HttpSession session = request.getSession(false);
			DUserVO user = (DUserVO) session.getAttribute("loginInfo");
			if (null != user) {
				mav.setViewName("redirect:month.do");
				return mav; // 로그인 된 상태
			}

			mav.setViewName("main/join");
			return mav;
		}

		int cnt = mService.insert(member);
		if (cnt > 0) {
			mav.addObject("isJoin", "T");
			mav.addObject("joinID", member.getId());
		} else {
			mav.addObject("isJoin", "F");
		}

		mav.setViewName("redirect:login.do");
		return mav;
	}

	@RequestMapping(value = "/mypage.do")
	public ModelAndView mypage(HttpServletRequest request, ModelAndView mav) {

		HttpSession session = request.getSession(false);
		DUserVO user = (DUserVO) session.getAttribute("loginInfo");
		if (null == user) {
			mav.setViewName("redirect:login.do");
			return mav; // 로그인 된 상태
		}

		DMemberVO userInfo = mService.getMember(user);
		if (userInfo != null) {
			mav.addObject("memberInfo", userInfo);
			mav.setViewName("main/mypage");
		} else {
			mav.setViewName("redirect:login.do");
		}

		return mav;
	}

	@RequestMapping(value = "/update.do")
	public ModelAndView update(HttpServletRequest request, ModelAndView mav, DMemberVO member) {

		HttpSession session = request.getSession(false);
		DUserVO user = (DUserVO) session.getAttribute("loginInfo");
		if (null == user) {
			mav.setViewName("redirect:login.do");
			return mav; // 로그인 된 상태
		}

		int cnt = mService.update(member);
		if (cnt > 0) {
			mav.addObject("memberInfo", member);
			mav.setViewName("redirect:mypage.do");
		} else {
			mav.setViewName("redirect:mypage.do");
		}

		return mav;
	}

	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {

		HttpSession session = request.getSession(false);
		if (null != session)
			session.invalidate();

		return "home";
	}	
}
