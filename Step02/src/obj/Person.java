package obj;
public class Person {
	private String id;
	private int age;
	public Person(String id, int age) {
		super();
		this.id = id;
		this.age = age;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	@Override
	public String toString() {
		return "Person [id=" + id + ", age=" + age + "]";
	}
	
	
}
