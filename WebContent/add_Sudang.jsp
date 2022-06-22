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
		<h3 id="title">수당 정보 등록</h3>
		<hr>
		<%
			String id=request.getParameter("id");
			String name=null;
			Integer gajok=0;Integer jikchak=0;Integer gunsok=0;Integer gitasudang=0;
			try{
				sql="select name from info0622 where id=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs=pstmt.executeQuery();
				if(rs.next()){
					name=rs.getString(1);
					sql="select * from sudang0622 where id=?";
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1, id);
					rs=pstmt.executeQuery();
					if(rs.next()){
						gajok=rs.getInt(2);
						jikchak=rs.getInt(3);
						gunsok=rs.getInt(4);
						gitasudang=rs.getInt(5);
					}
				}else{
					id=null;
						if(request.getParameter("id")!=null){
		%>
		<script>alert("유효하지않은 아이디");</script>
		<%
						}
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		%>
		<table id="add_Tab" border=2>
			<tr>
				<th>사원번호</th>
				<td><input type=text name=id value="<%=id==null ? "" : id%>" onchange=search()></td>
				<th>이름</th>
				<td><input type=text name=name readonly value="<%=name==null ? "" : name%>"></td>
			</tr>
			<tr>
				<th>가족수당</th>
				<td><input type=text name=gajok value="<%=gajok==0 ? "" : gajok%>"></td>
				<th>직책수당</th>
				<td><input type=text name=jikchak value="<%=jikchak==0 ? "" : jikchak%>"></td>
			</tr>
			<tr>
				<th>근속수당</th>
				<td colspan=3><input type=text name=gunsok value="<%=gunsok==0 ? "" : gunsok%>"></td>
			</tr>
			<tr>
				<th>기타수당</th>
				<td colspan=3><input type=text name=gitasudang value="<%=gitasudang==0 ? "" : gitasudang%>"></td>
			</tr>
			<tr>
				<td colspan=4 style="text-align:center;">
					<input id="btn" type="button" value="목록" onclick=sel()>
					<input id="btn" type="button" value="저장" onclick=add()>
				</td>
			</tr>
		</table>
	</form>
</section>
<%@ include file="footer.jsp" %>
</body>
<script>
function search(){
	document.form.action="add_Sudang.jsp";
	document.form.submit();
}
function add(){
	var doc=document.form;
	if(doc.id.value==""){
		alert("아이디 입력");
		doc.id.focus();
	}else if(doc.name.value==""){
		alert("아이디로 성명 조회");
		doc.id.focus();
	}else if(isNaN(doc.gajok.value)==true){
		alert("가족수당 숫자만 입력");
		doc.gajok.focus();
	}else if(isNaN(doc.gajok.value)==true){
		alert("가족수당 숫자만 입력");
		doc.gajok.focus();
	}else if(isNaN(doc.jikchak.value)==true){
		alert("직책수당 숫자만 입력");
		doc.jikchak.focus();
	}else if(isNaN(doc.gunsok.value)==true){
		alert("근속수당 숫자만 입력");
		doc.gunsok.focus();
	}else if(isNaN(doc.gitasudang.value)==true){
		alert("기타수당 숫자만 입력");
		doc.gitasudang.focus();
	}else{
		doc.action="add_Sudang_Process.jsp";
		doc.submit();
	}
}
function sel(){
	location.href="select_Sudang.jsp";
}
</script>
</html>