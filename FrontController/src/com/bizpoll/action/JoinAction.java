package com.bizpoll.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bizpoll.dao.Cm160DAO;



public class JoinAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url="cm160_join.jsp";
	
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);//forward 방식으로 보냄
		
		return forward;
	}
}