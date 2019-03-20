package com.cp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cp.bean.ArticleBean;
import com.cp.util.DBUtil;

public class CommunicationDealDao {
	public List selectArticle() {
		Connection conn = DBUtil.getConnection();
		String sql = "select * from tb_communication where communication_type =?";
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<ArticleBean> list = new ArrayList<ArticleBean>();
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, "master");
			rs = pstm.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				int article_id = rs.getInt("communication_id");
				String article_title = rs.getString("communication_title");
				String article_content = rs.getString("communication_content");
				String user_id = rs.getString("login_id");
				ArticleBean tl = new ArticleBean();
				tl.setCommunication_id(article_id);
				tl.setCommunication_title(article_title);
				tl.setCommunication_content(article_content);
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
	
	public ArticleBean selecthost(String article) {
		Connection conn = DBUtil.getConnection();
		String sql = "select * from tb_communication where communication_id=? and communication_type =?";
		PreparedStatement pstm = null;
		ResultSet rs = null;
		ArticleBean tl = null;
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, article);
			pstm.setString(2, "master");
			rs = pstm.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				int article_id = rs.getInt("communication_id");
				String article_title = rs.getString("communication_title");
				String article_content = rs.getString("communication_content");
				String user_id = rs.getString("login_id");
				tl = new ArticleBean();
				tl.setCommunication_id(article_id);
				tl.setCommunication_title(article_title);
				tl.setCommunication_content(article_content);
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
	
	public List selectReply(String article) {
		// TODO Auto-generated method stub
		Connection conn = DBUtil.getConnection();
		String sql = "select * from tb_communication where communication_id=? and communication_type =?";
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<ArticleBean> list = new ArrayList<ArticleBean>();
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1,article);
			pstm.setString(2,"reply");
			rs = pstm.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				int article_id = rs.getInt("communication_id");
				String article_title = rs.getString("communication_title");
				String article_content = rs.getString("communication_content");
				String user_id = rs.getString("login_id");
				ArticleBean tl = new ArticleBean();
				tl.setCommunication_id(article_id);
				tl.setCommunication_title(article_title);
				tl.setCommunication_content(article_content);
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
	
	public String ContentAdd(String user_name,String main_title, String main_content) {
		// TODO Auto-generated method stub
		Connection conn = DBUtil.getConnection();
		String sql = "insert into tb_communication(login_id,communication_title,communication_content,communication_type) values (?,?,?,?)";
		String idset = "UPDATE tb_communication SET communication_id=id WHERE communication_title=? and communication_content=?";
		String temp = "NO";
		PreparedStatement pstm = null;
		PreparedStatement pstm_idset = null;
		ResultSet rs = null;
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, user_name);
			pstm.setString(2, main_title);
			pstm.setString(3, main_content);
			pstm.setString(4, "master");
			pstm.executeUpdate();
			
			pstm_idset = conn.prepareStatement(idset);
			pstm_idset.setString(1, main_title);
			pstm_idset.setString(2,main_content);
			pstm_idset.executeUpdate();
			temp = "YES";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.CloseDB(conn, pstm, rs);
		}
		return temp;
	}
	
	public String ReplyContentAdd(String host_article_id,String reply_id,String reply_title, String reply_content) {
		// TODO Auto-generated method stub
		Connection conn = DBUtil.getConnection();
		String sql = "insert into tb_communication(login_id,communication_title,communication_content,communication_type) values (?,?,?,?)";
		String idset = "UPDATE tb_article SET communication_id=(SELECT id from (SELECT * FROM tb_communication)AS temp WHERE communication_id=? and communication_type=?) WHERE login_id = ? and communication_title=?and communication_content=?";
		String temp = "NO";
		PreparedStatement pstm = null;
		PreparedStatement pstm_idset = null;
		ResultSet rs = null;
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, reply_id);
			pstm.setString(2, reply_title);
			pstm.setString(3, reply_content);
			pstm.setString(4, "reply");
			pstm.executeUpdate();
			
			pstm_idset = conn.prepareStatement(idset);
			pstm_idset.setString(1, host_article_id);
			pstm_idset.setString(2,"master");
			pstm_idset.setString(3, reply_id);
			pstm_idset.setString(4, reply_title);
			pstm_idset.setString(5, reply_content);
			pstm_idset.executeUpdate();
			
			temp = "YES";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.CloseDB(conn, pstm, rs);
		}
		return temp;
	}
}
