<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String uid = "week";
	String upw = "week";
	
	Connection conn=null;
	PreparedStatement pstmt = null;
	
	String sql="INSERT INTO memberT1 VALUES(?,?,?,?)";
	
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		conn=DriverManager.getConnection(url,uid,upw);
		/*
			-pstmt객체는 Connection이 제공하는 prepareStatement()
			메서드를 호출합니다. 매개값에 sql을 전달합니다.
		*/
		pstmt=conn.prepareStatement(sql);
		/*
			-pstmt객체를 생성했다면 sql문의 ?값들을 채워줍니다.
			- ?는 첫번째 물음표로부터 1번의 인덱스값을 가지며 순차적으로 
			인덱스가 1씩 증가합니다.
			-DB테이블의 컬럼데이터 타입에 따라  SetString(), SetInt()
			등의 메서드를 사용하여 ?를 채웁니다.
		*/
		pstmt.setString(1, "danmuji");
		pstmt.setString(2, "54321");
		pstmt.setString(3, "단무지");
		pstmt.setString(4, "danmuji@naver.com");
	/*
		-?값을 모두 입력했다면 sql문의 종류에 따라 
				executeQuery,executeUpdate()을 호출합니다.
		-단, stmt와는 달리 매개값으로 sql을 전달하지 않습니다.		
	*/
	int rn=pstmt.executeUpdate();
	if(rn==1){
		out.print("<h3>회원정보 입력 성공!</h3>");
	}else{
		out.print("<h3>회원정보 입력 실패!</h3>");
	}
		
		
	}catch(Exception e){
		e.printStackTrace();}
	finally{
		try{
			conn.close(); pstmt.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
%>