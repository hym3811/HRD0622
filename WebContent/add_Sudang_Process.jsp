<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="DBConn.jsp"%>
<%
	String id=request.getParameter("id");
	String gajok=request.getParameter("gajok");
	if(gajok==null)
		gajok="0";
	String jikchak=request.getParameter("jikchak");
	if(jikchak==null)
		jikchak="0";
	String gunsok=request.getParameter("gunsok");
	if(gunsok==null)
		gunsok="0";
	String gitasudang=request.getParameter("gitasudang");
	if(gitasudang==null)
		gitasudang="0";
	try{
		sql="select * from sudang0622 where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		if(rs.next()){
			sql="update sudang0622 set gajok=?,jikchak=?,gunsok=?,gitasudang=? where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, gajok);
			pstmt.setString(2, jikchak);
			pstmt.setString(3, gunsok);
			pstmt.setString(4, gitasudang);
			pstmt.setString(5, id);
			pstmt.executeUpdate();
%>
<script>
alert("<%=id%> 수당 정보 수정 완료");
location.href="select_Sudang.jsp";
</script>
<%
		}else{
			sql="insert into sudang0622 values(?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, gajok);
			pstmt.setString(3, jikchak);
			pstmt.setString(4, gunsok);
			pstmt.setString(5, gitasudang);
			pstmt.executeUpdate();
%>
<script>
alert("<%=id%> 수당 정보 등록 완료");
location.href="select_Sudang.jsp";
</script>
<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>