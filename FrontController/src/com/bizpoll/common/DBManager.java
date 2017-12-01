package com.bizpoll.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBManager {
	// 인스턴스의 주소를 저장하기 위한 참조 변수
	private static Connection conn;

	/*private final static String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private final static String URL = "jdbc:oracle:thin:@192.168.123.19:1521:XE";
	private final static String USER = "java";
	private final static String PASS = "1234";*/

	/* 		생성자
	 **		반드시 생성자를 private으로 선언하여 은닉화 시킨다.
	 ***	=> 외부에서 인스턴스를 생성하지 못하도록 선언
	 ****	이유 = 공유해서 사용해야 하는데 객체 생성해서 사용하면 의미없음(사용자 실수 막는 용도)
	 */
	private DBManager() { // default 생성자 생성

	}

	// 인스턴스를 생성 또는 기존 인스턴스를 반환하는
	public static Connection getConnection() {

		conn = null;

		if (conn == null) {

			try {
				
				Context initContext=new InitialContext();
				Context envContext=(Context)initContext.lookup("java://comp/env");
				DataSource ds=(DataSource)envContext.lookup("jdbc/myoracle");
				conn=ds.getConnection();
				
				
				/*Class.forName(DRIVER);
				conn = DriverManager.getConnection(URL, USER, PASS);*/

			} catch (Exception e) {
				e.printStackTrace();

			}
		}

		return conn;
	}

	// SELECT를 수행한 후 자원 해제를 위한 메서드 (execute 쿼리)
	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
	
		try {

			if (rs != null) {

				try {
					rs.close();

				} catch (Exception e) {

					e.printStackTrace();

				}
			}
		
			if (pstmt != null) {

				try {
					pstmt.close();

				} catch (Exception e) {

					e.printStackTrace();

				}
			}
			
			if (conn != null) {

				try {
					conn.close();

				} catch (Exception e) {

					e.printStackTrace();

				}
			}

		} catch (Exception e) {
			e.printStackTrace();

		}
	}
	public static void close(Connection conn, ResultSet rs) {
		
		try {

			if (rs != null) {

				try {
					rs.close();

				} catch (Exception e) {

					e.printStackTrace();

				}
			}
		
			if (conn != null) {

				try {
					conn.close();

				} catch (Exception e) {

					e.printStackTrace();

				}
			}

		} catch (Exception e) {
			e.printStackTrace();

		}
	}
	
	
	public static void close(Connection conn, Statement st) {
		
		try {

			if (st != null) {

				try {
					st.close();

				} catch (Exception e) {

					e.printStackTrace();

				}
			}
		
			if (conn != null) {

				try {
					conn.close();

				} catch (Exception e) {

					e.printStackTrace();

				}
			}

		} catch (Exception e) {
			e.printStackTrace();

		}
	}
//	insert delete update 를 수행한 후 자원 해제를 위한 메서드
	public static void close(Connection conn, PreparedStatement pstmt) {
		try {
			
			if( conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			

			if( pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		
		}
	}
}
