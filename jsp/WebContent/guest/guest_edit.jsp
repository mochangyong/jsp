<%@page import="model.GuestBean"%>
<%@page import="dao.GuestDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
    	int no = Integer.parseInt(request.getParameter("no"));
    	GuestDAO gd = new GuestDAO();
    	
    	GuestBean g=gd.getGuestCont(no);
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>���� �۾���</h3>

<div>
<form action="guest_edit_ok.jsp" method="post">
<input type="hidden" name="no" value="<%=no%>" />
<table border="1" id= "g_W" >
<tr>
<th>�۾���</th>
<td> <input type = "text" name = "guest_name" id = "guest_name" value="<%=g.getGuest_name() %>" size ="14" /></td>
</tr>
<tr>
<th>����</th>
<td><input type ="text" name="guest_title" id ="guest_title" size ="14"value="<%=g.getGuest_title() %>" /></td>
</tr>
<tr>
<th>����</th>
<td><textarea rows="8" cols="36" name ="guest_cont" id ="guest_cont" ><%=g.getGuest_cont() %></textarea></td>
</tr>
<tr>
<th>��й�ȣ</th>
<td><input type ="password" name ="guest_pwd" id ="guest_pwd" size ="14"/></td>
</tr>
</table>
<div>
<input type="submit" value ="����" class="inpup_b" />
<input type="reset" value ="���" class="inpup_b" 
	onclick ="${'guest_name'}.focus();"/>

</div>
</form>
</div>
</body>
</html>