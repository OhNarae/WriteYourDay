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
import vo.DMemoSetVO;
import vo.DMemoVO;
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

		mav.setViewName("main/memo");
		return mav;
	}

	@RequestMapping(value = "/memoset/list.do")
	@ResponseBody
	public ResultVO memosetList(HttpServletRequest request) {

		ResultVO out = new ResultVO();
		
		HttpSession session = request.getSession(false);
		DUserVO user = (DUserVO) session.getAttribute("loginInfo");
		if (null == user) {
			out.setResultMsg("wrong user");
		} else {
			List<DMemoSetVO> memoSet = mService.getMemoSetList(user);
			if (memoSet != null) {
				out.setResultCode(0);
				out.setResult(memoSet);
			}
		}

		return out;
	}
	
	@RequestMapping(value = "/memoset/insert.do", method=RequestMethod.POST)
	@ResponseBody
	public ResultVO memosetInsert(HttpServletRequest request, DMemoSetVO vo) {

		ResultVO out = new ResultVO();
		
		HttpSession session = request.getSession(false);
		DUserVO user = (DUserVO) session.getAttribute("loginInfo");

		vo.setMember_seq(user.getSeq());
		int cnt = mService.insertMemoSet(vo);
		if(cnt > 0) {
			out.setResultCode(0);
		}

		return out;
	}
	
	@RequestMapping(value = "/memoset/update.do", method=RequestMethod.POST)
	@ResponseBody
	public ResultVO memosetUpdate(HttpServletRequest request, DMemoSetVO vo) {
		ResultVO out = new ResultVO();
		
		int cnt = mService.updateMemoSet(vo);
		if(cnt > 0) {
			out.setResult(vo);
			out.setResultCode(0);
		}
		return out;
	}
	
	@RequestMapping(value = "/memo/list.do")
	@ResponseBody
	public ResultVO memoList(HttpServletRequest request, DMemoSetVO msVO) {

		ResultVO out = new ResultVO();
		
		HttpSession session = request.getSession(false);
		DUserVO user = (DUserVO) session.getAttribute("loginInfo");
		if (null == user) {
			out.setResultMsg("wrong user");
		} else {
			msVO.setMember_seq(user.getSeq());
			List<DMemoVO> memoSet = mService.getMemoList(msVO);
			if (memoSet != null) {
				out.setResultCode(0);
				out.setResult(memoSet);
			}
		}
		return out;
	}
	
	@RequestMapping(value = "/memo/insert.do", method=RequestMethod.POST)
	@ResponseBody
	public ResultVO memoInsert(DMemoVO vo) {

		ResultVO out = new ResultVO();
		
		mService.insertMemo(vo);
		if(vo.getSeq() > 0) {
			out.setResult(vo);
			out.setResultCode(0);
		}

		return out;
	}
	
	@RequestMapping(value = "/memo/update.do")
	@ResponseBody
	public ResultVO memoUpdate(HttpServletRequest request, DMemoVO vo) {
		System.out.println("MemoVO: " + vo.toString());
		
		ResultVO out = new ResultVO();
		
		int cnt;
		if(vo.getSeq() == 0) {
			cnt = mService.insertMemo(vo);
		}else {
			cnt = mService.updateMemo(vo);
		}
		if(cnt > 0) {
			out.setResult(vo);
			out.setResultCode(0);
		}
		
		return out;
	}
	
	@RequestMapping(value = "/memo/get.do")
	@ResponseBody
	public ResultVO memoGet(HttpServletRequest request, DMemoVO vo) {

		ResultVO out = new ResultVO();
		
		vo = mService.getMemo(vo);
		if(vo != null) {
			out.setResultCode(0);
			out.setResult(vo);
		}
		return out;
	}
}
