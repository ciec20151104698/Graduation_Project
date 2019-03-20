<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.cp.dao.CommunicationDealDao,com.cp.bean.ArticleBean"%>
<%@page import="com.cp.bean.UserBean"%>
<%UserBean user = (UserBean)request.getSession().getAttribute("USERINFO");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/style_list.css" rel="stylesheet" type="text/css">
</head>

<script>
	function windowHeight() {
		var de = document.documentElement;
		return self.innerHeight || (de && de.clientHeight)
				|| document.body.clientHeight;
	}
	window.onload = window.onresize = function() {
		var wh = windowHeight();
		document.getElementById("xt-left").style.height = document
				.getElementById("xt-right").style.height = (wh - document
				.getElementById("xt-top").offsetHeight)
				+ "px";
	}
</script>

<body>
	<!-- top -->
	<div id="xt-top">
		<div class="xt-logo">
			<img src="images/logo.png" />
		</div>
		<div class="xt-geren">
			<div class="xt-exit">
				<span class="xt-span">您好!欢迎<span class="xt-yanse"><%=user.getLogin_name() %></span>登录管理中心
				</span><a href="#" class="help">帮助</a> <a href="#" class="exit">退出</a>
			</div>
		</div>
	</div>
	<!-- left -->
	<div class="xt-center">
		<div id="xt-left">
			<div class="xt-logo"></div>
			<div class="xt-menu">
				<ul>
					<li><a href="noteList.jsp" class="hover"><em class="one"></em>资源论坛</a></li>
				</ul>
				<ul>
					<li><a href="ListFileServlet" class="hover"><em class="one"></em>资源分享</a></li>
				</ul>
				<div class="xt-menu-list"></div>
				<ul>
					<li><a href="changeinfo.jsp"><em class="two"></em>个人信息</a></li>
				</ul>
				<ul>
					<li><a href="#"><em class="three"></em>注销</a></li>
				</ul>
			</div>
		</div>
		<!-- right -->
		<div id="xt-right">
			<div class="xt-bt">首页 > 资源论坛 </div>
			<div class="xt-fenye">
				<div class="xt-fenye-left">欢迎进入交流区</div>
				<div class="xt-fenye-right"><a href="person.jsp" class="xt-link">创建帖子</a></div>
			</div>
			<div class="xt-table">
				<table cellpadding="0" cellspacing="0" border="0" bgcolor="#dcdcdc"
					width="100%">
					<tr>
						<th>发布者</th>
						<th colspan="7">帖子</th>
						<th colspan="2">发布时间</th>
					</tr>
					<%
						CommunicationDealDao dao = new CommunicationDealDao();
						List<ArticleBean> list = dao.selectArticle();
						for (ArticleBean tl : list) {
							int artical_id = tl.getCommunication_id();
					%>
					<tr class="xt-bg" onClick="window.location.href='reply.jsp?article_id=<%=article_id%>'">
						<td><%=tl.getLogin_id()%></td>
						<td colspan="7"><%=tl.getCommunication_title()%></td>
						<td colspan="2">当前固定时间</td>
					</tr>
					<%
						}
					%>

				</table>
			</div>
			<div class="xt-fenye">
				<div class="xt-fenye-left">当前第 1 / 270 页,每页10条，共 2696条记录</div>
				<div class="xt-fenye-right">
					<a href="#">首页</a> <a href="#">上一步</a> <a href="#">下一步</a> <a
						href="#">尾页</a> <input type="text" name="text" /> <a href="#"
						class="xt-link">跳转</a>
				</div>
			</div>
		</div>
	</div>

</body>
</html>