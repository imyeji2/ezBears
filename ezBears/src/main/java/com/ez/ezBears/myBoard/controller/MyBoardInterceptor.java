package com.ez.ezBears.myBoard.controller;

import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.ez.ezBears.login.controller.LoginInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@Component
public class MyBoardInterceptor implements HandlerInterceptor{
	
	private static final Logger logger
	=LoggerFactory.getLogger(LoginInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
	    String userid = (String) request.getSession().getAttribute("userid");
	    logger.info("세션 파라미터 userid={}", userid);
	    
	    
	    String paramMBoardNo = request.getParameter("mBoardNo");
	    System.out.println(paramMBoardNo);
	   // int paramMBoardNo = Integer.parseInt(paramMBoardNoStr);
	    
	    List<Map<String, Object>> myBoardList = (List<Map<String, Object>>) request.getSession().getAttribute("myBoardList");
	    for(int i=0; i<myBoardList.size();i++) {
	    	
	        Object mBoardNoObj = myBoardList.get(i).get("M_BOARD_NO");
	        if (mBoardNoObj instanceof BigDecimal) {
	            BigDecimal mBoardNoDecimal = (BigDecimal) mBoardNoObj;
	            String mBoardNo = mBoardNoDecimal.toString(); // Convert BigDecimal to String
	            System.out.println(mBoardNo);
	            
	            if(paramMBoardNo.equals(mBoardNo)) {
	            	return true;
	            }
	            
	        }
	    	
			
	    }
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<script>");
		out.print("alert('접근할 수 없는 보드입니다.');");
		out.print("location.href='/ezBears/';");
		out.print("</script>");
	    return false;
	}

	
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {	
	}
	

}
