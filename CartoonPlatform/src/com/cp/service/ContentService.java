package com.cp.service;

import com.cp.dao.CommunicationDealDao;

public class ContentService {

	public String content_add(String user_name,String main_title, String main_content) {
		// TODO Auto-generated method stub
		String temp = "NO";
		CommunicationDealDao contentadd = new CommunicationDealDao();
		temp = contentadd.ContentAdd(user_name,main_title,main_content);
		return temp;
	}

	public String selectArticleId() {
		// TODO Auto-generated method stub
		return null;
	}

}
