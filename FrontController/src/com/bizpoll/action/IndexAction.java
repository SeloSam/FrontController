package com.bizpoll.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bizpoll.dao.ProductDAO;
import com.bizpoll.dto.ProductDTO;

public class IndexAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url="index.jsp";
		
		
		ProductDAO pDao = new ProductDAO();
		
		
		List<ProductDTO> newProductList = pDao.listNewProduct();
		List<ProductDTO> bestProductList = pDao.listBestProduct();
		
		request.setAttribute("newlist", newProductList);
		request.setAttribute("bestlist", bestProductList);
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);//forward 방식으로 보냄
		
		return forward;
	}
}
