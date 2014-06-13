<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));

%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action ="guest_del_ok.jsp" method ="post">
<input type ="hidden" name="no" value ="<%=no%>" />
<table align ="center" border="1">
<tr>
<th>방명록 삭제</th>
</tr>
<tr>
<th>비밀번호</th>
<td><input type ="password" name="del_pwd" size="14" id="del_pwd" /></td>
</tr>
<tr >
<td colspan ="2">
<input type="submit" value ="삭제"  />
<input type="reset" value = "취소" />
</td>
</tr>



</table>


</form>
</body>
</html>