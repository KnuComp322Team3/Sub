package jsp.member.model;
 
import java.sql.Timestamp;
 
 
// �������� ������ ����ϴ� Ŭ���� - DTO
public class MemberBean 
{
    private String id;            // ���̵�
    private String password;     // ��й�ȣ
    private String address;        // �ּ�
    private String phone;        // ��ȭ
    private String gender;        // ����
    private String age;			//����
    private String job;			//����
    private String type;		//type

    
    public String getId() {return id;}
    public void setId(String id) {this.id = id;}
    
    public String getPassword() {return password;}
    public void setPassword(String password) {this.password = password;}
    
    public String getAddress() {return address;}
    public void setName(String address) {this.address = address;}
    
    public String getPhone() {return phone;}
    public void setPhone(String phone) {this.phone = phone;}
    
    public String getGender() {return gender;}
    public void setGender(String gender) {this.gender = gender;}
    
    public String getAge() {return age;}
    public void setAddress(String address) {this.age = age;}
    
    public String getJob() {return job;}
    public void setJob(String job) {this.job = job;}
    
    public String getType() {return type;}
    public void setType(String type) {this.type = type;}

}

