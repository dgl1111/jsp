<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- setAttribute로 보내서 바로 꺼낼수있다. -->
    <c:choose>
        <c:when test="${user != null}">
            <p>하이! ${user.name}</p>
        </c:when>
        <c:otherwise>
            <p>없음</p>
        </c:otherwise>
    </c:choose>
</body>
</html>