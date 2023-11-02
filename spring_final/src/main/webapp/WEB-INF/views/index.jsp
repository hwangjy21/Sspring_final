<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<jsp:include page="common/header.jsp" />
<jsp:include page="common/nav.jsp" />
<div class="container my-3">
<h3>Spring makes programming Java quicker, easier, and safer for everybody. Spring’s focus on speed, simplicity, and productivity has made it the world's most popular Java framework. </h3>
</div>
<script type="text/javascript">
const isOk = `<c:out value="${isOkDel}" />`;
if(isOk > 0){
	alert("회원탈퇴 완료~!! 안녕히가세요.");
}
</script>
<jsp:include page="common/footer.jsp" />
</body>
</html>
