<%@page import="dao.GuestDAO"%>
<%@page import="model.GuestBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	GuestDAO gd =new GuestDAO();

   int no =Integer.parseInt(request.getParameter("no"));
   
   gd.updatehit(no);
	
   GuestBean gcont = gd.getGuestCont(no);
   
   String guest_cont = gcont.getGuest_cont().replace("/n", "<br/>");
   
   

%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table align ="center" border="1">
<tr>
<th colspan="2">내용보기</th>
</tr>
<tr>
<th>제목</th>
<td><%=gcont.getGuest_title() %></td>
</tr>
<tr>
<th>내용</th>
<td><%=guest_cont %></td>
</tr>
<tr>
<th>조회수</th>
<td><%=gcont.getGuest_hit() %></td>
</tr>
<tr>
<th colspan="2">
<input type ="button" value="수정" 
	onclick="location='guest_edit.jsp?no=<%=gcont.getGuest_no() %>'" />
<input type ="button" value ="삭제" onclick="location='guest_del.jsp?no=<%=gcont.getGuest_no()%>'" />
<input type ="button" value ="목록" onclick ="location='guest_list.jsp'" />
</th>
</tr>
</table>
</body>
</html>