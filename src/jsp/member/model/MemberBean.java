package jsp.member.model;

import java.sql.Timestamp;

// �������� ������ ����ϴ� Ŭ���� - DTO
public class MemberBean {
	private String id; // ���̵�
	private String password; // ��й�ȣ
	private String address; // �ּ�
	private String phone; // ��ȭ
	private char gender; // ����
	private int age; // ����
	private String name;
	private String job; // ����
	private String type; // type+-
	private int shipcom_number;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGender() {
		return String.valueOf(gender);
	}

	public void setGender(String gender) {
		this.gender = gender.charAt(0);
	}

	public String getAge() {
		return Integer.toString(age);
	}

	public void setAge(String age) {
		if (age.equals("NULL"))
			this.age = 0;
		else {
			this.age = Integer.parseInt(age);
		}
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getShipcom_number() {
		return Integer.toString(shipcom_number);
	}

	public void setShipcom_number(String shipcom_number) {
		this.shipcom_number = Integer.parseInt(shipcom_number);
	}

}
