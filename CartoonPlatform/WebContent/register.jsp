<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>动漫交流平台(･ω･)ﾉ</title>
<link rel="stylesheet" media="screen" href="css/css.css" />
</head>
<script type="text/javascript">
//function Submit(){
	
	//window.location.href="RegisterServlet?param=hrefMethod";
//}
</script>


<form id="msform" action="RegisterServlet" method="post">

	<!-- progressbar -->
	<ul id="progressbar">
		<li class="active">Account Setup</li>
		<li>Personal Profiles</li>
		<li>Contact Information</li>
	</ul>
	<!-- fieldsets -->
	<fieldset>
		<h2><class="fs-title">注册您的账户(oﾟ▽ﾟ)o  </h2>
		<h3><class="fs-subtitle">第一步(｀・ω・´)</h3>
		<input type="text" name="register_id" id="register_id" placeholder="这里输入账号" />
		<input type="password" name="register_pwd" id="register_pwd" placeholder="这里输入输入密码" />
		<input type="password" name="register_repwd" id="register_repwd" placeholder="再输入一次密码" />
		<input type="button" name="next" class="next action-button" value="Next" />
	</fieldset>
	<fieldset>
		<h2 class="fs-title">完善个人信息(o´ω`o)ﾉ</h2>
		<h3 class="fs-subtitle">第二步( • ̀ω•́ )✧</h3>
		<input type="text" name="register_name" id="register_name" placeholder="为自己起一个昵称" />
		<input type="text" name="register_sex" id="register_sex" placeholder="这里输入性别" />
		<input type="text" name="register_age" id="register_age" placeholder="您今年贵庚啦" />
		<input type="button" name="previous" class="previous action-button" value="Previous" />
		<input type="button" name="next" class="next action-button" value="Next" />
	</fieldset>
	<fieldset>
		<h2 class="fs-title">联系方式(o°ω°o)</h2>
		<h3 class="fs-subtitle">最后一步∠( °ω°)／ </h3>
		<input type="text" name="register_email" id="register_email" placeholder="这里输入邮箱" />
		<input type="text" name="register_telephone" id="register_telephone" placeholder="这里输入电话号码" />
		<textarea name="address" placeholder="Address"></textarea>
		<input type="button" name="previous" class="previous action-button" value="Previous" />
		<input type="submit" name="submit" class="action-button" value="Submit" /><!-- onClick="Submit()"   class="submit action-button"   -->
	</fieldset>
</form>

<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="js/jquery.easing.min.js" type="text/javascript"></script>
<script src="js/jQuery.time.js" type="text/javascript"></script>
<br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br>

</body>
</html>