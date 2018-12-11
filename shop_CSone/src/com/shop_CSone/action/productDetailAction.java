package com.shop_CSone.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.jrockit.jfr.Producer;
import com.shop_CSone.dao.ProductDAO;
import com.shop_CSone.dto.ProductDTO;

public class productDetailAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String url = "product_detail.jsp";
		
		int p_code = Integer.parseInt(request.getParameter("p_code"));
		System.out.println(p_code);
		

		ProductDAO pDao = ProductDAO.getInstance();
		ProductDTO pDto = pDao.ProductDetailView(p_code);
		request.setAttribute("productview", pDto);
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
				
		return forward;
		
	}

}
