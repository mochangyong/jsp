<%@page import="model.GuestBean"%>
<%@page import="dao.GuestDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
	
	
	int no = Integer.parseInt(request.getParameter("no"));
	String guest_name =request.getParameter("guest_name").trim();
	String guest_title =request.getParameter("guest_title").trim();
	String guest_cont = request.getParameter("guest_cont").trim();
	String guest_pwd = request.getParameter("guest_pwd").trim();
	
	GuestDAO gd=new GuestDAO();
	
	GuestBean db_pwd = gd.getGuestCont(no);

	GuestBean g =new GuestBean();
	
	g.setGuest_no(no);    g.setGuest_name(guest_name);
	g.setGuest_title(guest_title); g.setGuest_cont(guest_cont);
	
	
	if(db_pwd.getGuest_pwd().equals(guest_pwd)){
				int re=gd.EditGuest(g);
				
		if(re==1){
			response.sendRedirect("guest_cont.jsp?no="+no);
			
			
		}else{
		out.println("<script>");
		out.println("alert('수정실패')");
		out.println("history.back()");
		out.println("</script>");
		}
	}else{
	out.println("<script>");
	out.println("alert('비번이 다릅니다.')");
	out.println("history.go(-1)");
	out.println("</script>");
	}
%>

