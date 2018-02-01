package controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.List;

import javax.imageio.ImageIO;
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

import util.FriendService;
import util.MemberService;
import util.MemoService;
import util.TalkService;
import vo.DUserVO;
import vo.ResultVO;
import vo.DTalkVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class TalkController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private MemberService sMember;
	@Autowired
	private TalkService sTalk;
	@Autowired
	private FriendService sFriend;
	
	@RequestMapping(value = "/talk.do")
	public ModelAndView talk(HttpServletRequest request, ModelAndView mav) {

		HttpSession session = request.getSession(false);
		DUserVO user = (DUserVO) session.getAttribute("loginInfo");
		if (null == user) {
			mav.setViewName("redirect:login.do");
			return mav; // 로그인 된 상태
		}
		
		List<DUserVO> friendList = sFriend.getFriendList(user);
		mav.addObject("friendList", friendList);
		
		mav.setViewName("main/talk");
		return mav;
	}
	
	@RequestMapping(value = "/talkbody.do")
	public ModelAndView talkbody(HttpServletRequest request, ModelAndView mav, DUserVO targetUser) {

		HttpSession session = request.getSession(false);
		DUserVO user = (DUserVO) session.getAttribute("loginInfo");
		if (null == user) {
			mav.setViewName("redirect:login.do");
			return mav; // 로그인 된 상태
		}
		
		targetUser = sMember.getMemberInfo(targetUser);
		mav.addObject("target", targetUser);

		mav.setViewName("main/talkbody");
		return mav;
	}
	
	/** * 썸네일을 생성합니다. * 250 x 150 크기의 썸네일을 만듭니다. */ 
	private void makeThumbnail(File oldFile, String fileExt) throws Exception { 
		// 저장된 원본파일로부터 BufferedImage 객체를 생성합니다. 
		BufferedImage srcImg = ImageIO.read(oldFile); 
		// 썸네일의 너비와 높이 입니다. 
		int MAX_WIDTH = 400, MAX_HEIGHT = 300; 
		// 원본 이미지의 너비와 높이 입니다. 
		int tempW = srcImg.getWidth(); 
		int tempH = srcImg.getHeight(); 
        if (tempW > tempH) {
            if (tempW > MAX_WIDTH) {
               tempH *= MAX_WIDTH / tempW;
               tempW = MAX_WIDTH;
            }
        } else {
            if (tempH > MAX_HEIGHT) {
               tempW *= MAX_HEIGHT / tempH;
               tempH = MAX_HEIGHT;
            }
        }
 
		BufferedImage destImg = Scalr.resize(srcImg, tempW, tempH); 
		// 썸네일을 저장합니다. 기존 파일을 덮어씁니다. 
		ImageIO.write(destImg, fileExt.toUpperCase(), oldFile); 
	}

	
	@RequestMapping(value = "/talk/insert.do")
	@ResponseBody
	public ResultVO talkInsert(HttpServletRequest request, DTalkVO vo)
			throws Exception {
		ResultVO out = new ResultVO();
		
		HttpSession session = request.getSession(false);
		DUserVO user = (DUserVO) session.getAttribute("loginInfo");
		
		vo.setWriter_seq(user.getSeq());
		// UploadFile 처리
		MultipartFile uploadfile = vo.getContents_uploadfile() ; 
		String filename = "No Image";
		if (uploadfile != null && !uploadfile.isEmpty()) {
			filename = "C:\\eclipse-workspace\\WriteYourDay\\src\\main\\webapp\\resources\\upload_images\\" + uploadfile.getOriginalFilename();
			File upFile = new File(filename);
			uploadfile.transferTo(upFile);
			int index = filename.lastIndexOf(".");
			String fileExt = filename.substring(index + 1);
			makeThumbnail(upFile, fileExt);
			vo.setContents_uploadfile_path("/WriteYourDay/resources/upload_images/" + uploadfile.getOriginalFilename());
		}
		sTalk.insertTalk(vo);

		out.setResult(vo);
		return out;
	}

	@RequestMapping(value = "/talk/list.do")
	@ResponseBody
	public ResultVO memosetList(HttpServletRequest request, DTalkVO vo) {

		ResultVO out = new ResultVO();
		
		List<DTalkVO> memoSet = sTalk.getTalkList(vo);
		out.setResult(memoSet);

		return out;
	}	
	
}
