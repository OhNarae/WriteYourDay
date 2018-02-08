package controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.spi.CalendarDataProvider;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import util.FriendService;
import util.MemberService;
import vo.DResultVO;
import vo.DUserVO;
import vo.WMonth;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private MemberService mService;
	
	@Autowired
	private FriendService sFriend;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {

		return "home";
	}
	
	@RequestMapping(value = "/error")
	public String error(HttpServletRequest request, HttpServletResponse response) {
		
		switch(request.getParameter("code")) {
		case "404":
			request.setAttribute("error_msg", "페이지를 찾을 수 없습니다.");
			break;
		}
		
		response.setStatus(HttpServletResponse.SC_OK);

		return "error";
	}

}
