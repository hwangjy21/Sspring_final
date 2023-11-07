<%@page language="java" contentType="text/html; charset=UTF-8"
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
<div class="container">
<h4 class="mb-3">Custom Login Page</h4>
<form action="/member/login" method="post">
	<div class="mb-3">
	  <label for="e" class="form-label">email</label>
	  <input type="email" class="form-control" name="email" id="e" placeholder="example@OOO.com">
	</div>
	<div class="mb-3">
	  <label for="p" class="form-label">pwd</label>
	  <input type="password" class="form-control" name="pwd" id="p" placeholder="password">
	</div>

	<%-- <c:if test="${not empty param.errMsg }">
		<div class="text-danger mb-3">
			<c:choose>
				<c:when test="${param.errMsg eq 'Bad credentials' }">
					<c:set var="errText" value="이메일 & 비밀번호가 일치하지 않습니다."/>
				</c:when>
				<c:otherwise>
					<c:set var="errText" value="관리자에게 문의해주세요."/>
				</c:otherwise>
			</c:choose>
			
			${errText }
		</div>
	</c:if> --%>
	
	<button class="w-100 btn btn-primary btn-lg my-5" type="submit">Log in</button>
	
</form>
</div>

<%-- <jsp:include page="../common/footer.jsp" />
<script type="text/javascript">
const isOk = `<c:out value="${isOk}" />`;
if(isOk > 0){
	alert("회원정보 수정 완료~!!  다시 로그인하세요.");
}
</script> --%>
</body>
</html>