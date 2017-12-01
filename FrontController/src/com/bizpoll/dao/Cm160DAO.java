package com.bizpoll.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.bizpoll.common.DBManager;
import com.bizpoll.dto.Cm160DTO;



public class Cm160DAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ArrayList<Cm160DTO> list = new ArrayList<Cm160DTO>();
	int result;
	int message;
	Cm160DTO cDto = new Cm160DTO();

	public ArrayList<Cm160DTO> Cm160Update(Cm160DTO cm160Dto) {
		try {
			conn = DBManager.getConnection();
			String sql = "UPDATE promember SET userpw = ?, username = ?, userphone = ?, useremail = ?, useraddress=?, useraddress2=? where userid = ? ";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, cm160Dto.getUserpw());
			pstmt.setString(2, cm160Dto.getUsername());
			pstmt.setString(3, cm160Dto.getUserphone());
			pstmt.setString(4, cm160Dto.getUseremail());
			pstmt.setString(5, cm160Dto.getUseraddress());
			pstmt.setString(6, cm160Dto.getUseraddress2());
			pstmt.setString(7, cm160Dto.getUserid());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			DBManager.close(conn, pstmt);
		}
		return list;
	}
	
	public ArrayList<Cm160DTO> Cm160Update(String id) {
		
		try {
			conn=DBManager.getConnection();
			String sql = "SELECT * FROM promember WHERE userid=?";
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, id); 
			
			rs=pstmt.executeQuery();

			list.clear();
			
			while(rs.next()){
				String userid=rs.getString("userid");
				String userpw=rs.getString("userpw");
				String username=rs.getString("username");
				String userphone=rs.getString("userphone");
				String useremail=rs.getString("useremail");
				String useraddress=rs.getString("useraddress");
				
				Cm160DTO cDto = new Cm160DTO(userid, userpw, username, userphone, useremail, useraddress);
				list.add(cDto);
			}
			
			for(Cm160DTO c160Dto:list){
				System.out.print(c160Dto.getUserid() + ",");
				System.out.print(c160Dto.getUserpw() + ",");
				System.out.print(c160Dto.getUsername() + ",");
				System.out.print(c160Dto.getUserphone() + ",");
				System.out.print(c160Dto.getUseremail() + ",");
				System.out.print(c160Dto.getUseraddress());
				System.out.println();
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}//listNewProduct()

	public int Cm160Insert(Cm160DTO cDto) {
		try {
			conn = DBManager.getConnection();

			String sql = "INSERT INTO promember(userid, userpw, username, userphone, useremail, useraddress,useraddress2) " + "VALUES (?,?,?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, cDto.getUserid());
			pstmt.setString(2, cDto.getUserpw());
			pstmt.setString(3, cDto.getUsername());
			pstmt.setString(4, cDto.getUserphone());
			pstmt.setString(5, cDto.getUseremail());
			pstmt.setString(6, cDto.getUseraddress());
			pstmt.setString(7, cDto.getUseraddress2());
			
			result = pstmt.executeUpdate();
	
		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return result;

	}
	
	public Cm160DTO ckLogin(String id, String pw) {
		
		try {
			System.out.println("id"+id+"pw"+pw);
			conn=DBManager.getConnection();
			String sql = "SELECT * FROM promember "
						+ "WHERE "
						+ "userid=? AND userpw=? ";
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, id); 
			pstmt.setString(2, pw); 
			
			rs=pstmt.executeQuery();
			
			
			while(rs.next()){
				String userid=rs.getString("userid");
				String userpw=rs.getString("userpw");
				String username=rs.getString("username");
				String userphone=rs.getString("userphone");
				String useremail=rs.getString("useremail");
				String useraddress=rs.getString("useraddress");
				
				cDto = new Cm160DTO(userid, userpw, username, userphone, useremail, useraddress);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			DBManager.close(conn, pstmt, rs);
		}
		if(cDto.getUserid()!=null){
			return cDto;
			
		}else{
			return null;
		}
		
	}//listNewProduct()
	
	public int Cm160chid(String id) {
		message=0;
		try {
			conn=DBManager.getConnection();
			String sql = "SELECT userid FROM promember WHERE userid=?";
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1,id); 
			
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				String userid=rs.getString("userid");
			
				cDto = new Cm160DTO(userid);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			DBManager.close(conn, pstmt, rs);
		}
		if(cDto.getUserid()!=null){
			message=1;//중복일때
			return message;
		}else{
			message=0;//중복이아닐때
			return message;
			
		}
	}

}
