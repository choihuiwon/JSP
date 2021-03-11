package config;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import dto.EmployeeDto;

public interface SQLMapper {
	@Select("select * from employee")
	public List<EmployeeDto> selectAllEmployee();
	
	@Select("select count(*) from employee")
	public int selectEmployeeCount();

	@Select("select * from employee where position < #{position}")
	public List<EmployeeDto> selectPositionEmployee(int posistion);
	
	@Select("select * from employee where position between #{n1} and #{n2}")
	public List<EmployeeDto> selectPositionAreaEmployee(@Param("n1") int num1, @Param("n2") int num2);

	@Select("select * from employee where eno like #{eno}")
	public EmployeeDto selectEmployee(String eno);

	@Insert("insert into employee(eno, name, department, position) values(#{eno},#{name},#{department},#{position})")
	public int insertEmployee(EmployeeDto dto);

	@Update("update employee set name = #{name}, department = #{department}, position = #{position} where eno like #{eno}")
	public int updateEmployee(EmployeeDto dto);

	@Delete("delete from employee where eno like #{eno}")
	public int deleteEmployee(String eno);

	@Select("select * from employee where name like '%'||#{name}||'%'")
	public List<EmployeeDto> selectSearchEmployee(String name);
}
