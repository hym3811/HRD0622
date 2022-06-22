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
		<h3 id="title">인사관리 사원정보 수정 화면</h3>
		<hr>
		<table id="add_Tab" border=2>
		<%
			String id=request.getParameter("id");
			String name=null;
			String dept=null;
			String position=null;
			String duty=null;
			String phone=null;
			String address=null;
			try{
				sql="select * from info0622 where id=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs=pstmt.executeQuery();
				if(rs.next()){
					name=rs.getString(2);
					dept=rs.getString(3);
					position=rs.getString(4);
					duty=rs.getString(5);
					phone=rs.getString(6);
					address=rs.getString(7);
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		%>
			<tr>
				<th>사원번호</th>
				<td><input type=text name=id value="<%=id%>" readonly></td>
			</tr>
			<tr>
				<th>성명</th>
				<td><input type=text name=name value="<%=name%>"></td>
			</tr>
			<tr>
				<th>소속부서</th>
				<td>
					<select name=dept>
						<option value="">소속부서 선택</option>
						<option value="10" <%="10".equals(dept) ? "selected" : "" %>>인사부</option>
						<option value="20" <%="20".equals(dept) ? "selected" : "" %>>기획부</option>
						<option value="30" <%="30".equals(dept) ? "selected" : "" %>>홍보부</option>
						<option value="40" <%="40".equals(dept) ? "selected" : "" %>>영업부</option>
						<option value="50" <%="50".equals(dept) ? "selected" : "" %>>경리부</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>직급</th>
				<td>
					<select name=position>
						<option value="">직급 선택</option>
						<option value="1" <%="1".equals(position) ? "selected" : "" %>>1급</option>
						<option value="2" <%="2".equals(position) ? "selected" : "" %>>2급</option>
						<option value="3" <%="3".equals(position) ? "selected" : "" %>>3급</option>
						<option value="4" <%="4".equals(position) ? "selected" : "" %>>4급</option>
						<option value="5" <%="5".equals(position) ? "selected" : "" %>>5급</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>직책</th>
				<td><input type=text name=duty value="<%=duty%>"></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><input type=text name=phone value="<%=phone%>"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type=text name=address value="<%=address%>"></td>
			</tr>
			<tr>
				<th colspan=2>
					<input id="btn" type=button value="수정" onclick=update()>
					<input id="btn" type=button value="취소" onclick=reset()>
					<input id="btn" type=button value="삭제" onclick=del()>
				</th>
			</tr>
		</table>
		<br>
	</form>
</section>
<%@ include file="footer.jsp" %>
</body>
<script>
function update(){
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
		doc.action="update_Member_Process.jsp";
		doc.submit();
	}
}
function del(){
	document.form.action="delete_Member.jsp";
	document.form.submit();
}
</script>
</html>