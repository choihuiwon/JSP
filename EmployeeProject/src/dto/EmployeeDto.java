package dto;

public class EmployeeDto {
	private String eno;
	private String name;
	private String department;
	private int position;
	private int salary;
	
	
	// 조회용
	public EmployeeDto(String eno, String name, String department, int position, int salary) {
		super();
		this.eno = eno;
		this.name = name;
		this.department = department;
		this.position = position;
		this.salary = salary;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	// 등록용
	public EmployeeDto(String eno, String name, String department, int position) {
		super();
		this.eno = eno;
		this.name = name;
		this.department = department;
		this.position = position;
	}
	public String getEno() {
		return eno;
	}
	public void setEno(String eno) {
		this.eno = eno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public int getPosition() {
		return position;
	}
	public void setPosition(int position) {
		this.position = position;
	}
	@Override
	public String toString() {
		return "EmployeeDto [eno=" + eno + ", name=" + name + ", department=" + department + ", position=" + position
				+ "]";
	}
	
	
}