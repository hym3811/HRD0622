<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp"    %>
<%@ include file="DBConn.jsp" %>
<section>
	<form name=form>
		<h3 id="title">사원 정보 조회</h3>
		<hr>
		<table id="select_Tab" border=2 style="text-align:center;">
			<tr>
				<th>No</th>
				<th>사번</th>
				<th>성명</th>
				<th>직급</th>
				<th>직책</th>
				<th>연락처</th>
				<th>소속부서</th>
				<th>주소</th>
			</tr>
			<%
				Integer no=0;
				String id=null;
				String name=null;
				String position=null;
				String duty=null;
				String phone=null;
				String dept=null;
				String address=null;
				try{
					sql="select id,name,position,duty,phone,dept,address from info0622";
					pstmt=conn.prepareStatement(sql);
					rs=pstmt.executeQuery();
					while(rs.next()){
						no++;
						id=rs.getString(1);
						name=rs.getString(2);
						position=rs.getString(3)+"급";
						duty=rs.getString(4);
						phone=rs.getString(5);
						dept=rs.getString(6);
						address=rs.getString(7);
			%>
			<tr>
				<td><%=no %></td>
				<td><a id="a2" href="update_Member.jsp?id=<%=id%>"><%=id %></a></td>
				<td><%=name %></td>
				<td><%=position %></td>
				<td><%=duty %></td>
				<td><%=phone %></td>
				<td><%=dept %></td>
				<td><%=address %></td>
			</tr>
			<%
					}
				}catch(Exception e){
					e.printStackTrace();
				}
			%>
		</table>
	</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>