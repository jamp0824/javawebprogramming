package kr.co.koo.jdbc.basic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class JdbcSelect2 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("회원의 ID를 입력하세요");
		System.out.print(">");
		String userId=sc.next();
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String uid="week";
		String upw="week";
		String driver="oracle.jdbc.OracleDriver";
		String sql="select * from memberT1 WHERE id='"
				+userId+"'";
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;


		try {
			Class.forName(driver);
			conn=DriverManager.getConnection(url,uid,upw);
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);

			if(rs.next()) {
				System.out.println("=========회원 정보========");
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String email = rs.getString("email");
				System.out.println("======회원정보========");
				System.out.println("아이디"+id);
				System.out.println("비밀번호"+pw);
				System.out.println("이름"+name);
				System.out.println("이메일"+email);
				System.out.println("====================");
			}else {
				System.out.println("해당 회원 정보는 존재하지 않습니다.");
			}
		} catch (Exception e) {e.printStackTrace();	}
		finally{
			try {
				conn.close();
				stmt.close();
				rs.close();
				sc.close();
			}catch(Exception e2) {e2.printStackTrace();}
		}
	}
}
