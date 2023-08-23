package com.yoriwiki.spring.domain;

import java.util.Date;

import lombok.Data;

@Data
public class UserVO {
	private int userNum;   
	private String userId;
	private String userPassword;
	private String userEmail;
	private String userName;   
	private String adminYn;
	private String platfomtype;
	private String user_newpassword;
	private String user_login_password;
	private Date modDt;
	private Date regDt;
}

