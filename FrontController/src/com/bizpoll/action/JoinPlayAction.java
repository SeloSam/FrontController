package com.bizpoll.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bizpoll.dao.Cm160DAO;
import com.bizpoll.dto.Cm160DTO;


public class JoinPlayAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url="cm160_welcome.jsp";
		
		String userid = request.getParameter("join_name_id");
		String userpw = request.getParameter("join_name_pw1");
		String username = request.getParameter("join_name_name");
		String userphone = request.getParameter("join_name_phone");
		String useremail = request.getParameter("join_name_email");
		String useraddress = request.getParameter("join_name_address");
		String useraddress2 = request.getParameter("join_name_address2");
		
	
		Cm160DAO cDao = new Cm160DAO();
		Cm160DTO cDto = new Cm160DTO(userid, userpw, username, userphone, useremail, useraddress, useraddress2);
		
		cDao.Cm160Insert(cDto);
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);//forward 방식으로 보냄
		
		
		return forward;
	}

}
