<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.cp.dao.CommunicationDealDao,com.cp.bean.ArticleBean"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%-- String article = request.getParameter("article_id"); --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/style_list.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function _submits()
{
    $("#submitreply").val(article);
}
</script>
</head>
<body>
	<div class="xt-table">
		<table cellpadding="0" cellspacing="0" border="0" bgcolor="#dcdcdc"
			width="100%">
			<tr>
				<th>楼主</th>
				<th>主题</th>
				<th colspan="7">内容</th>
			</tr>
			<%
				String article = request.getParameter("article_id");
				CommunicationDealDao find = new CommunicationDealDao();
				ArticleBean host = find.selecthost(article);
				System.out.println(article);
				request.setAttribute("HOSTARTICLEID",article);
				%>
			<tr class="xt-bg">
				<td><%=host.getLogin_id()%></td>
				<td><%=host.getCommunication_title()%></td>
				<td colspan="7"><%=host.getCommunication_content()%></td>
			</tr>
			<tr>
				<th>访客</th>
				<th>主题</th>
				<th colspan="7">回复</th>
			</tr>
			<%
				String article_id = request.getParameter("article_id");
				CommunicationDealDao dao = new CommunicationDealDao();
				request.getSession().setAttribute("HOSTARTICLEID",article_id);
				List<ArticleBean> list = dao.selectReply(article_id);
				for (ArticleBean tl : list) {
			%>
			<tr class="xt-bg">
				<td><%=tl.getLogin_id()%></td>
				<td><%=tl.getCommunication_title()%></td>
				<td colspan="7"><%=tl.getCommunication_content()%></td>
			</tr>
			<%
				}
			%>
			<form action="ReplyServlet" method="post">
			<tr class="xt-bg">
				<td>标题：</td>
				<td colspan="8"><input type="text" name="reply_title"></td>
			</tr>
			<tr class="xt-bg">
				<td>回复：</td>
				<td colspan="8"><input type="text" name="reply_content"></td>
			</tr>
			<tr class="xt-bg">
				<td colspan="9">
				<input type=hidden name="submitreply" id="submitreply">
				<button type="submit" name="reply_submit"
					onClick="window.location.href='ReplyServlet?article_id=<%=article_id%>'">提交</button></td>
			</tr>
			</form>
		</table>
	</div>
</body>
</html>