package com.cp.service;

import com.cp.dao.CommunicationDealDao;

public class CommunicationService {
	
	public String reply_add(String host_article_id,String reply_id,String reply_name, String reply_content) {
		// TODO Auto-generated method stub
		String temp = "NO";
		CommunicationDealDao replyadd = new CommunicationDealDao();
		temp = replyadd.ReplyContentAdd(host_article_id,reply_id,reply_name,reply_content);
		return temp;
	}
	
	public String content_add(String user_id,String user_name,String main_title, String main_content) {
		// TODO Auto-generated method stub
		String temp = "NO";
		CommunicationDealDao contentadd = new CommunicationDealDao();
		temp = contentadd.ContentAdd(user_id,user_name,main_title,main_content);
		return temp;
	}

	public String selectArticleId() {
		// TODO Auto-generated method stub
		return null;
	}
}
