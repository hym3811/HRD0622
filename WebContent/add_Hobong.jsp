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
		<h3 id="title">인사관리 호봉 등록 화면</h3>
		<hr>
		<%
			String grade=null;
			if(request.getParameter("grade")!=null)
				grade=request.getParameter("grade").replace("급", "");
			Integer salary=0;
			if(request.getParameter("grade")!=null){
				try{
					sql="select salary from hobong0622 where grade=?";
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1, grade);
					rs=pstmt.executeQuery();
					if(rs.next()){
						salary=rs.getInt(1);
					}
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		%>
		<table border=2 id="add_Tab">
			<tr>
				<th>직급</th>
				<td>
					<select name=grade>
						<option value="">직급선택</option>
						<option value="1" <%="1".equals(grade) ? "selected" : "" %>>1급</option>
						<option value="2" <%="2".equals(grade) ? "selected" : "" %>>2급</option>
						<option value="3" <%="3".equals(grade) ? "selected" : "" %>>3급</option>
						<option value="4" <%="4".equals(grade) ? "selected" : "" %>>4급</option>
						<option value="5" <%="5".equals(grade) ? "selected" : "" %>>5급</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>급여</th>
				<td><input type=text name=salary value="<%=salary==0 ? "" : salary%>"></td>
			</tr>
			<tr>
				<td colspan=2 style="text-align:center;">
					<input id="btn" type="button" value="등록" onclick=add()>
					<input id="btn" type="button" value="취소" onclick=reset()>
				</td>
			</tr>
		</table>
	</form>
</section>
<%@ include file="footer.jsp" %>
</body>
<script>
function add(){
	var doc=document.form;
	if(doc.grade.value==""){
		alert("직급 선택");
		doc.grade.focus();
	}else if(doc.salary.value==""){
		alert("급여 입력");
		doc.salary.focus();
	}else if(isNaN(doc.salary.value)==true){
		alert("급여는 숫자만 입력");
		doc.salary.focus();
	}else{
		doc.action="add_Hobong_Process.jsp";
		doc.submit();
	}
}
</script>
</html>