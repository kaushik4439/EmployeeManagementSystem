package com.girnarsoft.springboot.controller;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.girnarsoft.springboot.dao.Employee;

public class EmployeeMapper implements RowMapper<Employee> {

	DataBaseOperations dataBaseOperations = new DataBaseOperations();
	
	@Override
	public Employee mapRow(ResultSet rs, int rowNum) throws SQLException {
		Employee employee = new Employee();
		employee.setEmployeeID(rs.getInt("empID"));
		employee.setName(rs.getString("name"));
		employee.setAge(rs.getInt("age"));
		//employee.setDepartment(dataBaseOperations.getDepartmentName(jdbc,rs.getInt("deptID")));
		employee.setDesignation(rs.getString("designation"));
		return employee;
	}

}
