package jsp.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.sql.DriverManager;

import javax.naming.NamingException;

import jsp.util.DBConnection;

/* Data Access Object
 * 테이블 당 한개의 DAO를 작성한다.
 * 
 * JSP_MEMBER 테이블과 연관된 DAO로
 * 회원 데이터를 처리하는 클래스이다.
 */
public class MemberDAO {
	private static MemberDAO instance;

	// 싱글톤 패턴
	private MemberDAO() {
	}

	public static MemberDAO getInstance() {
		if (instance == null)
			instance = new MemberDAO();
		return instance;
	}

	// String -> Date로 변경하는 메서드
	// 문자열로된 생년월일을 Date로 변경하기 위해 필요
	// java.util.Date클래스로는 오라클의 Date형식과 연동할 수 없다.
	// Oracle의 date형식과 연동되는 java의 Date는 java.sql.Date 클래스이다.

	// 회원정보를 JSP_MEMBER 테이블에 저장하는 메서드
	public void insertMember(MemberBean member) throws SQLException {
		//

		//
		String serverIP = "localhost";
		String portNum = "3306";
		String url = "jdbc:mysql://" + serverIP + ":" + portNum + "/dbpro?useSSL=false";
		String user = "knu";
		String pass = "comp322";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs;

		try {
			// 커넥션을 가져온다.
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, pass);
			conn.setTransactionIsolation(Connection.TRANSACTION_READ_UNCOMMITTED);
			// 자동 커밋을 false로 한다.
			conn.setAutoCommit(false);

			// 쿼리 생성한다.
			// 가입일의 경우 자동으로 세팅되게 하기 위해 sysdate를 사용

			/*
			 * StringBuffer에 담긴 값을 얻으려면 toString()메서드를 이용해야 한다.
			 */
			pstmt = conn.prepareStatement(
					"insert into CUSTOMER (Id, Password, Address, Phonenumber, Sex, Age, Customer_name, Job, Type, Shipcom_number) values (?,?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getAddress());
			pstmt.setString(4, member.getPhone());
			pstmt.setString(5, member.getGender());
			pstmt.setString(6, member.getAge());
			pstmt.setString(7, member.getName());
			pstmt.setString(8, member.getJob());
			pstmt.setString(9, member.getType());
			pstmt.setString(10, member.getShipcom_number());

			// 쿼리 실행
			pstmt.executeUpdate();
			// 완료시 커밋
			conn.commit();
			
			/*Date today = new Date();
			SimpleDateFormat  time= new SimpleDateFormat("hh:mm:ss");
			String Transcation_number=time.format(today)+member.getId().charAt(0);*/

			pstmt = conn.prepareStatement("SELECT COUNT(S.Transaction_number) FROM SHOPPINGBAG S ");
			rs = pstmt.executeQuery();
			
			rs.next();
			pstmt = conn.prepareStatement("insert into SHOPPINGBAG (Transaction_number,Id) values (?,?)");
			//pstmt.setString(1, Transcation_number);
			pstmt.setString(1, "T" + (Integer.parseInt(rs.getString(1))+1));
			pstmt.setString(2, member.getId());


			// 쿼리 실행
			pstmt.executeUpdate();
			// 완료시 커밋
			conn.commit();

		} catch (ClassNotFoundException | SQLException sqle) {
			// 오류시 롤백
			conn.rollback();

			throw new RuntimeException(sqle.getMessage());
		} finally {
			// Connection, PreparedStatement를 닫는다.
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		} // end try~catch
	} // end insertMember()

	public void changeData(MemberBean member) throws SQLException {
		//

		//
		String serverIP = "localhost";
		String portNum = "3306";
		String url = "jdbc:mysql://" + serverIP + ":" + portNum + "/dbpro?useSSL=false";
		String user = "knu";
		String pass = "comp322";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs;

		try {
			// 커넥션을 가져온다.
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, pass);
			conn.setTransactionIsolation(Connection.TRANSACTION_READ_UNCOMMITTED);
			// 자동 커밋을 false로 한다.
			conn.setAutoCommit(false);

			// 쿼리 생성한다.
			// 가입일의 경우 자동으로 세팅되게 하기 위해 sysdate를 사용

			/*
			 * StringBuffer에 담긴 값을 얻으려면 toString()메서드를 이용해야 한다.
			 */
			pstmt = conn.prepareStatement(
					"update CUSTOMER set Password=?, Address=?, Phonenumber=?, Sex=?, Age=?, Customer_name=?, Job=?, Type=?, Shipcom_number=? WHERE id = ?");
			pstmt.setString(1, member.getPassword());
			pstmt.setString(2, member.getAddress());
			pstmt.setString(3, member.getPhone());
			pstmt.setString(4, member.getGender());
			pstmt.setString(5, member.getAge());
			pstmt.setString(6, member.getName());
			pstmt.setString(7, member.getJob());
			pstmt.setString(8, member.getType());
			pstmt.setString(9, member.getShipcom_number());
			pstmt.setString(10, member.getId());

			// 쿼리 실행
			pstmt.executeUpdate();
			// 완료시 커밋
			conn.commit();

		} catch (ClassNotFoundException | SQLException sqle) {
			// 오류시 롤백
			conn.rollback();

			throw new RuntimeException(sqle.getMessage());
		} finally {
			// Connection, PreparedStatement를 닫는다.
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		} // end try~catch
	} // end insertMember()

	// 로그인시 아이디, 비밀번호 체크 메서드
	// 아이디, 비밀번호를 인자로 받는다.
	public int loginCheck(String id, String pw) {
		String serverIP = "localhost";
		String portNum = "3306";
		String url = "jdbc:mysql://" + serverIP + ":" + portNum + "/dbpro?useSSL=false";
		String user = "knu";
		String pass = "comp322";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs;

		String dbPW = ""; // db에서 꺼낸 비밀번호를 담을 변수
		int x = -1;

		try {
			// 쿼리 - 먼저 입력된 아이디로 DB에서 비밀번호를 조회한다.
			StringBuffer query = new StringBuffer();
			query.append("SELECT PASSWORD FROM CUSTOMER WHERE ID=?");

			// conn = DBConnection.getConnection();
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, pass);

			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) // 입려된 아이디에 해당하는 비번 있을경우
			{
				dbPW = rs.getString("password"); // 비번을 변수에 넣는다.

				if (!id.equals("admin") && dbPW.equals(pw))
					x = 1; // 넘겨받은 비번과 꺼내온 배번 비교. 같으면 인증성공
				else if (id.equals("admin") && dbPW.equals(pw))
					x = 2;// 관리자 모드일때
				else
					x = 0; // DB의 비밀번호와 입력받은 비밀번호 다름, 인증실패

			} else {
				x = -1; // 해당 아이디가 없을 경우
			}

			return x;

		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	} // end loginCheck()

	public int duplicateCheck(String id) {
		String serverIP = "localhost";
		String portNum = "3306";
		String url = "jdbc:mysql://" + serverIP + ":" + portNum + "/dbpro?useSSL=false";
		String user = "knu";
		String pass = "comp322";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs;

		int x = -1;

		try {
			// 쿼리 - 먼저 입력된 아이디로 DB에서 비밀번호를 조회한다.
			StringBuffer query = new StringBuffer();
			query.append("SELECT PASSWORD FROM CUSTOMER WHERE ID=?");

			// conn = DBConnection.getConnection();
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, pass);

			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) // 입려된 아이디에 해당하는 비번 있을경우
			{
				x = 1;

			} else {
				x = -1; // 해당 아이디가 없을 경우
			}

			return x;

		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	} // end loginCheck()

}
