<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="dao.*" %>
<%
	request.setCharacterEncoding("euc-kr");
	

	GuestDAO gb =new GuestDAO();
	
%>
<jsp:useBean id ="g" class="model.GuestBean" />
<jsp:setProperty property="*" name="g"/>

�̸�=>
<jsp:getProperty property="guest_name" name="g" />
<hr/>
����=>
<jsp:getProperty property="guest_title" name="g"/>
<hr/>
����=>
<jsp:getProperty property="guest_cont" name="g"/>
<hr/>
<%//��ũ��Ʈ ��
  int re=gb.insertG(g);
  
  if(re==1){//���� ������
	  out.println("<script>");
      out.println("alert('���� �����߽��ϴ�!')");
      out.println("location='guest_list.jsp'");
      //�ڹٽ�ũ��Ʈ���� location��ü�� ���ϴ� ���Ϸ� �̵�.������� �̵�
      out.println("</script>");
  }else{
	  out.println("<script>");
	  out.println("alert('���忡 �����߽��ϴ�!')");
	  out.println("history.back()");
	  //�ڽ����� history.back();,history.go(-1); �޼���� �ڷ� ��ĭ�̵�
	  out.println("</script>");
  }
%>