package com.cp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.cp.util.DBUtil;

public class FileUploadDao {
	public void titleupload(String user_id, String filetitle,String filelocation_name,String filelocation) {
		// TODO Ausdto-generated method stub
		Connection conn = DBUtil.getConnection();
		String sql = "insert tb_resource SET resource_title=?,login_id=?,resource_name=?,resource_location=?";
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1,filetitle);
			pstm.setString(2,user_id);
			pstm.setString(3,filelocation_name);
			pstm.setString(4,filelocation);
			pstm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.CloseDB(conn,pstm,rs);
		}
	}
}
