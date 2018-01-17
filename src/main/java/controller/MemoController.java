package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import util.MemoService;
import vo.DUserVO;
import vo.MemoSetVO;
import vo.MemoVO;
import vo.ResultVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MemoController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private MemoService mService;

	@RequestMapping(value = "/memo.do")
	public ModelAndView memo(HttpServletRequest request, ModelAndView mav) {

		HttpSession session = request.getSession(false);
		DUserVO user = (DUserVO) session.getAttribute("loginInfo");
		if (null == user) {
			mav.setViewName("redirect:login.do");
			return mav; // 로그인 된 상태
		}

		mav.setViewName("main/memo");
		return mav;
	}

	@RequestMapping(value = "/memoset/list.do")
	@ResponseBody
	public ResultVO memosetList(HttpServletRequest request) {

		ResultVO out = new ResultVO();
		out.setResult(false);
		
		HttpSession session = request.getSession(false);
		if(session == null) {
			return out;
		}
		
		DUserVO user = (DUserVO) session.getAttribute("loginInfo");
		if (null == user) {
			out.setResultMsg("wrong user");
		} else {

			List<MemoSetVO> memoSet = mService.getMemoSetList(user);
			if (memoSet != null) {
				out.setResult(true);
				out.setmList(memoSet);
			}
		}

		return out;
	}
	
	@RequestMapping(value = "/memoset/update.do", method=RequestMethod.POST)
	@ResponseBody
	public ResultVO memosetUpdate(HttpServletRequest request) {

		ResultVO out = new ResultVO();
		out.setResult(false);
		
		HttpSession session = request.getSession(false);
		if(session == null) {
			return out;
		}
		
		DUserVO user = (DUserVO) session.getAttribute("loginInfo");
		if (null == user) {
			out.setResultMsg("wrong user");
		} else {

			List<MemoSetVO> memoSet = mService.getMemoSetList(user);
			if (memoSet != null) {
				out.setResult(true);
				out.setmList(memoSet);
			}
		}

		return out;
	}
	
	@RequestMapping(value = "/memo/list.do")
	@ResponseBody
	public ResultVO memoList(HttpServletRequest request, MemoSetVO msVO) {

		ResultVO out = new ResultVO();
		out.setResult(false);
		
		HttpSession session = request.getSession(false);
		if(session == null) {
			return out;
		}
		
		DUserVO user = (DUserVO) session.getAttribute("loginInfo");
		if (null == user) {
			out.setResultMsg("wrong user");
		} else {
			msVO.setMember_seq(user.getSeq());
			List<MemoVO> memoSet = mService.getMemoList(msVO);
			if (memoSet != null) {
				out.setResult(true);
				out.setmList(memoSet);
			}
		}
		return out;
	}
	
	@RequestMapping(value = "/memo/update.do")
	@ResponseBody
	public ResultVO memoUpdate(HttpServletRequest request, MemoSetVO msVO) {

		ResultVO out = new ResultVO();
		out.setResult(false);
		
		HttpSession session = request.getSession(false);
		if(session == null) {
			return out;
		}
		
		DUserVO user = (DUserVO) session.getAttribute("loginInfo");
		if (null == user) {
			out.setResultMsg("wrong user");
		} else {
			msVO.setMember_seq(user.getSeq());
			List<MemoVO> memoSet = mService.getMemoList(msVO);
			if (memoSet != null) {
				out.setResult(true);
				out.setmList(memoSet);
			}
		}
		return out;
	}
}
