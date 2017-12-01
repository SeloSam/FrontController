package com.bizpoll.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UpdateAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		
		String url = null;
		String code = null;
		
		if(session.getAttribute("loginUser")!=null){
			
			RequestDispatcher dis=request.getRequestDispatcher("cm160_update.jsp");
			dis.forward(request, response);
			
		} else {
			code="login.bizpoll";
			request.setAttribute("code", "1");
			
			RequestDispatcher dis=request.getRequestDispatcher(code);
			dis.forward(request, response);
			
		}
	
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);//forward 방식으로 보냄
		
		return forward;
	}

}
