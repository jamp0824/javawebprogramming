<%@page import="kr.co.koo.jdbc.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	//1. 폼데이터 처리
	request.setCharacterEncoding("utf-8");
	
	/*String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pw = request.getParameter("pw");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	String gender = request.getParameter("gender");
	
	
	
	//2. JDBC로직 작성.
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String uid = "week";
	String upw = "week";
	
	Connection conn = null;
	//Statement stmt = null;
	PreparedStatement pstmt = null;
	
	/* String sql = "INSERT INTO users VALUES ('" 
	+ name + "', '" + id + "', '" + pw 
	+ "', '" + phone1 + "', '" + phone2 
	+ "', '"+ phone3 + "', '" + gender + "')"; */
	
	/*String sql="INSERT INTO users VALUES (?,?,?,?,?,?,?)";
	
	System.out.println(sql);
	
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(url, uid, upw);
		//stmt = conn.createStatement();
		pstmt=conn.prepareStatement(sql);
		
		pstmt.setString(1, name);
		pstmt.setString(2, id);
		pstmt.setString(3, pw);
		pstmt.setString(4, phone1);
		pstmt.setString(5, phone2);
		pstmt.setString(6, phone3);
		pstmt.setString(7, gender);
		int rn = pstmt.executeUpdate();
		
		if(rn == 1) {
			session.setAttribute("user_name", name);
			response.sendRedirect("join_success.jsp");
		} else {
			response.sendRedirect("join_form.jsp");
		}
		
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		try {
			conn.close(); pstmt.close(); 
		} catch(Exception e) {
			e.printStackTrace();
		}
	}*/
	
%>
<%--
	request.getParameter("id)...
	
	UserVO users= new UserVO();
	user. set~~~~() /...
--%>
<jsp:useBean id="users" class="kr.co.koo.jdbc.user.model.UserVO"/>
<jsp:setProperty property="*" name="users"/>

<%
	UserDAO dao= UserDAO.getInstance();
	int rn =dao.join(users);
	
	if(rn == 1) {
		session.setAttribute("user_name", users.getName());
		response.sendRedirect("join_success.jsp");
	} else {
		response.sendRedirect("join_form.jsp");
	}
%>





