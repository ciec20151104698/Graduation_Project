<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.cp.bean.UserBean"%>
<%
	UserBean userinfo = (UserBean) request.getSession().getAttribute("USERINFO");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="format-detection" content="telephone=no" />
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min_info.css">
<link rel="stylesheet" type="text/css" href="css/style_info.css">
<script type="text/javascript">
function _submits()
{
    var maincontent= $("#content").html();
    $("#submitcontent").val(maincontent);
}
</script>
</head>
<body>
	<nav class="navbar  navbar-fixed-top" role="navigation"
		style="background: #e0620d; padding-top: 3px; height: 50px;">
	<div class="container-fluid" style="background: #fff;">
		<div class="navbar-header ">
			<span class="navbar-brand " href="#">Resource</span>

			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#my-navbar-collapse">
				<span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
		</div>
		<form class="navbar-form navbar-left" role="search">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="#热门话题#">
				<i class="glyphicon glyphicon-search btn_search"></i>
				<!--  <button type="submit" class="btn btn-default">提交</button> -->
			</div>

		</form>

		<div class="collapse navbar-collapse" id="my-navbar-collapse">

			<ul class="nav navbar-nav navbar-right">
				<li><a href="#"><i class="glyphicon glyphicon-user"></i>&nbsp;&nbsp;<%=userinfo.getLogin_name()%></a></li>

				<li class="dropdown"><a href="page/admin_index/index.jsp" class="dropdown-toggle"
					data-toggle="dropdown"> 设置 <b class="caret"></b>
				</a>
					<ul class="dropdown-menu">
						<li><a href="#">登录</a></li>
						<li><a href="#">注册</a></li>

					</ul></li>
			</ul>

		</div>


	</div>
	<hr style="margin: 0; padding: 0; color: #222; width: 100%">
	</nav>

	<div class="container container_bg">
		<div class="row">
			<div class="col-sm-2"></div>

			<div class="col-sm-6 col-xs-12 my_edit">
				<div class="row" id="edit_form">
					<span class="pull-left" style="margin: 15px;">编写新鲜事</span> <span
						class="tips pull-right" style="margin: 15px;"></span>
					<form style="margin-top: 50px;" action="ContentIssueServlet"
						method="post">
						<div class="form-group">
							<div class="col-sm-12">
								<input type="text" class="form-control" name="title"
									placeholder="话题">
								<div contentEditable="true" id="content" name="content"
									class="form-control "></div>
							</div>
							<div class="col-sm-12" style="margin-top: 12px;">
								<span class="emoji">表情</span> <span class="pic">图片 </span> <span>
									<input type="file" name="" class="select_Img"
									style="display: none"> <img class="preview" src="">
								</span>


								<div class="myEmoji">
									<ul id="myTab" class="nav nav-tabs">
										<li class="active"><a href="#set" data-toggle="tab">
												预设 </a></li>
										<li><a href="#hot" data-toggle="tab">热门</a></li>

									</ul>
									<div id="myTabContent" class="tab-content">
										<div class="tab-pane fade in active" id="set">
											<div class="emoji_1"></div>

										</div>
										<div class="tab-pane fade" id="hot">
											<div class="emoji_2"></div>
										</div>

									</div>
								</div>
								<!-- <span> <input type="file" id="selectImg" value=""></input> </span> -->
								<%-- String user_id =userinfo.getLogin_name();
									request.setAttribute("FileUserId", user_id);
								--%>

								<input type=hidden name="submitcontent" id="submitcontent">
								<button type="submit" id="send"
									class="btn btn-default pull-right disabled"
									onclick="_submits()">发布</button>

							</div>
						</div>
					</form>
				</div>

				<%--<form
				action="${pageContext.request.contextPath}/com.rp.servlet/UploadServlet"
				enctype="multipart/form-data" method="post">
				<input type="text" class="form-control" name="title"
					placeholder="资源名"> 上传用户：<input type="text" name="username"><br />
				上传文件1：<input type="file" name="file1"><br /> 上传文件2：<input
					type="file" name="file2"><br />
				<button type="submit" id="send"
					class="btn btn-default pull-right disabled">提交</button>

			</form> --%>
				<div class="row item_msg">
					<%-- <div class="col-sm-12 col-xs-12 message">
						<img src="img/icon.png" class="col-sm-2 col-xs-2"
							style="border-radius: 50%">
						<div class="col-sm-10 col-xs-10">
							<span style="font-weight: bold;"><%=user.getUser_name()%></span>
							<br> <small class="date" style="color: #999">1分钟前</small>
							<div class="msg_content">
								happy day! <img class="mypic" src="img/bg_1.jpg">
							</div>

						</div>

					</div>--%>

					<div class="col-sm-12 col-xs-12 message">
						<form action="UploadServlet" enctype="multipart/form-data"
							method="post">
							<input type="text" class="form-control" id="file_title" name="file_title"
								placeholder="资源名"> 上传文件：<input type="file" name="file1"><br />
							<input type="submit" value="提交">
							<%
								String user_id = userinfo.getLogin_id();
								request.getSession().setAttribute("FileUserId", user_id);
							%>
						</form>
					</div>

				</div>


			</div>


			<div class="col-sm-3 col-xs-12 part_right">
				<div class="row text-center inform">
					<img src="img/icon.png" onclick="changeinfo.jsp">
					<h4 style="font-weight: bold;"><%=userinfo.getLogin_name()%></h4>
					<div class="col-sm-12 my_inform">
						<div class="col-sm-4 col-xs-4">
							<div>0</div>
							<div class="sort">关注</div>

						</div>
						<div class="col-sm-4 col-xs-4">
							<div>0</div>
							<div class="sort">粉丝</div>
						</div>
						<div class="col-sm-4 col-xs-4">
							<div>0</div>
							<div class="sort">博客</div>
						</div>
					</div>
				</div>
				<div class="row part_hot">
					<div class="col-sm-12">
						<span class="pull-left"
							style="padding: 10px; font-size: 16px; font-weight: bold;">热门话题</span>
						<span class="pull-right" style="padding: 10px;">换话题</span>
					</div>
					<hr style="margin: 0; padding: 0; width: 100%">

					<div class="col-sm-12 item_hot">
						<span class="pull-left">#英雄联盟s7#</span> <span
							class="pull-right item_num">34.6亿</span>
					</div>

					<div class="col-sm-12 item_hot">
						<span class="pull-left">#今天霜降#</span> <span
							class="pull-right item_num">2.6亿</span>
					</div>

					<div class="col-sm-12 item_hot">
						<span class="pull-left">#亚洲新歌榜#</span> <span
							class="pull-right item_num">10.4亿</span>
					</div>

					<div class="col-sm-12 item_hot">
						<span class="pull-left">#扑通扑通少女心#</span> <span
							class="pull-right item_num">1.5亿</span>
					</div>

					<div class="col-sm-12 item_hot">
						<span class="pull-left">#突然开心#</span> <span
							class="pull-right item_num">1.1亿</span>
					</div>
					<hr style="margin: 0; padding: 0; width: 100%">

					<div class="col-sm-12 text-center" style="padding: 10px">
						<a href="#">查看更多</a>
					</div>

				</div>

			</div>
		</div>


	</div>
	<script src="js/jquery-3.1.0.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function() {

			$("#content").keyup(
					function() {

						//判断输入的字符串长度
						var content_len = $("#content").text().replace(/\s/g,
								"").length;

						$(".tips").text("已经输入" + content_len + "个字");

						if (content_len == 0) {
							// alert(content);
							$(".tips").text("");
							$("#send").addClass("disabled");
							return false;
						} else {
							$("#send").removeClass("disabled");
						}
					});

			$(".pic").click(function() {

				$(".select_Img").click();

			})

			// 	function confirm(){

			// 		var r= new FileReader();
			// f=$(".select_Img").files[0];
			// r.readAsDataURL(f);
			// r.onload=function(e) {
			// 	$(".preview").src=this.result;

			// };
			// 	}

			//点击按钮发送内容
			$("#send")
					.click(
							function() {

								// var myDate = new Date();

								//   var min = myDate.getMinutes();

								//   var time = min-(min-1);

								//   //alert(time);

								var content = $("#content").html();

								//判断选择的是否是图片格式		 
								var imgPath = $(".imgPath").text();
								var start = imgPath.lastIndexOf(".");
								var postfix = imgPath.substring(start,
										imgPath.length).toUpperCase();

								if (imgPath != "") {

									if (postfix != ".PNG" && postfix != ".JPG"
											&& postfix != ".GIF"
											&& postfix != ".JPEG") {
										alert("图片格式需为png,gif,jpeg,jpg格式");
									} else {
										$(".item_msg")
												.append(
														"<div class='col-sm-12 col-xs-12 message' > <img src='img/icon.png' class='col-sm-2 col-xs-2' style='border-radius: 50%'><div class='col-sm-10 col-xs-10'><span style='font-weight: bold;''><%=userinfo.getLogin_name()%>
		</span> <br><small class='date' style='color:#999'>刚刚</small><div class='msg_content'>"
																+ content
																+ "<img class='mypic' onerror='this.src='img/bg_1.jpg' src='file:///"+imgPath+"' ></div></div></div>");
									}
								} else {
									$(".item_msg")
											.append(
													"<div class='col-sm-12 col-xs-12 message' > <img src='img/icon.png' class='col-sm-2 col-xs-2' style='border-radius: 50%'><div class='col-sm-10 col-xs-10'><span style='font-weight: bold;''>Jack.C</span> <br><small class='date' style='color:#999'>刚刚</small><div class='msg_content'>"
															+ content
															+ "</div></div></div>");
								}

							});

			//添加表情包1
			for (var i = 1; i < 60; i++) {

				$(".emoji_1")
						.append(
								"<img src='img/f"+i+".png' style='width:35px;height:35px' >");
			}
			//添加表情包2
			for (var i = 1; i < 61; i++) {

				$(".emoji_2")
						.append(
								"<img src='img/h"+i+".png' style='width:35px;height:35px' >");
			}

			$(".emoji")
					.click(
							function() {

								$(".myEmoji").show();

								//点击空白处隐藏弹出层
								$(document)
										.click(
												function(e) {

													if (!$("#edit_form").is(
															e.target)
															&& $("#edit_form")
																	.has(
																			e.target).length === 0) {

														$(".myEmoji").hide();
													}
												});

							});

			//将表情添加到输入框
			$(".myEmoji img")
					.each(
							function() {
								$(this)
										.click(
												function() {
													var url = $(this)[0].src;

													$('#content')
															.append(
																	"<img src='"+url+"' style='width:25px;height:25px' >");

													$("#send").removeClass(
															"disabled");
												})
							})

			//放大或缩小预览图片
			$(".mypic").click(function() {
				var oWidth = $(this).width(); //取得图片的实际宽度  
				var oHeight = $(this).height(); //取得图片的实际高度  

				if ($(this).height() != 200) {
					$(this).height(200);
				} else {
					$(this).height(oHeight + 200 / oWidth * oHeight);

				}

			})

		})
	</script>
</body>
</html>