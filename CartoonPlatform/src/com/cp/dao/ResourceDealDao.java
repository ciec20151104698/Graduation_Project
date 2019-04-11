package com.cp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cp.bean.ResourceBean;
import com.cp.util.DBUtil;
public class ResourceDealDao {
	public List selectResource() {
		Connection conn = DBUtil.getConnection();
		String sql = "select * from tb_resource";
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<ResourceBean> list = new ArrayList<ResourceBean>();
		try {
			pstm = conn.prepareStatement(sql);
			rs = pstm.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String resource_title = rs.getString("resource_title");
				String resource_content = rs.getString("resource_content");
				String resource_location = rs.getString("resource_location");
				String user_id = rs.getString("login_id");
				ResourceBean tl = new ResourceBean();
				tl.setResource_id(id);
				tl.setResource_title(resource_title);
				tl.setResource_content(resource_content);
				tl.setResource_location(resource_location);
				tl.setLogin_id(user_id);
				list.add(tl);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.CloseDB(conn, pstm, rs);
		}
		return list;
	}

	public ResourceBean FileInfo(int file_id) {
		// TODO Auto-generated method stub
		Connection conn = DBUtil.getConnection();
		String sql = "select * from tb_resource where resource_id=?";
		PreparedStatement pstm = null;
		ResultSet rs = null;
		ResourceBean tl = new ResourceBean();
		tl = null;
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, file_id);
			rs = pstm.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String resource_title = rs.getString("resource_title");
				String resource_name = rs.getString("resource_name");
				String resource_content = rs.getString("resource_content");
				String resource_location = rs.getString("resource_location");
				String user_id = rs.getString("login_id");
				
				tl.setResource_id(id);
				tl.setResource_name(resource_name);
				tl.setResource_title(resource_title);
				tl.setResource_content(resource_content);
				tl.setResource_location(resource_location);
				tl.setLogin_id(user_id);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.CloseDB(conn, pstm, rs);
		}
		return tl;
	}
}
