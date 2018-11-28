package jsp.member.model;
 
import java.sql.Timestamp;
 
 
// 데이터의 전달을 담당하는 클래스 - DTO
public class MemberBean 
{
    private String id;            // 아이디
    private String password;     // 비밀번호
    private String address;        // 주소
    private String phone;        // 전화
    private String gender;        // 성별
    private String age;			//나이
    private String job;			//직업
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

