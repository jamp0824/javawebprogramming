package kr.co.koo.jdbc.user.model;

import java.sql.*;

import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

//DAO클래스는 DB작업을 전담처리합니다.
public class UserDAO {

	/*
	 * String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe"; String uid = "week";
	 * String upw = "week";
	 */
	private DataSource ds=null;
	//싱글톤 패턴 클래스 생성
	//1. 클래스 외부에서 객체를 생성할수 없도록 private 제한을 붙임
	private UserDAO() {
		try {
			//Class.forName("oracle.jdbc.OracleDriver");
			//context.xml을 읽기 위한 객체
			Context ct = new InitialContext();
			ds=(DataSource)ct.lookup("java:comp/env/jdbc/xe");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	//2. 자신의 클래스 내부에서 스스로의 객체를 1개 생성함
	private static UserDAO dao= new UserDAO();

	//3. 외부에서 객체생성을 요구할 시 공개된 메서드를 통해
	// 미리 만들어둔 단 하나의 객체를 리턴함
	public static UserDAO getInstance() {
		if(dao !=null) {
			dao = new UserDAO();
		}
		return dao;
	}
	//UserDAO에서는 회원관리에 피요한 db연동 로직들을 메서드로 나열하여 작성.

	//DB에 회원가입 데이터를 INSERT하는 메서드 선언
	public int join(UserVO users){
		String sql="INSERT INTO users VALUES(?,?,?,?,?,?,?)";

		Connection conn = null;
		PreparedStatement pstmt = null;
		int rn = 0;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, users.getName());
			pstmt.setString(2, users.getId());
			pstmt.setString(3, users.getPw());
			pstmt.setString(4, users.getPhone1());
			pstmt.setString(5, users.getPhone2());
			pstmt.setString(6, users.getPhone3());
			pstmt.setString(7, users.getGender());

			rn = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close(); 
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return rn;
	}
	//DB로부터 모든 회원정보를 가져오는 메서드 선언.
	public List<UserVO> userSelectAll(){

		List<UserVO> userList = new ArrayList<>();
		String sql="SELECT * FROM users";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			//conn= DriverManager.getConnection(url,uid,upw);
			conn=ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				/*String name = rs.getString("name");
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String phone1 = rs.getString("phone1");
				String phone2 = rs.getString("phone2");
				String phone3 = rs.getString("phone3");
				String gender = rs.getString("gender");*/

				UserVO user = new UserVO(
						rs.getString("name"),
						rs.getString("id"),
						rs.getString("pw"),
						rs.getString("phone1"),
						rs.getString("phone2"),
						rs.getString("phone3"),
						rs.getString("gender"));

				userList.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close(); 
				if(rs!=null)rs.close();
			} catch (Exception e) {
				e.printStackTrace();	
			}
		}
		return userList;
	}
	//회원탈퇴를 처리하는 메서드 선언
	public int userDelete(String id){
		String sql="delete from users WHERE id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rn =0;
		try {
			conn=ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rn =pstmt.executeUpdate();

		} catch (Exception e) {e.printStackTrace();	}
		finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close(); 
				
			} catch (Exception e) {e.printStackTrace();}

		}
		return rn;
	}
}







