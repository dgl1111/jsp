<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
table, th, tr, td {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 10px;
}
</style>


</head>
<body>
	<%@include file="db2.jsp"%>	
	
	<!-- request안에 있는 param -->
	 <sql:query var="result" dataSource="${dataSource}">
        SELECT * FROM tbl_user WHERE userId = ? AND pwd = ?
        <sql:param value="${param.id}" />
		<sql:param value="${param.pwd}" />
    </sql:query>
	
					
	<c:choose>
		<c:when test="${result.rows[0] != null}">
					 <%-- 행이 0인건 result값이 없는경우 --%>
			<div>로그인 성공</div>
		</c:when>
		<c:otherwise>
			<div>로그인 실패</div>
		</c:otherwise>
	</c:choose>
	
	
	
	<div>
	<button onclick="location.href='login.jsp'">로그인 페이지로 이동</button>
	</div>
</body>
</html>