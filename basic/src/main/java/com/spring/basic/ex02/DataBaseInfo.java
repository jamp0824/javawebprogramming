package com.spring.basic.ex02;

public class DataBaseInfo {

	public DataBaseInfo() {
		
	}
	private String url;
	private String uid;
	private String upw;
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUpw() {
		return upw;
	}
	public void setUpw(String upw) {
		this.upw = upw;
	}
	public DataBaseInfo(String url, String uid, String upw) {
		super();
		this.url = url;
		this.uid = uid;
		this.upw = upw;
	}
	
	
}
