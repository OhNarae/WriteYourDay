package controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.lf5.util.DateFormatManager;
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
import vo.DCashbookVO;
import vo.DEventShareVO;
import vo.DEventVO;
import vo.DUserVO;
import vo.DMemoVO;
import vo.ResultVO;
import vo.WDay;
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
	
	@RequestMapping(value = "/month/event/list.do", method = RequestMethod.GET)
	@ResponseBody
	public ResultVO monthEventsList(HttpServletRequest request, WDay wday) {
		ResultVO out = new ResultVO();
		
		HttpSession session = request.getSession(false);
		DUserVO user = (DUserVO) session.getAttribute("loginInfo");
		
		wday.setMember_seq(user.getSeq());
		if(wday.getEnd_date() == null) {
			DateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
			Date endDate = null;
			Date startDate;
			try {
				startDate = dateFormat.parse(wday.getStart_date());
				Calendar cal = Calendar.getInstance();
				cal.setTime(startDate);
				cal.add(Calendar.MONTH, 1);
				endDate = cal.getTime();
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String strEndDate = dateFormat.format(endDate);
			wday.setEnd_date(strEndDate);
		}
		out.setResult(sDiary.getEventList(wday));
		
		return out;
	}
	

	@RequestMapping(value = "/myday.do", method = RequestMethod.GET)
	public ModelAndView myday(HttpServletRequest request, ModelAndView mav, WMonth monthInfo) {

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
		DMemoVO memo = new DMemoVO();
		memo.setSet_seq(MemoService.MEMO_SET_DIARY);
		memo.setName(formattedDate);
		DMemoVO rMemo = sMemo.getMemo(memo);		
		if(null == rMemo)
			mav.addObject("memo", memo);
		else mav.addObject("memo", rMemo);
		
		mav.setViewName("main/myday");
		return mav;
	}
	
	@RequestMapping(value = "/event/list.do", method = RequestMethod.POST)
	@ResponseBody
	public ResultVO eventsList(HttpServletRequest request, ModelAndView mav, WDay wday) {
		ResultVO out = new ResultVO();
		
		HttpSession session = request.getSession(false);
		DUserVO user = (DUserVO) session.getAttribute("loginInfo");
		
		wday.setMember_seq(user.getSeq());
		if(wday.getEnd_date() == null) {
			DateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
			Date endDate = null;
			Date startDate;
			try {
				startDate = dateFormat.parse(wday.getStart_date());
				Calendar cal = Calendar.getInstance();
				cal.setTime(startDate);
				cal.add(Calendar.DATE, 1);
				endDate = cal.getTime();
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String strEndDate = dateFormat.format(endDate);
			wday.setEnd_date(strEndDate);
		}
		out.setResult(sDiary.getEventList(wday));
		
		return out;
	}

	@RequestMapping(value = "/event/insert.do", method = RequestMethod.POST)
	@ResponseBody
	public ResultVO eventsInsert(HttpServletRequest request, DEventVO event) throws ParseException {
		ResultVO out = new ResultVO();
		
		HttpSession session = request.getSession(false);
		DUserVO user = (DUserVO) session.getAttribute("loginInfo");
		
		event.setMember_seq(user.getSeq());
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm");
		Date endDate = dateFormat.parse(event.getEnd_date());		
		event.setEnd_date(dateFormat.format(endDate));
		
		sDiary.insertEvent(event);
		
		return out;
	}
	
	@RequestMapping(value = "/event/delete.do", method = RequestMethod.POST)
	@ResponseBody
	public ResultVO eventsDelete(HttpServletRequest request, DEventVO event) throws ParseException {
		ResultVO out = new ResultVO();
		
		HttpSession session = request.getSession(false);
		DUserVO user = (DUserVO) session.getAttribute("loginInfo");
		
		event.setMember_seq(user.getSeq());
		sDiary.deleteEvent(event);
		
		return out;
	}
	
	@RequestMapping(value = "/cashbook/insert.do", method = RequestMethod.POST)
	@ResponseBody
	public ResultVO cashbookInsert(HttpServletRequest request, DCashbookVO cash) throws ParseException {
		ResultVO out = new ResultVO();
		
		HttpSession session = request.getSession(false);
		DUserVO user = (DUserVO) session.getAttribute("loginInfo");
		
		cash.setMember_seq(user.getSeq());		
		sDiary.insertCashbook(cash);
		
		return out;
	}
	
	@RequestMapping(value = "/cashbook/delete.do", method = RequestMethod.POST)
	@ResponseBody
	public ResultVO cashbookDelete(HttpServletRequest request, DCashbookVO cash) throws ParseException {
		ResultVO out = new ResultVO();
		
		HttpSession session = request.getSession(false);
		DUserVO user = (DUserVO) session.getAttribute("loginInfo");
		
		cash.setMember_seq(user.getSeq());
		sDiary.deleteCashbook(cash);
		
		return out;
	}
	
	@RequestMapping(value = "/cashbook/list.do", method = RequestMethod.POST)
	@ResponseBody
	public ResultVO cashbookList(HttpServletRequest request, WDay wday) throws ParseException {
		ResultVO out = new ResultVO();
		
		HttpSession session = request.getSession(false);
		DUserVO user = (DUserVO) session.getAttribute("loginInfo");
		
		wday.setMember_seq(user.getSeq());
		
		if(wday.getEnd_date() == null) {
			DateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
			Date startDate = dateFormat.parse(wday.getStart_date());
			Calendar cal = Calendar.getInstance();
			cal.setTime(startDate);
			cal.add(Calendar.DATE, 1);
			wday.setEnd_date(dateFormat.format(cal.getTime()));
		}
		
		out.setResult(sDiary.getCashbookList(wday));
		return out;
	}
	
	@RequestMapping(value = "/event/share/insert.do", method = RequestMethod.POST)
	@ResponseBody
	public ResultVO eventShareInsert(HttpServletRequest request, DEventShareVO share) throws ParseException {
		ResultVO out = new ResultVO();
		
		HttpSession session = request.getSession(false);
		DUserVO user = (DUserVO) session.getAttribute("loginInfo");
		
		share.setMember_seq(user.getSeq());		
		sDiary.insertEventShare(share);
		
		return out;
	}
	
	@RequestMapping(value = "/event/share/list.do")
	@ResponseBody
	public ResultVO eventShareList(HttpServletRequest request) throws ParseException {
		ResultVO out = new ResultVO();
		
		HttpSession session = request.getSession(false);
		DUserVO user = (DUserVO) session.getAttribute("loginInfo");
		
		DEventShareVO share = new DEventShareVO();
		share.setYou_member_seq(user.getSeq());		
		share.setStatus(DiaryService.EVENTSHARE_STATUS_REQ);
		out.setResult(sDiary.getEventShareList(share));

		return out;
	}
	
	@RequestMapping(value = "/event/share/ok.do")
	@ResponseBody
	public ResultVO eventShareOk(HttpServletRequest request, DEventShareVO share) throws ParseException {
		ResultVO out = new ResultVO();
		
		HttpSession session = request.getSession(false);
		DUserVO user = (DUserVO) session.getAttribute("loginInfo");
		
		share.setYou_member_seq(user.getSeq());		
		share.setStatus(DiaryService.EVENTSHARE_STATUS_OK);
		sDiary.copyEvent(share);

		return out;
	}
	
	@RequestMapping(value = "/event/share/reject.do")
	@ResponseBody
	public ResultVO eventShareReject(HttpServletRequest request, DEventShareVO share) throws ParseException {
		ResultVO out = new ResultVO();
		
		HttpSession session = request.getSession(false);
		DUserVO user = (DUserVO) session.getAttribute("loginInfo");
		
		share.setYou_member_seq(user.getSeq());		
		share.setStatus(DiaryService.EVENTSHARE_STATUS_REJECT);
		sDiary.updateEventShare(share);

		return out;
	}
}
