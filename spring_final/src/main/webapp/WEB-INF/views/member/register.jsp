<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />
<!-- email, pwd, nick_name -->
<div class="container">
<h4 class="mb-3">Input your Information</h4>
<form action="/member/register" method="post">
	<div class="mb-3">
	  <label for="e" class="form-label">email</label>
	  <input type="email" class="form-control" name="email" id="e" placeholder="example@OOO.com">
	</div>
	<div class="mb-3">
	  <label for="p" class="form-label">pwd</label>
	  <input type="password" class="form-control" name="pwd" id="p" placeholder="password">
	</div>
	<div class="mb-3">
	  <label for="n" class="form-label">nick_name</label>
	  <input type="text" class="form-control" name="nickName" id="n" placeholder="password">
	</div>
	<button class="w-100 btn btn-primary btn-lg my-5" type="submit">Register</button>
</form>
</div>
<jsp:include page="../common/footer.jsp" />
</body>
</html>