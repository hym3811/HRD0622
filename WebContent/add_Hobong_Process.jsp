<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="DBConn.jsp" %>
<%
	String grade=request.getParameter("grade");
	String salary=request.getParameter("salary");
	try{
		sql="select salary from hobong0622 where grade=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, grade);
		rs=pstmt.executeQuery();
		if(rs.next()){
			sql="update hobong0622 set salary=? where grade=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, salary);
			pstmt.setString(2, grade);
			pstmt.executeUpdate();
%>
<script>
alert("<%=grade%>급 급여 수정 완료");
location.href="select_Hobong.jsp";
</script>
<%
		}else{
			sql="insert into hobong0622 values(?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, grade);
			pstmt.setString(2, salary);
			pstmt.executeUpdate();
%>
<script>
alert("<%=grade%>급 급여 등록 완료");
location.href="add_Hobong.jsp";
</script>
<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>