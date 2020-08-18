package com.spring.web.model;

import java.util.List;

public class UserVO {
	
	private String userId;
	private String userPw;
	private String userName;
	private List<String> hobby;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public List<String> getHobby() {
		return hobby;
	}
	public void setHobby(List<String> hobby) {
		this.hobby = hobby;
	}
	
	public UserVO() {}
	
	public UserVO(String userId, String userPw, String userName, List<String> hobby) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.hobby = hobby;
	}
	
	
}
