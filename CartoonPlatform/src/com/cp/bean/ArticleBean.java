package com.cp.bean;

public class ArticleBean {
	private String communication_type,communication_content,communication_title,login_id;
	private int id,communication_id;
	
	
	public String getLogin_id() {
		return login_id;
	}
	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}
	public String getCommunication_title() {
		return communication_title;
	}
	public void setCommunication_title(String communication_title) {
		this.communication_title = communication_title;
	}
	public String getCommunication_type() {
		return communication_type;
	}
	public void setCommunication_type(String communication_type) {
		this.communication_type = communication_type;
	}
	public String getCommunication_content() {
		return communication_content;
	}
	public void setCommunication_content(String communication_content) {
		this.communication_content = communication_content;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCommunication_id() {
		return communication_id;
	}
	public void setCommunication_id(int communication_id) {
		this.communication_id = communication_id;
	}
	
	
}
