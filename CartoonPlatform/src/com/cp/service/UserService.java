package com.cp.service;

import com.cp.bean.UserBean;
import com.cp.dao.UserDao;

public class UserService {

	public String checkuserid(UserBean loginuser) {
		// TODO Auto-generated method stub
		String result = "";
		UserDao checkiddao = new UserDao();
		result = checkiddao.logincheck(loginuser);
		
		return result;
	}

	public UserBean selectinfo(String login_id) {
		// TODO Auto-generated method stub
		UserBean allinfo = new UserBean();
		UserDao search_info_dao = new UserDao();
		allinfo = search_info_dao.searchinfo(login_id);
		return allinfo;
	}

}
