package vo;

public class MemberVo {
	private String id;
	private String passwd;
	private String name;
	private int age;
	private String grade;
	
	// 가입용
	public MemberVo(String id, String passwd, String name, int age) {
		super();
		this.id = id;
		this.passwd = passwd;
		this.name = name;
		this.age = age;
	}
	
	// 조회용
	public MemberVo(String id, String passwd, String name, int age, String grade) {
		super();
		this.id = id;
		this.passwd = passwd;
		this.name = name;
		this.age = age;
		this.grade = grade;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	@Override
	public String toString() {
		return "member [id=" + id + ", passwd=" + passwd + ", name=" + name + ", age=" + age + "]";
	}
	
	
}
