package dto;

public class PersonDTO {
	private String name;
	private int age;
	
	// beans를 사용하려면 꼭 있어야하는 것 : setter/getter/***기본생성자****개중요
	public PersonDTO() {
		super();
		System.out.println("PersonDTO Constructor");
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
	
}
