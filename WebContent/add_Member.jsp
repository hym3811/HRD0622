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
<section>
<%@ include file="DBConn.jsp" %>
	<form name=form>
		<h3 id="title">인사관리 사원등록 화면</h3>
		<hr>
		<table id="add_Tab" border=2>
		<%
			Integer id=0;
			try{
				sql="select max(id) from info0622";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next()){
					id=rs.getInt(1)+1;
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		%>
			<tr>
				<th>사원번호(자동생성)</th>
				<td><input type=text name=id value="<%=id%>" readonly></td>
			</tr>
			<tr>
				<th>성명</th>
				<td><input type=text name=name></td>
			</tr>
			<tr>
				<th>소속부서</th>
				<td>
					<select name=dept>
						<option value="">소속부서 선택</option>
						<option value="10">인사부</option>
						<option value="20">기획부</option>
						<option value="30">홍보부</option>
						<option value="40">영업부</option>
						<option value="50">경리부</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>직급</th>
				<td>
					<select name=position>
						<option value="">직급 선택</option>
						<option value="1">1급</option>
						<option value="2">2급</option>
						<option value="3">3급</option>
						<option value="4">4급</option>
						<option value="5">5급</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>직책</th>
				<td><input type=text name=duty></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><input type=text name=phone></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type=text name=address></td>
			</tr>
			<tr>
				<td colspan=2>
					<input id="btn" type=button value="등록" onclick=add()>
					<input id="btn" type=button value="취소" onclick=reset()>
				</td>
			</tr>
		</table>
		<br>
	</form>
</section>
<%@ include file="footer.jsp" %>
</body>
<script>
function add(){
	var doc=document.form;
	if(doc.name.value==""){
		alert("성명 입력");
		doc.name.focus();
	}else if(doc.dept.value==""){
		alert("소속부서 선택");
		doc.dept.focus();
	}else if(doc.position.value==""){
		alert("직급 선택");
		doc.position.focus();
	}else if(doc.duty.value==""){
		alert("직책 입력");
		doc.duty.focus();
	}else if(doc.phone.value==""){
		alert("연락처 입력");
		doc.phone.focus();
	}else if(doc.address.value==""){
		alert("주소 입력");
		doc.address.focus();
	}else{
		doc.action="add_Member_Process.jsp";
		doc.submit();
	}
}
</script>
</html>