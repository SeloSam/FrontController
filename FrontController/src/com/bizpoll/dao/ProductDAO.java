package com.bizpoll.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bizpoll.common.DBManager;
import com.bizpoll.dto.ProductDTO;


public class ProductDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ArrayList<ProductDTO> bestlist = new ArrayList<ProductDTO>();
	ArrayList<ProductDTO> bestdetail = new ArrayList<ProductDTO>();
	ArrayList<ProductDTO> newlist = new ArrayList<ProductDTO>();
	ArrayList<ProductDTO> newdetail = new ArrayList<ProductDTO>();
	int result;

	
	public List<ProductDTO> listNewProduct(){	
	
		try {
			conn=DBManager.getConnection();
			String sql = "SELECT * FROM new_pro_view";
			pstmt=conn.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			newlist.clear();
			
			while(rs.next()){
				String p_code=rs.getString("p_code");
				String p_name=rs.getString("p_name");
				int p_price2=rs.getInt("p_price2");
				String p_img=rs.getString("p_img");
				
				ProductDTO pDto = new ProductDTO(p_code, p_name, p_price2, p_img);
				newlist.add(pDto);
			}
			
			for(ProductDTO productDto:newlist){
				System.out.print(productDto.getP_code() + ",");
				System.out.print(productDto.getP_name() + ",");
				System.out.print(productDto.getP_price2() + ",");
				System.out.print(productDto.getP_img() + ",");
				System.out.println();
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			DBManager.close(conn, pstmt, rs);
		}
		return newlist;
	}//listNewProduct()

	public List<ProductDTO> listNewDetail(String p_code){	
		
		try {
			conn=DBManager.getConnection();
			String sql = "SELECT * FROM new_pro_view where p_code=?";
			pstmt=conn.prepareStatement(sql);

			pstmt.setString(1, p_code);

			rs=pstmt.executeQuery();
			
			while(rs.next()){
				p_code=rs.getString("p_code");
				String p_name=rs.getString("p_name");
				int p_price2=rs.getInt("p_price2");
				String p_img=rs.getString("p_img");
				
				ProductDTO pDto = new ProductDTO(p_code, p_name, p_price2, p_img);
				newdetail.add(pDto);
			}
			
			for(ProductDTO productDto:newdetail){
				System.out.print(productDto.getP_code() + ",");
				System.out.print(productDto.getP_name() + ",");
				System.out.print(productDto.getP_price2() + ",");
				System.out.print(productDto.getP_img() + ",");
				System.out.println();
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			DBManager.close(conn, pstmt, rs);
		}
		return newdetail;
	}//listNewProduct()
	public List<ProductDTO> listBestDetail(String p_code){	
		
		try {
			conn=DBManager.getConnection();
			String sql = "SELECT * FROM best_pro_view where p_code=?";
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, p_code);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				p_code=rs.getString("p_code");
				String p_name=rs.getString("p_name");
				int p_price2=rs.getInt("p_price2");
				String p_img=rs.getString("p_img");
				
				ProductDTO pDto = new ProductDTO(p_code, p_name, p_price2, p_img);
				bestdetail.add(pDto);
			}
			
			for(ProductDTO productDto:bestdetail){
				System.out.print(productDto.getP_code() + ",");
				System.out.print(productDto.getP_name() + ",");
				System.out.print(productDto.getP_price2() + ",");
				System.out.print(productDto.getP_img() + ",");
				System.out.println();
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			DBManager.close(conn, pstmt, rs);
		}
		return bestdetail;
	}//listNewProduct()

	public List<ProductDTO> listBestProduct(){	
		
		try {
			conn=DBManager.getConnection();
			String sql = "SELECT * FROM best_pro_view";
			pstmt=conn.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			bestlist.clear();
			
			while(rs.next()){
				String p_code=rs.getString("p_code");
				String p_name=rs.getString("p_name");
				int p_price2=rs.getInt("p_price2");
				String p_img=rs.getString("p_img");
				
				ProductDTO pDto = new ProductDTO(p_code, p_name, p_price2, p_img);
				bestlist.add(pDto);
			}
			
			for(ProductDTO productDto:bestlist){
				System.out.print(productDto.getP_code() + ",");
				System.out.print(productDto.getP_name() + ",");
				System.out.print(productDto.getP_price2() + ",");
				System.out.print(productDto.getP_img() + ",");
				System.out.println();
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			DBManager.close(conn, pstmt, rs);
		}
		return bestlist;
	}//listBestProduct()
	
	
	
}
