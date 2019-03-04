<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>动漫交流平台(･ω･)ﾉ</title>
<link rel="stylesheet" media="screen" href="css/css.css" />
</head>
<script type="text/javascript">
//function Submit(){
	
	//window.location.href="RegisterServlet?param=hrefMethod";
//}
</script>
<div style="display:none"><p>jQueryÊÇÏÖÔÚ×îÁ÷ÐÐµÄJavaScript¹¤¾ß¿â¡£</p><p>¾ÝÍ³¼Æ£¬Ä¿Ç°È«ÊÀ½ç57.3%µÄÍøÕ¾Ê¹ÓÃËü¡£Ò²¾ÍÊÇËµ£¬10¸öÍøÕ¾ÀïÃæ£¬ÓÐ6¸öÊ¹ÓÃjQuery¡£Èç¹ûÖ»¿¼²ìÊ¹ÓÃ¹¤¾ß¿âµÄÍøÕ¾£¬Õâ¸ö±ÈÀý¾Í»áÉÏÉýµ½¾ªÈËµÄ91.7%¡£</p><p>ËäÈ»jQueryÈç´ËÊÜ»¶Ó­£¬µ«ÊÇËüÓ·Ö×µÄ<a href="http://mathiasbynens.be/demo/jquery-size" target="_blank" data-mce-href="http://mathiasbynens.be/demo/jquery-size">Ìå»ý</a>Ò²ÈÃÈËÍ·Í´²»ÒÑ¡£jQuery 2.0µÄÔ­Ê¼´óÐ¡Îª235KB£¬ÓÅ»¯ºóÎª81KB£»Èç¹ûÊÇÖ§³ÖIE6¡¢7¡¢8µÄjQuery 1.8.3£¬Ô­Ê¼´óÐ¡Îª261KB£¬ÓÅ»¯ºóÎª91KB¡£</p><p>ÕâÑùµÄÌå»ý£¬¼´Ê¹ÊÇ¿í´ø»·¾³£¬ÍêÈ«¼ÓÔØÒ²ÐèÒª1Ãë»ò¸ü³¤£¬¸ü²»ÒªËµÒÆ¶¯Éè±¸ÁË¡£ÕâÒâÎ¶×Å£¬Èç¹ûÄãÊ¹ÓÃÁËjQuery£¬ÓÃ»§ÖÁÉÙÑÓ³Ù1Ãë£¬²ÅÄÜ¿´µ½Íø Ò³Ð§¹û¡£¿¼ÂÇµ½±¾ÖÊÉÏ£¬jQueryÖ»ÊÇÒ»¸ö²Ù×÷DOMµÄ¹¤¾ß£¬ÎÒÃÇ²»½öÒªÎÊ£ºÈç¹ûÖ»ÊÇÎªÁË¼¸¸öÍøÒ³ÌØÐ§£¬ÊÇ·ñÓÐ±ØÒª¶¯ÓÃÕâÃ´´óµÄ¿â£¿</p></div>

<form id="msform" action="RegisterServlet" method="post">

	<!-- progressbar -->
	<ul id="progressbar">
		<li class="active">Account Setup</li>
		<li>Social Profiles</li>
		<li>Personal Details</li>
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
		<input type="submit" name="submit" class="submit action-button" value="Submit" /><!-- onClick="Submit()" -->
	</fieldset>
</form>
<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="js/jquery.easing.min.js" type="text/javascript"></script>
<script src="js/jQuery.time.js" type="text/javascript"></script>
<br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br>

</body>
</html>