package com.bizpoll.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bizpoll.dao.ProductDAO;
import com.bizpoll.dto.ProductDTO;


public class DetailAction1 implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url="cm160_detail2.jsp";
		
		ProductDAO pDao = new ProductDAO();

		String p_code=request.getParameter("p_code");
		System.out.println("detail1="+p_code);

		List<ProductDTO> newDetail = pDao.listNewDetail(p_code);

		request.setAttribute("newdetail", newDetail);
		System.out.println("detail1="+newDetail);
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);//forward 방식으로 보냄
		
		return forward;
			
	}

}
