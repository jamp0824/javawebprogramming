<%@page import="kr.co.koo.jdbc.user.model.UserDAO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("user_id");

	UserDAO dao = UserDAO.getInstance();
	int rn =dao.userDelete(id);
	
    if(rn == 1) {
       session.invalidate();
       response.sendRedirect("login_form.jsp");
    }else {
       response.sendRedirect("login_welcome.jsp");
    }
	/*
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String uid = "week";
	String upw = "week";
	
	Connection conn = null;
    //Statement stmt = null;
    PreparedStatement pstmt =null;

	String sql = "DELETE FROM users WHERE id=?";
	

	//삭제 성공시 login_form.jsp로 실패시 login_welcome.jsp 리다이렉팅.
	try {
		Class.forName("oracle.jdbc.OracleDriver");
         conn = DriverManager.getConnection(url, uid, upw);
         //stmt = conn.createStatement();
         
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, id);
         int rn = pstmt.executeUpdate();
         
         if(rn == 1) {
            session.invalidate();
            response.sendRedirect("login_form.jsp");
         }else {
            response.sendRedirect("login_welcome.jsp");
         }
               
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         try {
            if(conn!=null) conn.close();
            if(pstmt!=null) pstmt.close();
         } catch (Exception e2) {
            e2.printStackTrace();
         }
      }*/
%>





