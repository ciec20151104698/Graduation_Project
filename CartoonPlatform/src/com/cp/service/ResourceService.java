package com.cp.service;

import com.cp.bean.ResourceBean;
import com.cp.dao.ResourceDealDao;

public class ResourceService {

	public ResourceBean SearchInfo(int file_id) {
		// TODO Auto-generated method stub
		ResourceBean file_info = new ResourceBean();
		ResourceDealDao search_info = new ResourceDealDao();
		file_info = search_info.FileInfo(file_id);
		return file_info;
	}

}
