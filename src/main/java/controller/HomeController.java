package controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.spi.CalendarDataProvider;

import javax.servlet.http.HttpServletRequest;
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

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {

		if (null != session.getAttribute("id")) {
			model.addAttribute("loginid", session.getAttribute("id"));
		}

		return "home";
	}

	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "index";
	}



	/*
	 * @RequestMapping(value = "/getJsonByVO.do")
	 * 
	 * @ResponseBody public DResultVO getJsonByVO() { DResultVO result = new
	 * DResultVO(); result.setmList(mService.getMemberList());
	 * result.setResult(true); result.setResultMsg("성공");
	 * 
	 * return result; }
	 */

	/*
	 * @RequestMapping(value = "/memo.do", method = RequestMethod.GET) public
	 * ModelAndView memo(HttpServletRequest request, ModelAndView mav) {
	 * 
	 * HttpSession session = request.getSession(false); DUserVO user = (DUserVO)
	 * session.getAttribute("loginInfo"); if (null == user) {
	 * mav.setViewName("redirect:login.do"); return mav; // 로그인 된 상태 }
	 * 
	 * mav.setViewName("main/memo"); return mav; }
	 */

	/*
	 * @RequestMapping( value="/json/{id}", method = RequestMethod.GET)
	 * 
	 * @ResponseBody public UserModel getByIdInJSON( @PathVariable String id){
	 * 
	 * UserModel user = new UserModel(); user.setId( id); user.setName( "ellie");
	 * 
	 * return user; }
	 */

	/*
	 * @RequestMapping(value = " /jsonPostSingle", method = RequestMethod.GET)
	 * 
	 * @ResponseBody public PostModel
	 * generateJSONPostsingle(@ModelAttribute("postModel") PostModel postModel) {
	 * 
	 * if (postModel.getPostId() == 1) { postModel.setTitle("post title for id 1");
	 * } else { postModel.setTitle("default post title"); } return postModel; }
	 * 
	 * @RequestMapping(value = " /jsonPosts", method = RequestMethod.GET)
	 * 
	 * @ResponseBody public List<PostModel> generateJSONPosts() {
	 * 
	 * List<PostModel> list = new ArrayList<PostModel>();
	 * 
	 * PostModel p1 = new PostModel(); p1.setPostId(1); p1.setTitle("Post title 1");
	 * 
	 * PostModel p2 = new PostModel(); p2.setPostId(2); p2.setTitle("Post title 2");
	 * 
	 * list.add(p1); list.add(p2);
	 * 
	 * return list; }
	 */
}
