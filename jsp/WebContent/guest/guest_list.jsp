<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%
 String driver="oracle.jdbc.OracleDriver";
	
	String url="jsbc:oracle:thin:@127.0.0.1:1522:xe";
	
	String uid="oraclejava";
	String pwd="oraclejava";
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
 
	try{
		Class.forName(driver);
		con=DriverManager.getConnection(url,uid,pwd);
		sql= "select * from guestbook order by guest_no desc"; 
		pstmt=con.prepareStatement(sql);
		rs = pstmt.executeQuery();
 %>
<table align="center" border="1">
<tr>
<th>번호</th> <th>제목</th> <th>이름</th> <th>조회수</th> <th>날짜</th>
</tr>
<%
  while(rs.next()){
%>
<tr>
<th><%=rs.getInt("guest_no") %></th>
<th> <a href="guest_cont.jsp?no=<%=rs.getInt("guest_no")%>" 
     onfocus="this.blurSS();"><%=rs.getString("guest_title") %>	</a></th>
 <th> <%=rs.getString("guest_name") %></th>
 <th><%=rs.getInt("guest_hit") %></th>
 <th><%=rs.getString("guest_regdate").substring(0,10) %></th>
 </tr>
<%} %>
<tr>
<th colspan ="5">
<input type="button" value ="입력" 
	onclick="location='guest_write.jsp'" />
	</th>
	</tr>
	
</table>
<%
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		 try{
			  if(rs != null) rs.close();
			  if(pstmt != null) pstmt.close();
			  if(con != null) con.close();
		  }catch(Exception e){
			  e.printStackTrace();
		  }
	}

%>