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
		<h3 id="title">호봉 정보 조회</h3>
		<hr>
		<table id="select_Tab" border=2 style="text-align:center;">
			<tr>
				<th>No</th>
				<th>등급</th>
				<th>급여</th>
			</tr>
			<%
				Integer no=0;
				String grade=null;
				Integer salary=0;
				DecimalFormat df=new DecimalFormat("#,###");
				try{
					sql="select * from hobong0622";
					pstmt=conn.prepareStatement(sql);
					rs=pstmt.executeQuery();
					while(rs.next()){
						no++;
						grade=rs.getString(1)+"급";
						salary=rs.getInt(2);
			%>
			<tr>
				<td><%=no %></td>
				<td><a id="a2" href="add_Hobong.jsp?grade=<%=grade%>"><%=grade %></a></td>
				<td style="text-align:right!important;"><%=df.format(salary) %></td>
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