package controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import util.DiaryService;
import util.MemoService;
import vo.DEventVO;
import vo.DUserVO;
import vo.MemoVO;
import vo.ResultVO;
import vo.WMonth;

/**
 * Handles requests for the application home page.
 */
@Controller
public class DiaryController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private DiaryService sDiary;
	
	@Autowired
	private MemoService sMemo;
	
	@RequestMapping(value = "/month.do", method = RequestMethod.GET)
	public ModelAndView month(HttpServletRequest request, ModelAndView mav, WMonth monthInfo) {

		HttpSession session = request.getSession(false);
		DUserVO user = (DUserVO) session.getAttribute("loginInfo");
		if (null == user) {
			mav.setViewName("redirect:login.do");
			return mav; // 로그인 된 상태
		}

		Date date = null;
		if (monthInfo.getMonth() == null) {
			date = new Date();
		} else {
			try {
				DateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
				Date currDate = dateFormat.parse(monthInfo.getMonth() + ".01");

				Calendar cal = Calendar.getInstance();
				cal.setTime(currDate);
				if (monthInfo.getDirection().equals("pre")) {
					cal.add(Calendar.MONTH, -1);
				} else {
					cal.add(Calendar.MONTH, 1);
				}

				date = cal.getTime();
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		DateFormat dateFormat = new SimpleDateFormat("yyyy.MM");
		String formattedDate = dateFormat.format(date);
		mav.addObject("month", formattedDate);

		mav.setViewName("main/month");
		return mav;
	}

	@RequestMapping(value = "/myday.do", method = RequestMethod.GET)
	public ModelAndView myday(HttpServletRequest request, ModelAndView mav, WMonth monthInfo) {

		HttpSession session = request.getSession(false);
		DUserVO user = (DUserVO) session.getAttribute("loginInfo");
		if (null == user) {
			mav.setViewName("redirect:login.do");
			return mav; // 로그인 된 상태
		}

		//해당 날짜 포맷 맞추어 주기
		DateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
		Date currDate = null;
		try {
			currDate = dateFormat.parse(monthInfo.getDate());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String formattedDate = dateFormat.format(currDate);
		mav.addObject("date", formattedDate);
		
		//해당 날짜의 메모 가져오기 
		MemoVO memo = new MemoVO();
		memo.setSet_seq(MemoService.MEMO_SET_DIARY);
		memo.setName(formattedDate);
		MemoVO rMemo = sMemo.getMemo(memo);		
		if(null == rMemo)
			mav.addObject("memo", memo);
		else mav.addObject("memo", rMemo);
		
		mav.setViewName("main/myday");
		return mav;
	}
	
	@RequestMapping(value = "/events/list.do", method = RequestMethod.GET)
	@ResponseBody
	public ResultVO eventsList(HttpServletRequest request, ModelAndView mav, DEventVO event) {
		ResultVO out = new ResultVO();
		
		HttpSession session = request.getSession(false);
		DUserVO user = (DUserVO) session.getAttribute("loginInfo");
		
		event.setMember_seq(user.getSeq());
		if(event.getEnd_date() == null) {
			DateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
			Date endDate = null;
			Date startDate;
			try {
				startDate = dateFormat.parse(event.getStart_date());
				Calendar cal = Calendar.getInstance();
				cal.setTime(startDate);
				cal.add(Calendar.MONTH, 1);
				endDate = cal.getTime();
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String strEndDate = dateFormat.format(endDate);
			event.setEnd_date(strEndDate);
		}
		out.setResult(sDiary.getEventList(event));
		
		return out;
	}

	@RequestMapping(value = "/events/insert.do", method = RequestMethod.GET)
	@ResponseBody
	public ResultVO eventsInsert(HttpServletRequest request, ModelAndView mav, DEventVO event) {
		ResultVO out = new ResultVO();
		
		HttpSession session = request.getSession(false);
		DUserVO user = (DUserVO) session.getAttribute("loginInfo");
		
		event.setMember_seq(user.getSeq());
		sDiary.insertEvent(event);
		
		return out;
	}
}
