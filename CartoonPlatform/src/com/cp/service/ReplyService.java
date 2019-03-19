package com.cp.service;
import com.cp.dao.CommunicationDealDao;

public class ReplyService {

	public String content_add(String host_article_id,String reply_id,String reply_title, String reply_content) {
		// TODO Auto-generated method stub
		String temp = "NO";
		CommunicationDealDao replyadd = new CommunicationDealDao();
		temp = replyadd.ReplyContentAdd(host_article_id,reply_id,reply_title,reply_content);
		return temp;
	}

}
