<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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