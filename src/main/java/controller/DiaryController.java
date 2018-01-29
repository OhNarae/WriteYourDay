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
import vo.DEventVO;
import vo.DUserVO;
import vo.WMonth;

/**
 * Handles requests for the application home page.
 */
@Controller
public class DiaryController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private DiaryService sDiary;

	
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
	public ModelAndView myday(HttpServletRequest request, ModelAndView mav) {

		HttpSession session = request.getSession(false);
		DUserVO user = (DUserVO) session.getAttribute("loginInfo");
		if (null == user) {
			mav.setViewName("redirect:login.do");
			return mav; // 로그인 된 상태
		}

		mav.setViewName("main/myday");
		return mav;
	}
	
	@RequestMapping(value = "/events/list.do", method = RequestMethod.GET)
	public ModelAndView month(HttpServletRequest request, ModelAndView mav, DEventVO eventInfo) {
	
		
		
		
		return mav;
	}
	
}
