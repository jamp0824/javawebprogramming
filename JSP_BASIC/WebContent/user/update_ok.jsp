<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
/*
 * 1. 폼태그에서 넘어온 데이터들(파라미터)를 각각 변수에 저장.
 * 2. 해당 데이터를 sql문을 통해 DB에 전송.
 * 3. 전송이 완료됐을시 executeUpdate()가
 *   1을 리턴하면 세션에 변경된 이름을 저장한 후
 *   update_success.jsp로 리다이렉트,
 *   0을 리턴하면 login_form.jsp로 리다이렉트.
 */
 
    request.setCharacterEncoding("utf-8");

	String id = (String) session.getAttribute("user_id");
	String name = request.getParameter("name");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	String gender = request.getParameter("gender");

	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String uid = "week";
	String upw = "week";
	
	Connection conn = null;
	//Statement stmt = null;   
	PreparedStatement pstmt= null;
	
	
	String sql = "UPDATE users SET name=?, phone1=?, phone2=?, phone3=?, gender=? WHERE id=?";
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(url, uid, upw);		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, phone1);
		pstmt.setString(3, phone2);
		pstmt.setString(4, phone3);
		pstmt.setString(5, gender);
		pstmt.setString(6, id);
		int rn = pstmt.executeUpdate();
		
		if(rn == 1) {
			session.setAttribute("user_name", name);
			response.sendRedirect("update_success.jsp");
		}else {
			response.sendRedirect("login_form.jsp");
		}		
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if(conn!=null) conn.close();
			if(pstmt!=null) pstmt.close();			
		} catch(Exception e2) {
			e2.printStackTrace();
		}
	}
%>






