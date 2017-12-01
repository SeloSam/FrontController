package com.bizpoll.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bizpoll.dao.Cm160DAO;
import com.bizpoll.dto.Cm160DTO;

public class UpdatePlayAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url="index.bizpoll";
		
		HttpSession session=request.getSession();
		request.setCharacterEncoding("UTF-8");
		
		String userid = request.getParameter("update_id");
		String userpw = request.getParameter("update_pw1");
		userpw=request.getParameter("update_pw2");
		String username = request.getParameter("update_name");
		String userphone = request.getParameter("update_phone");
		String useremail = request.getParameter("update_email");
		String useraddress = request.getParameter("update_address");
		String useraddress2 = request.getParameter("update_address2");
		
		Cm160DTO cDto = new Cm160DTO(userid, userpw, username, userphone, useremail, useraddress, useraddress2);
		Cm160DAO cDao = new Cm160DAO();
		
		cDao.Cm160Update(cDto);
		session.setAttribute("loginUser", cDto);
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);//forward 방식으로 보냄
		
		return forward;	
		
		}
}
