package com.cp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.cp.bean.UserBean;
import com.cp.util.DBUtil;

public class UserDao {

	public String logincheck(UserBean loginuser) {
		// TODO Auto-generated method stub
		Connection conn = DBUtil.getConnection();
		String sql = "select * from tb_user where login_id=? and login_pwd=?";
		String temp = "NO";
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1,loginuser.getLogin_id());
			pstm.setString(2,loginuser.getLogin_pwd());
			rs = pstm.executeQuery();
			while(rs.next()) {
				temp="YES";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.CloseDB(conn,pstm,rs);
		}
		return temp;
	}

	public UserBean searchinfo(String login_id) {
		// TODO Auto-generated method stub
		Connection conn = DBUtil.getConnection();
		String sql = "select * from tb_user where login_id=?;";
		UserBean user = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1,login_id);
			rs = pstm.executeQuery();
			while(rs.next()) {
				user = new UserBean();
				user.setLogin_id(rs.getString("login_id"));
				user.setLogin_pwd(rs.getString("login_pwd"));
				user.setLogin_name(rs.getString("login_name"));
				user.setLogin_sex(rs.getString("login_sex"));
				user.setLogin_age(rs.getString("login_age"));
				user.setLogin_email(rs.getString("login_email"));
				user.setLogin_type(rs.getString("login_type"));
				user.setLogin_telephone(rs.getString("login_telephone"));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.CloseDB(conn,pstm,rs);
		}
		return user;
	}

	public String CheckRegisterIdDao(String register_id) {
		// TODO Auto-generated method stub
		String result = "YES";
		Connection conn = DBUtil.getConnection();
		String sql = "select * from tb_user where login_id=?;";
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1,register_id);
			rs = pstm.executeQuery();
			while(rs.next()){
				result = "NO";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.CloseDB(conn,pstm,rs);
		}
		return result;
	}

	public void AddRegisterInfoDao(UserBean register_info) {
		// TODO Auto-generated method stub
		Connection conn = DBUtil.getConnection();
		String sql = "insert into tb_user(login_id,login_pwd,login_name,login_sex,login_age,login_email,login_telephone,login_type) values (?,?,?,?,?,?,?,?)";
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1,register_info.getLogin_id());
			pstm.setString(2,register_info.getLogin_pwd());
			pstm.setString(3,register_info.getLogin_name());
			pstm.setString(4,register_info.getLogin_sex());
			pstm.setString(5,register_info.getLogin_age());
			pstm.setString(6,register_info.getLogin_email());
			pstm.setString(7,register_info.getLogin_telephone());
			pstm.setString(8,"user");
			
			pstm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.CloseDB(conn,pstm,rs);
		}
	}

}
