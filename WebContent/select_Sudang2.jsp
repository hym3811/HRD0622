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
		<h3 id="title">수당 정보 조회</h3>
		<hr>
		<table id="select_Tab" border=2 style="text-align:center;">
			<tr>
				<th>No</th>
				<th>사원번호</th>
				<th>이름</th>
				<th>급여</th>
				<th>가족수당</th>
				<th>직책수당</th>
				<th>근속합계</th>
				<th>기타수당</th>
				<th>급여합계</th>
			</tr>
		<%
			Integer no=0;String id=null;String name=null;
			Integer gajok=0;Integer jikchak=0;Integer gunsok=0;
			Integer gitasudang=0;Integer total=0;Integer salary=0;
			DecimalFormat df=new DecimalFormat("#,###");
			try{
				sql="select a.id,a.name,c.salary,b.gajok,b.jikchak,b.gunsok,b.gitasudang from info0622 a join sudang0622 b on a.id=b.id join hobong0622 c on a.position=c.grade";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next()){
					no++;
					id=rs.getString(1);
					name=rs.getString(2);
					salary=rs.getInt(3);
					gajok=rs.getInt(4);
					jikchak=rs.getInt(5);
					gunsok=rs.getInt(6);
					gitasudang=rs.getInt(7);
					total=salary+gajok+jikchak+gunsok+gitasudang;
		%>
			<tr>
				<td><%=no %></td>
				<td><%=id %></td>
				<td><%=name %></td>
				<td style="text-align:right!important;"><%=df.format(salary) %></td>
				<td style="text-align:right!important;"><%=df.format(gajok) %></td>
				<td style="text-align:right!important;"><%=df.format(jikchak) %></td>
				<td style="text-align:right!important;"><%=df.format(gunsok) %></td>
				<td style="text-align:right!important;"><%=df.format(gitasudang) %></td>
				<td style="text-align:right!important;"><%=df.format(total) %></td>
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