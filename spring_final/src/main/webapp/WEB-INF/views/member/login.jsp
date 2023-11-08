<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Custom Login Page</title>
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap">
<style type="text/css">

body, h1, h4, p, label {
	margin: 0;
	padding: 0;
}


body {
	font-family: 'Noto Sans KR', sans-serif;
}


body {
	background-color: #1BBC9B;
}


.container {
	margin: 0 auto;
	width: 300px;
	background-color: #EEEFF1;
	border-radius: 5px;
	text-align: center;
	padding: 20px;
}


input {
	width: 100%;
	padding: 10px;
	box-sizing: border-box;
	border-radius: 5px;
	border: none;
	margin-bottom: 10px;
}


button#btn {
	background-color: #1BBC9B;
	color: white;
	width: 100%;
	padding: 10px;
	border: none;
	border-radius: 5px;
	margin-bottom: 30px;
	cursor: pointer;
}


a {
	text-decoration: none;
	color: #9B9B9B;
	font-size: 12px;
}


.text-danger {
	color: red;
	margin-bottom: 10px;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/nav.jsp" />
	<div class="container">
		<h4 class="mb-3">Custom Login Page</h4>
		<form action="/member/login" method="post">
			<div class="mb-3">
				<label for="e" class="form-label">Email</label> <input type="email"
					class="form-control" name="email" id="e"
					placeholder="example@OOO.com">
			</div>
			<div class="mb-3">
				<label for="p" class="form-label">Password</label> <input
					type="password" class="form-control" name="pwd" id="p"
					placeholder="password">
			</div>
			<c:if test="${not empty param.errMsg }">
				<div class="text-danger mb-3">
					<c:choose>
						<c:when test="${param.errMsg eq 'Bad credentials' }">
							<c:set var="errText"
								value="Invalid email & password combination." />
						</c:when>
						<c:otherwise>
							<c:set var="errText" value="Please contact the administrator." />
						</c:otherwise>
					</c:choose>
					${errText }
				</div>
			</c:if>
			<button id="btn" class="btn btn-primary btn-lg my-5" type="submit">Log
				in</button>
		</form>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>
