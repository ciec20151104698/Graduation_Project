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
		String sql = "select * from tb_article where user_type =?";
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
}
