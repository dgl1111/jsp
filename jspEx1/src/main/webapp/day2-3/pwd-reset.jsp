<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="db2.jsp"%>	
	<%
		ResultSet rs = null;
		Statement stmt = null;
		String userId = request.getParameter("userId");
		
		try{
			stmt = conn.createStatement();
			String querytext = "UPDATE TBL_USER SET " + "cnt = 0 " + "WHERE userId = '" + userId + "'";
			stmt.executeUpdate(querytext);
			

		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>
</body>
</html>
<script>
	alert("초기화 되었습니다.");
	window.close();
	window.opener.fnReload();
	/* 부모에 있는 함수를 호출할수있다. */
</script>