package jsp.member.model;
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Date;
import javax.naming.NamingException;
 
import jsp.util.DBConnection;
 
 
/* Data Access Object
 * ���̺� �� �Ѱ��� DAO�� �ۼ��Ѵ�.
 * 
 * JSP_MEMBER ���̺�� ������ DAO��
 * ȸ�� �����͸� ó���ϴ� Ŭ�����̴�.
 */
public class MemberDAO 
{
    private static MemberDAO instance;
    
    // �̱��� ����
    private MemberDAO(){}
    public static MemberDAO getInstance(){
        if(instance==null)
            instance=new MemberDAO();
        return instance;
    }
    
    // String -> Date�� �����ϴ� �޼���
    // ���ڿ��ε� ��������� Date�� �����ϱ� ���� �ʿ�
    // java.util.DateŬ�����δ� ����Ŭ�� Date���İ� ������ �� ����.
    // Oracle�� date���İ� �����Ǵ� java�� Date�� java.sql.Date Ŭ�����̴�.

    
    // ȸ�������� JSP_MEMBER ���̺� �����ϴ� �޼���
    public void insertMember(MemberBean member) throws SQLException
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            // Ŀ�ؼ��� �����´�.
            conn = DBConnection.getConnection();
            
            // �ڵ� Ŀ���� false�� �Ѵ�.
            conn.setAutoCommit(false);
            
            // ���� �����Ѵ�.
            // �������� ��� �ڵ����� ���õǰ� �ϱ� ���� sysdate�� ���
            StringBuffer sql = new StringBuffer();
            sql.append("insert into JSP_MEMBER values");
            sql.append("(?, ?, ?, ?, ?, ?, ?, ?, sysdate)");        

            /* 
             * StringBuffer�� ��� ���� �������� toString()�޼��带
             * �̿��ؾ� �Ѵ�.
             */
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setString(1, member.getId());
            pstmt.setString(2, member.getPassword());
            pstmt.setString(3, member.getAddress());
            pstmt.setString(4, member.getPhone());
            pstmt.setString(5, member.getGender());
            pstmt.setInt(6, Integer.parseInt(member.getAge()));
            pstmt.setString(7, member.getJob());
            pstmt.setString(8, member.getType());
            
            // ���� ����
            pstmt.executeUpdate();
            // �Ϸ�� Ŀ��
            conn.commit(); 
            
        } catch (ClassNotFoundException | NamingException | SQLException sqle) {
            // ������ �ѹ�
            conn.rollback(); 
            
            throw new RuntimeException(sqle.getMessage());
        } finally {
            // Connection, PreparedStatement�� �ݴ´�.
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        } // end try~catch 
    } // end insertMember()
}


