package com.girnarsoft.springboot.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.integration.IntegrationProperties.Jdbc;
import org.springframework.jdbc.core.JdbcTemplate;

import com.girnarsoft.springboot.dao.Employee;

public class DataBaseOperations {

	public boolean verifyPassword(JdbcTemplate jdbc, int empId, String password) {
		String sql = "select name,empID,password from Employee where empID = " + empId + "&& password = '" + password
				+ "'";

		List<Map<String, Object>> list = jdbc.queryForList(sql);
		System.out.println(list);

		if (list.isEmpty())
			return false;
		else
			return true;

	}

	public int getDepartId(JdbcTemplate jdbc, String department) {
		String GET_DEPARTMENT = "select deptID from Department where name = ?";
		return jdbc.queryForObject(GET_DEPARTMENT, Integer.class, department);
	}

	public String getDepartmentName(JdbcTemplate jdbc, int deptId) {
		String GET_DEPARTMENT = "select name from Department where deptID = ?";
		String department = jdbc.queryForObject(GET_DEPARTMENT, String.class, deptId);
		return department;

	}

	public void insertEmp(JdbcTemplate jdbc, String name, int deptId, String designation, int age, int mentor,
			String password) {
		String sql = "insert into Employee(name,deptID,designation,age,mentor,password) values(?,?,?,?,?,?)";
		Object[] params = new Object[] { name, deptId, designation, age, mentor, password };
		jdbc.update(sql, params);

	}

	public String getDesignation(JdbcTemplate jdbc, int employeeId) {
		if (!checkEmployee(jdbc, employeeId))
			return null;
		String sql = "select designation from Employee where empID = ?";

		String designation = jdbc.queryForObject(sql, String.class, employeeId);
		return designation;

	}

	public boolean deleteEmployee(JdbcTemplate jdbc, int employeeId) {
		if (!checkEmployee(jdbc, employeeId))
			return false;
		String DELETE_EMPLOYEE = "delete from Employee where empID = ?";
		jdbc.update(DELETE_EMPLOYEE, employeeId);

		return true;

	}

	public List<Employee> getAllEmployee(JdbcTemplate jdbc) {
		String SQL = "select * from Employee";
		List<Employee> employee = jdbc.query(SQL, new EmployeeMapper());
		return employee;
	}

	public List<Employee> getEmployeeUnderYou(JdbcTemplate jdbc, int mentorId) {
		String sql = "select * from Employee where mentor = ?";
		Object[] params = new Object[] {mentorId};

		List<Employee> employee =  jdbc.query(sql,params,new EmployeeMapper());
		return employee;

	}

	public boolean checkEmployee(JdbcTemplate jdbc, int employeeId) {
		String sql = "select count(*) from Employee where empID = ?";
		int id = jdbc.queryForObject(sql, Integer.class, employeeId);
		if (id <= 0)
			return false;

		return true;

	}

	public boolean promoteEmployee(JdbcTemplate jdbc, int employeeId, String newDesignation) {
		if (!checkEmployee(jdbc, employeeId))
			return false;
		String sql = "update Employee set designation = ? where empID = ?";

		Object[] params = new Object[] { newDesignation, employeeId };
		jdbc.update(sql, params);
		return true;

	}

}
