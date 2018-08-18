package com.girnarsoft.springboot.dao;

public class Employee {
	private int employeeID;
	private String name;
	private String department;
	private String designation;
	private int age;

	public Employee(int employeeID, String name, int age) {

		this.employeeID = employeeID;
		this.name = name;
		this.age = age;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getAge() {
		return age;
	}

	public String getDepartment() {
		return department;
	}

	public Employee() {

	}

	public String getDesignation() {
		return designation;
	}

	public void setEmployeeID(int employeeID) {
		this.employeeID = employeeID;
	}

	public String setDesignation(String designation) {
		this.designation = designation;
		return designation;
	}

	public String setDepartment(String department) {
		this.department = department;
		return department;
	}

	public int getEmployeeID() {
		return employeeID;
	}

	public String getName() {
		return name;
	}

}
