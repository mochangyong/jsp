<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>방명록 글쓰기</h3>

<div>
<form action="guest_write_ok.jsp" method="post">
<table border="1" id= "g_W" >
<tr>
<th>글쓴이</th>
<td> <input type = "text" name = "guest_name" id = "guest_name" size ="14" /></td>
</tr>
<tr>
<th>제목</th>
<td><input type ="text" name="guest_title" id ="guest_title" size ="14" /></td>
</tr>
<tr>
<th>내용</th>
<td><textarea rows="8" cols="36" name ="guest_cont" id ="guest_cont" ></textarea></td>
</tr>
<tr>
<th>비밀번호</th>
<td><input type ="password" name ="guest_pwd" id ="guest_pwd" size ="14"/></td>
</tr>
</table>
<div>
<input type="submit" value ="등록" class="inpup_b" />
<input type="reset" value ="취소" class="inpup_b" 
	onclick ="${'guest_name'}.focus();"/>

</div>
</form>
</div>
</body>
</html>