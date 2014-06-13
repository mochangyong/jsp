<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="dao.*" %>
<%
	request.setCharacterEncoding("euc-kr");
	

	GuestDAO gb =new GuestDAO();
	
%>
<jsp:useBean id ="g" class="model.GuestBean" />
<jsp:setProperty property="*" name="g"/>

이름=>
<jsp:getProperty property="guest_name" name="g" />
<hr/>
제목=>
<jsp:getProperty property="guest_title" name="g"/>
<hr/>
내용=>
<jsp:getProperty property="guest_cont" name="g"/>
<hr/>
<%//스크립트 릿
  int re=gb.insertG(g);
  
  if(re==1){//저장 성공시
	  out.println("<script>");
      out.println("alert('저장 성공했습니다!')");
      out.println("location='guest_list.jsp'");
      //자바스크립트에서 location객체는 원하는 파일로 이동.목록으로 이동
      out.println("</script>");
  }else{
	  out.println("<script>");
	  out.println("alert('저장에 실패했습니다!')");
	  out.println("history.back()");
	  //자스에서 history.back();,history.go(-1); 메서드는 뒤로 한칸이동
	  out.println("</script>");
  }
%>