<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	table, th,  tr,  td{
	 border : 1px solid black ;
	 border-collapse: collapse;
	 padding: 10px;
	}
	
</style>

</head>
<body>
	<div>
		<button onclick="location.href='list2.jsp'">게시판으로 이동</button>
	</div>
	<table>
		<tr>
			<th> 아이디 </th>
			<th> 이름 </th>
			<th> 권한 </th>
			<th> 비밀번호 </th>
		</tr>	
	 <!-- html 코드 -->
	 <%-- <%@ %> : 자바코드 	 --%>
	
	<%@include file="db2.jsp"%>	
	<%
	ResultSet rs = null;
	Statement stmt = null;
	String sessionstatus = (String) session.getAttribute("status");
	System.out.println(session.getAttribute("userId"));
	
	try{
		stmt = conn.createStatement();
		String querytext = "SELECT * FROM TBL_USER";
		rs = stmt.executeQuery(querytext);
	
	
	while (rs.next()) {
		String status = rs.getString("status").equals("A")?"관리자" : "일반회원";
	%>
		<tr>
			<td> <%= rs.getString("userId") %></td>
			<td> <%= rs.getString("name") %></td>
			<td> <%= status %></td>
		<% 
			if(rs.getInt("cnt") >= 5){
		%>
				<td><button onclick="fnReset('<%= rs.getString("userId")%>')">초기화</button></td>
		<% 		
			}else
		
		%>	
			
			
		</tr>
<%		
	}
	
	
	
	
	} catch(SQLException ex) {
		out.println("SQLException : " + ex.getMessage());
	}
%>
	</table>
</body>
</html>
<script>
	function fnReset(userId) {
		/* location.href = "pwd-reset.jsp?userId=" +userId; */
		window.open("pwd-reset.jsp?userId=" +userId, "reset", "width = 500", "height=500");
		/* 팝업으로 띄우기 */
		
	}
	
	function fnReload() {
		location.reload();
		/* reload: 내장된 객체. 화면 갱신, 새로고침 */
	}
	
	
</script>