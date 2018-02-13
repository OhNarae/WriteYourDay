package interceptor;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import controller.HomeController;
import vo.DUserVO;

public class SessionInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if (logger.isDebugEnabled()) {
			logger.debug("==========START============");
			logger.debug("Request URI \t: " + request.getRequestURI());
		}

		try {
			HttpSession session = request.getSession(false);
			if (session == null || session.getAttribute("loginInfo") == null) {
				response.sendRedirect("/");
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return super.preHandle(request, response, handler);
	}

	/**
	 * This implementation is empty.
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		request.setAttribute("sysVer", dateFormat.format(new Date()));

		logger.debug("==========END============");
	}

}
