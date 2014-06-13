<%@page import="model.GuestBean"%>
<%@page import="dao.GuestDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
	
	int no =Integer.parseInt(request.getParameter("no"));
	
	String del_pwd=request.getParameter("del_pwd").trim();
	GuestDAO gd = new GuestDAO();
	
	
	GuestBean g=gd.getGuestCont(no);
	
	if(g.getGuest_pwd().equals(del_pwd)){
		 int re=gd.deleteg(no);
		 
		if(re == 1){
			response.sendRedirect("guest_list.jsp");
		}else{
			out.println("<script>");
			out.println("alert('삭제 실패')");
			out.println("history.go(-1)");
			out.println("</script>");
		}
			
		
	}else{
		out.println("<script>");
		out.println("alert('비번이 다른니다')");
		out.println("history.go(-1)");
		out.println("</script>");
	
	}

%>