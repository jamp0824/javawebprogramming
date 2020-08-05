package kr.co.koo.jdbc.basic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Scanner;

public class JdbcInsert {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("# 회원정보 입력을 시작합니다. ");
		System.out.println("*아이디: ");
		String id = sc.next();
		
		System.out.println("*비밀번호: ");
		String pw = sc.next();
		
		System.out.println("*이름: ");
		String name = sc.next();
		
		System.out.println("*이메일: ");
		String email = sc.next();
		//DB연동 순서
		//1. DB사용자 계정명과 암호, DB URL등 초기 데이터 변수를 설정
		String uid="week";
		String upw="week";
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String sql=null;
		Connection conn=null;
		Statement stmt=null;
		//2. JDBC 커넥터 드라이버 호출
		try {
			Class.forName("oracle.jdbc.OracleDriver");
/*	# a- Connection 객체
 *  : DB와의 연결을 위한 객체. Connection객체를 생성하려면
 *  직접 new 연산자를 통해 객체를 생성할 수 없고
 *  DriverManager클래스가 제공하는 정적 메서드
 *  getConnection()을 호출하여 객체를  생성합니다.
 */
		 conn=DriverManager.getConnection(url,uid,upw);
			
/*
 *  # b- Statement 객체:
 *  SQL문 실행을 위한 객체.
 *  Statement 객체는 Connection객체가 제공하는
 *  createStatement()메서드를 호출하여 생성합니다.
*/
			stmt = conn.createStatement();
			
/* c-SQL문 작성
 * SQL문은 String형태로 작성합니다.
 */
			sql="INSERT INTO memberT1 VALUES" 
					+"('"+id+"','"+pw+"','"+name+"','"+email+"')";
			
			/*
			 * d-Statement 객체를 통한 sql문 실행
			 * 1.insert, update, delete명령일 경우
			 * executeUpdate()를 호출합니다
			 * 2.select명령일 경우 executeQuery()를 호출합니다.
			 * 3.executeUpdate는 실행 성공시 성공한 쿼리의 개수를
			 * 실패시 0을 리턴합니다.
			 */
			int resultNum=stmt.executeUpdate(sql);
			
			if(resultNum==1) {
				System.out.println("DB에 회원정보 성공");
			}else {
				System.out.println("DB에 회원정보 저장 실패!");
			}
			
			
		} catch (Exception e) {e.printStackTrace();}
		finally {
			/*
			 * 4. DB연동 객체들 자원 반납
			 * 원활한 JDBC프로그래밍을 위해 사용한 자원들을 반납합니다.
			 */
			try {
				conn.close();
				stmt.close();
				sc.close();
			} catch (Exception e) {e.printStackTrace();} //catch
		}//finally
	}
}
