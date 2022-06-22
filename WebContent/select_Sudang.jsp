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
				<th>가족수당</th>
				<th>직책수당</th>
				<th>근속합계</th>
				<th>기타수당</th>
				<th>수당합계</th>
				<th style="width:8%;">구분</th>
			</tr>
		<%
			Integer no=0;String id=null;String name=null;
			Integer gajok=0;Integer jikchak=0;Integer gunsok=0;
			Integer gitasudang=0;Integer total=0;
			DecimalFormat df=new DecimalFormat("#,###");
			try{
				sql="select a.id,a.name,b.gajok,b.jikchak,b.gunsok,b.gitasudang from info0622 a join sudang0622 b on a.id=b.id";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next()){
					no++;
					id=rs.getString(1);
					name=rs.getString(2);
					gajok=rs.getInt(3);
					jikchak=rs.getInt(4);
					gunsok=rs.getInt(5);
					gitasudang=rs.getInt(6);
					total=gajok+jikchak+gunsok+gitasudang;
		%>
			<tr>
				<td><%=no %></td>
				<td><%=id %></td>
				<td><%=name %></td>
				<td style="text-align:right!important;"><%=df.format(gajok) %></td>
				<td style="text-align:right!important;"><%=df.format(jikchak) %></td>
				<td style="text-align:right!important;"><%=df.format(gunsok) %></td>
				<td style="text-align:right!important;"><%=df.format(gitasudang) %></td>
				<td style="text-align:right!important;"><%=df.format(total) %></td>
				<td><a id="a2" href="add_Sudang.jsp?id=<%=id%>">수정</a>/<a id="a2" href="delete_Sudang.jsp?id=<%=id%>">삭제</a></td>
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