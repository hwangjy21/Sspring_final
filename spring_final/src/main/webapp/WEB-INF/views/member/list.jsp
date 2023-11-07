<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<div class="container text-center">
<div class="row">

<c:forEach items="${memList }" var="mvo">
<div class="col">
	<div class="card" style="width: 18rem;">
	  <img src="/resources/image/dog1.jpg" class="card-img-top" alt="...">
	  <div class="card-body">
	    <h5 class="card-title">${mvo.nickName }</h5>
	    <p class="card-text">${mvo.email } </p>
		   <p>( <c:forEach items="${mvo.authList }" var="authList">
		     ${authList.auth }  
		    </c:forEach> )</p>
	    <a href="/member/modify?email=${mvo.email }" class="btn btn-primary">Go somewhere</a>
	  </div>
	</div>
</div>
</c:forEach>
</div>
</div>
<jsp:include page="../common/footer.jsp" />
</body>
</html>