<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, board.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/jquery-3.2.1.js"></script>
<script>
	var index = 0;
	var order = "";
	var time = "";

	function Request() {
		var requestParam = "";
		this.getParameter = function(param) {
			var url = unescape(location.href);
			var paramArr = (url.substring(url.indexOf("?") + 1, url.length))
					.split("&");

			for (var i = 0; i < paramArr.length; i++) {
				var temp = paramArr[i].split("=");

				if (temp[0].toUpperCase() == param.toUpperCase()) {
					requestParam = paramArr[i].split("=")[1];
					break;
				}
			}
			return requestParam;
		}
	}

	$(function() {
		var request = new Request();
		order = request.getParameter("order");
		time = request.getParameter("time");
		$(window).scroll(function() {
			var sh = $(window).scrollTop() + $(window).height();
			var dh = $(document).height();
			if (sh == dh) {
				index += 10;
				$.ajax({
					url : 'board.do',
					data : {
						index : index,
						order : order,
						time : time
					},
					success : function(data) {
						$('body').append(data);
					}
				})
			}
		})
		
		document.getElementById('hits').onclick=function() {
			location.href="board.do?index=0&order=hits&time="+time
		}
		
		document.getElementById('replyCnt').onclick=function() {
			location.href="board.do?index=0&order=commentCnt&time="+time
		}
		
		document.getElementById('date').onclick=function() {
			location.href="board.do?index=0&order=date&time="+time
		}
		
		document.getElementById('3hours').onclick=function() {
			time=3
			location.href="board.do?index=0&order=date&time="+time
		}
		
		document.getElementById('6hours').onclick=function() {
			time=6
			location.href="board.do?index=0&order=date&time="+time
		}
		
		document.getElementById('12hours').onclick=function() {
			time=12
			location.href="board.do?index=0&order=date&time="+time
		}
		
		document.getElementById('24hours').onclick=function() {
			time=24
			location.href="board.do?index=0&order=date&time="+time
		}
	});
</script>
<style>
@CHARSET "UTF-8";

.message-item {
	margin-bottom: 25px;
	margin-left: 40px;
	position: relative;
}

.message-item .message-inner {
	background: #fff;
	border: 1px solid #ddd;
	border-radius: 3px;
	padding: 10px;
	position: relative;
}

.message-item .message-inner:before {
	border-right: 10px solid #ddd;
	border-style: solid;
	border-width: 10px;
	color: rgba(0, 0, 0, 0);
	content: "";
	display: block;
	height: 0;
	position: absolute;
	left: -20px;
	top: 6px;
	width: 0;
}

.message-item .message-inner:after {
	border-right: 10px solid #fff;
	border-style: solid;
	border-width: 10px;
	color: rgba(0, 0, 0, 0);
	content: "";
	display: block;
	height: 0;
	position: absolute;
	left: -18px;
	top: 6px;
	width: 0;
}

.message-item:before {
	background: #fff;
	border-radius: 2px;
	bottom: -30px;
	box-shadow: 0 0 3px rgba(0, 0, 0, 0.2);
	content: "";
	height: 100%;
	left: -30px;
	position: absolute;
	width: 3px;
}

.message-item:after {
	background: #fff;
	border: 2px solid #ccc;
	border-radius: 50%;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
	content: "";
	height: 15px;
	left: -36px;
	position: absolute;
	top: 10px;
	width: 15px;
}

.clearfix:before, .clearfix:after {
	content: " ";
	display: table;
}

.message-item .message-head {
	border-bottom: 1px solid #eee;
	margin-bottom: 8px;
	padding-bottom: 8px;
}

.message-item .message-head .avatar {
	margin-right: 20px;
}

.message-item .message-head .user-detail {
	overflow: hidden;
}

.message-item .message-head .user-detail h5 {
	font-size: 16px;
	font-weight: bold;
	margin: 0;
}

.message-item .message-head .post-meta {
	float: left;
	padding: 0 15px 0 0;
}

.message-item .message-head .post-meta>div {
	color: #333;
	font-weight: bold;
	text-align: right;
}

.post-meta>div {
	color: #777;
	font-size: 12px;
	line-height: 22px;
}

.message-item .message-head .post-meta>div {
	color: #333;
	font-weight: bold;
	text-align: right;
}

.post-meta>div {
	color: #777;
	font-size: 12px;
	line-height: 22px;
}

img {
	min-height: 40px;
	max-height: 40px;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<input type="button" value="에펨코리아" />
	<input type="button" value="뽐뿌" />
	<input type="button" value="클리앙" /> <br/>

	<input id="hits" type="button" value="조회수" />
	<input id="replyCnt" type="button" value="추천수" />
	<input id="date" type="button" value="최신" />
	<br />
	<input id="3hours" type="button" value="3시간">
	<input id="6hours" type="button" value="6시간" />
	<input id="12hours" type="button" value="12시간" />
	<input id="24hours" type="button" value="24시간" />
	
	<input type="button" value="회원가입" />

	<c:forEach var="board" items="${requestScope.list }">
		<div class="qa-message-list" id="wallmessages">
			<div class="message-item" id="m16">
				<div class="message-inner">
					<div class="message-head clearfix">
						<div class="avatar pull-left">
							<a href="./index.php?qa=user&qa_1=Oleg+Kolesnichenko"><img
								src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png"></a>
						</div>
						<div class="user-detail">
							<h5 class="handle">${board.title }</h5>
							<div class="post-meta">
								<div class="asker-meta">
									<span class="qa-message-what"></span> <span
										class="qa-message-when"> <span
										class="qa-message-when-data">${board.date }</span>
									</span> <span class="qa-message-who"> <span
										class="qa-message-who-pad">by </span> <span
										class="qa-message-who-data"><a
											href="./index.php?qa=user&qa_1=Oleg+Kolesnichenko">${board.hits }</a></span>
									</span>
								</div>
							</div>
						</div>
					</div>
					<div class="qa-message-content">${board.content }</div>
				</div>
			</div>
		</div>
	</c:forEach>
</body>
</html>