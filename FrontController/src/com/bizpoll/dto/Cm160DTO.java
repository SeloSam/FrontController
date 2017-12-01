package com.bizpoll.dto;

import java.sql.Date;

public class Cm160DTO {
	private String userid;
	private String userpw;
	private String username;
	private String userphone;
	private String useremail;
	private String useraddress;
	private String useraddress2;
	private Date regdate;
	
	
	
	
	public Cm160DTO(){
		
	}
	
	
	
	public Cm160DTO(String userid, String userpw, String username, String userphone, String useremail,
			String useraddress, String useraddress2, Date regdate) {
		super();
		this.userid = userid;
		this.userpw = userpw;
		this.username = username;
		this.userphone = userphone;
		this.useremail = useremail;
		this.useraddress = useraddress;
		this.useraddress2 = useraddress2;
		this.regdate = regdate;
	}



	public Cm160DTO(String userid, String userpw, String username, String userphone, String useremail,
			String useraddress, String useraddress2) {
		super();
		this.userid = userid;
		this.userpw = userpw;
		this.username = username;
		this.userphone = userphone;
		this.useremail = useremail;
		this.useraddress = useraddress;
		this.useraddress2 = useraddress2;
	}



	public Cm160DTO(String userid) {
		super();
		this.userid = userid;
	}
	
	public Cm160DTO(String userid,String userpw) {
		super();
		this.userid = userid;
		this.userpw = userpw;
	}	


	public Cm160DTO(String userid, String userpw, String username, String userphone, String useremail,
			String useraddress, Date regdate) {
		super();
		this.userid = userid;
		this.userpw = userpw;
		this.username = username;
		this.userphone = userphone;
		this.useremail = useremail;
		this.useraddress = useraddress;
		this.regdate = regdate;
	}
	
	public Cm160DTO(String userid, String userpw, String username, String userphone, String useremail,
			String useraddress) {
		super();
		this.userid = userid;
		this.userpw = userpw;
		this.username = username;
		this.userphone = userphone;
		this.useremail = useremail;
		this.useraddress = useraddress;
	}

	
	
	
	
	
	public String getUseraddress2() {
		return useraddress2;
	}



	public void setUseraddress2(String useraddress2) {
		this.useraddress2 = useraddress2;
	}



	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpw() {
		return userpw;
	}

	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserphone() {
		return userphone;
	}

	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}

	public String getUseremail() {
		return useremail;
	}

	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}

	public String getUseraddress() {
		return useraddress;
	}

	public void setUseraddress(String useraddress) {
		this.useraddress = useraddress;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
}
