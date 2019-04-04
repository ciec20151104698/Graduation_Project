<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.cp.bean.UserBean"%>
<%@page import="com.cp.dao.UserDao"%>
<%@page import="com.cp.dao.CommunicationDealDao,com.cp.bean.ArticleBean"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	UserBean userinfo = (UserBean) request.getSession().getAttribute("USERINFO");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>GP-CP</title>

<link rel="shortcut icon" href="images/favicon.png" />




<!-- Style Sheet-->
<link rel="stylesheet" href="style.css" />
<link rel='stylesheet' id='bootstrap-css-css'
	href='css/bootstrap5152.css?ver=1.0' type='text/css' media='all' />
<link rel='stylesheet' id='responsive-css-css'
	href='css/responsive5152.css?ver=1.0' type='text/css' media='all' />
<link rel='stylesheet' id='pretty-photo-css-css'
	href='js/prettyphoto/prettyPhotoaeb9.css?ver=3.1.4' type='text/css'
	media='all' />
<link rel='stylesheet' id='main-css-css' href='css/main5152.css?ver=1.0'
	type='text/css' media='all' />
<link rel='stylesheet' id='custom-css-css'
	href='css/custom5152.html?ver=1.0' type='text/css' media='all' />


<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
                <script src="js/html5.js"></script></script>
                <![endif]-->
<title>Insert title here</title>
</head>
<body>
	<!-- Start of Header -->
	<div class="header-wrapper">
		<header>
		<div class="container">


			<div class="logo-container">
				<!-- Website Logo -->
				<a href="index-2.html" title="Knowledge Base Theme"> <img
					src="images/logo.png" alt="Knowledge Base Theme">
				</a> <span class="tag-line">当前登录用户：<%=userinfo.getLogin_name()%></span>
			</div>


			<!-- Start of Main Navigation -->
			<nav class="main-nav">
			<div class="menu-top-menu-container">
				<ul id="menu-top-menu" class="clearfix">
					<li class="current-menu-item"><a href="../../../index.jsp">首页</a></li>
					<li><a href="home-categories-articles.html">热门</a></li>
					<li><a href="articles-list.html">看帖</a></li>
					<li><a href="contact.html">发帖</a></li>
					<li><a href="../../question_index/question_index.jsp">问题反馈</a></li>
				</ul>
			</div>
			</nav>
			<!-- End of Main Navigation -->

		</div>
		</header>
	</div>
	<!-- End of Header -->



	<!-- Start of Search Wrapper -->
	<div class="search-area-wrapper">
		<div class="search-area container">
			<h3 class="search-header">Have a Question?</h3>
			<p class="search-tag-line">If you have any question you can ask
				below or enter what you are looking for!</p>

			<form id="search-form" class="search-form clearfix" method="get"
				action="#" autocomplete="off">
				<input class="search-term required" type="text" id="s" name="s"
					placeholder="Type your search terms here"
					title="* Please enter a search term!" /> <input class="search-btn"
					type="submit" value="Search" />
				<div id="search-error-container"></div>
			</form>
		</div>
	</div>
	<!-- End of Search Wrapper -->



	<!-- Start of Page Container -->
	<div class="page-container">
		<div class="container">
			<div class="row">

				<!-- start of page content -->
				<%
					String article = request.getParameter("article_id");
					CommunicationDealDao find = new CommunicationDealDao();
					ArticleBean host = find.selecthost(article);
					System.out.println(article);
					request.setAttribute("HOSTARTICLEID", article);
				%>
				<div class="span8 page-content">

					<ul class="breadcrumb">
						<li><a href="#">Knowledge Base Theme</a><span class="divider">/</span></li>
						<li><a href="#"
							title="View all posts in Server &amp; Database">Server &amp;
								Database</a>
					</ul>

					<article class=" type-post format-standard hentry clearfix">

					<h1 class="post-title">
						<a href="#"><%=host.getCommunication_title()%></a>
					</h1>

					<div class="post-meta clearfix">
						<span class="date">25 Feb, 2013</span> <span class="category"><a
							href="#" title="View all posts in Server &amp; Database">Server
								&amp; Database</a></span> <span class="comments"><a href="#"
							title="Comment on Integrating WordPress with Your Website">3
								Comments</a></span> <span class="like-count">66</span>
					</div>
					<!-- end of post meta -->

					<p><%=host.getCommunication_content()%></p>
					<section id="comments">


					<ol class="commentlist">

						<li class="comment even thread-even depth-1" id="li-comment-2">
							<article id="comment-2"> <a href="#"> <img alt=""
								src="http://1.gravatar.com/avatar/50a7625001317a58444a20ece817aeca?s=60&amp;d=http%3A%2F%2F1.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D60&amp;r=G"
								class="avatar avatar-60 photo" height="60" width="60">
							</a> 
							<%
								String article_id = request.getParameter("article_id");
								CommunicationDealDao dao = new CommunicationDealDao();
								request.getSession().setAttribute("HOSTARTICLEID",article_id);
								List<ArticleBean> list = dao.selectReply(article_id);
								for (ArticleBean tl : list) {
									
							%>
							<div class="comment-meta">

								<h5 class="author">
									<cite class="fn"> <a href="#" rel="external nofollow"
										class="url"><%=tl.getLogin_name()%></a>
									</cite>
								</h5>

								<p class="date">
									<a href="#"> <time datetime="2013-02-26T13:18:47+00:00">February
										26, 2013 at 1:18 pm</time>
									</a>
								</p>

							</div>
							<!-- end .comment-meta -->

							<div class="comment-body">
								<p><%=tl.getCommunication_content()%></p>
							</div>
							<!-- end of comment-body --> </article> <!-- end of comment -->
							<%
								}
							%>
						</li>
					</ol>

					<div id="respond">

						<h3>Leave a Reply</h3>

						<div class="cancel-comment-reply">
							<a rel="nofollow" id="cancel-comment-reply-link" href="#"
								style="display: none;">Click here to cancel reply.</a>
						</div>


						<form action="../../../ReplyServlet" method="post" id="commentform">


							<p class="comment-notes">
								Your email address will not be published. Required fields are
								marked <span class="required">*</span>
							</p>

							<div>
								<label for="comment">Comment</label>
								<textarea class="span8" name=reply_content id="comment" cols="58"
									rows="10"></textarea>
							</div>

							<div>
								<input class="btn" name="submit" type="submit" id="submit"
									value="Submit Comment">
							</div>

						</form>

					</div>

					</section><!-- end of comments -->
				</div>
				<!-- end of page content -->


				<!-- start of sidebar -->
				<aside class="span4 page-sidebar"> <section class="widget">
				<div class="support-widget">
					<h3 class="title">Support</h3>
					<p class="intro">Need more support? If you did not found an
						answer, contact us for further help.</p>
				</div>
				</section> <section class="widget">
				<h3 class="title">Featured Articles</h3>
				<ul class="articles">
					<li class="article-entry standard">
						<h4>
							<a href="single.html">Integrating WordPress with Your Website</a>
						</h4> <span class="article-meta">25 Feb, 2013 in <a href="#"
							title="View all posts in Server &amp; Database">Server &amp;
								Database</a></span> <span class="like-count">66</span>
					</li>
					<li class="article-entry standard">
						<h4>
							<a href="single.html">WordPress Site Maintenance</a>
						</h4> <span class="article-meta">24 Feb, 2013 in <a href="#"
							title="View all posts in Website Dev">Website Dev</a></span> <span
						class="like-count">15</span>
					</li>
					<li class="article-entry video">
						<h4>
							<a href="single.html">Meta Tags in WordPress</a>
						</h4> <span class="article-meta">23 Feb, 2013 in <a href="#"
							title="View all posts in Website Dev">Website Dev</a></span> <span
						class="like-count">8</span>
					</li>
					<li class="article-entry image">
						<h4>
							<a href="single.html">WordPress in Your Language</a>
						</h4> <span class="article-meta">22 Feb, 2013 in <a href="#"
							title="View all posts in Advanced Techniques">Advanced
								Techniques</a></span> <span class="like-count">6</span>
					</li>
				</ul>
				</section>
				<h3 class="title">Recent Comments</h3>
				<ul id="recentcomments">
					<li class="recentcomments"><a href="#" rel="external nofollow"
						class="url">John Doe</a> on <a href="#">Integrating WordPress
							with Your Website</a></li>
					<li class="recentcomments">saqib sarwar on <a href="#">Integrating
							WordPress with Your Website</a></li>
					<li class="recentcomments"><a href="#" rel="external nofollow"
						class="url">John Doe</a> on <a href="#">Integrating WordPress
							with Your Website</a></li>
					<li class="recentcomments"><a href="#" rel="external nofollow"
						class="url">Mr WordPress</a> on <a href="#">Installing
							WordPress</a></li>
				</ul>
				</section> </aside>
				<!-- end of sidebar -->
			</div>
		</div>
	</div>
	<!-- End of Page Container -->

	<!-- Start of Footer -->
	<footer id="footer-wrapper">
	<div id="footer" class="container">
		<div class="row">

			<div class="span3">
				<section class="widget">
				<h3 class="title">How it works</h3>
				<div class="textwidget">
					<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
						sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna
						aliquam erat volutpat.</p>
					<p>Ut wisi enim ad minim veniam, quis nostrud exerci tation
						ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo
						consequat.</p>
				</div>
				</section>
			</div>


			<div class="span3">
				<section class="widget">
				<h3 class="title">Latest Tweets</h3>
				<div id="twitter_update_list">
					<ul>
						<li>No Tweets loaded !</li>
					</ul>
				</div>
				<script
					src="http://twitterjs.googlecode.com/svn/trunk/src/twitter.min.js"
					type="text/javascript"></script> <script type="text/javascript">
						getTwitters("twitter_update_list", {
							id : "960development",
							count : 3,
							enableLinks : true,
							ignoreReplies : true,
							clearContents : true,
							template : "%text% <span>%time%</span>"
						});
					</script> </section>
			</div>

			<div class="span3">
				<section class="widget">
				<h3 class="title">Flickr Photos</h3>
				<div class="flickr-photos" id="basicuse"></div>
				</section>
			</div>

		</div>
	</div>
	<!-- end of #footer --> <!-- Footer Bottom -->
	<div id="footer-bottom-wrapper">
		<div id="footer-bottom" class="container">
			<div class="row">
				<div class="span6">
					<p class="copyright">
						Copyright © 2013. All Rights Reserved by KnowledgeBase.Collect
						from <a href="http://www.cssmoban.com/" title="网页模板"
							target="_blank">网页模板</a>
					</p>
				</div>
				<div class="span6">
					<!-- Social Navigation -->
					<ul class="social-nav clearfix">
						<li class="linkedin"><a target="_blank" href="#"></a></li>
						<li class="stumble"><a target="_blank" href="#"></a></li>
						<li class="google"><a target="_blank" href="#"></a></li>
						<li class="deviantart"><a target="_blank" href="#"></a></li>
						<li class="flickr"><a target="_blank" href="#"></a></li>
						<li class="skype"><a target="_blank" href="skype:#?call"></a></li>
						<li class="rss"><a target="_blank" href="#"></a></li>
						<li class="twitter"><a target="_blank" href="#"></a></li>
						<li class="facebook"><a target="_blank" href="#"></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- End of Footer Bottom --> </footer>
	<!-- End of Footer -->

	<a href="#top" id="scroll-top"></a>

	<!-- script -->
	<script type='text/javascript' src='js/jquery-1.8.3.min.js'></script>
	<script type='text/javascript' src='js/jquery.easing.1.3.js'></script>
	<script type='text/javascript'
		src='js/prettyphoto/jquery.prettyPhoto.js'></script>
	<script type='text/javascript' src='js/jflickrfeed.js'></script>
	<script type='text/javascript' src='js/jquery.liveSearch.js'></script>
	<script type='text/javascript' src='js/jquery.form.js'></script>
	<script type='text/javascript' src='js/jquery.validate.min.js'></script>
	<script type='text/javascript' src='js/custom.js'></script>

</body>
</body>
</html>