package kr.co.koo.jdbc.basic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Scanner;

public class JdbcDelete {
public static void main(String[] args) {
	
	Scanner sc = new Scanner(System.in);
	System.out.println("삭제할 회원의 ID를 입력하세요");
	System.out.print(">");
	String id = sc.next();
	String uid="week";
	String upw="week";
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	String driver="oracle.jdbc.OracleDriver";
	Connection conn=null;
	Statement stmt=null;
	
	try {
		Class.forName(driver);
		conn=DriverManager.getConnection(url,uid,upw);
		stmt =conn.createStatement();
		
		String sql="DELETE FROM memberT1 WHERE id='"
				+id+"'";
		int resultset = stmt.executeUpdate(sql);
				if(resultset==1) {
					System.out.println("삭제에 성공했습니다.");
				}else {
					System.out.println("삭제에 실패했습니다.");
				}
	} catch (Exception e) {e.printStackTrace();}
	finally {
		
	}try {
		sc.close();
		stmt.close();
		conn.close();
		
	} catch (Exception e) {e.printStackTrace();}
}
}
