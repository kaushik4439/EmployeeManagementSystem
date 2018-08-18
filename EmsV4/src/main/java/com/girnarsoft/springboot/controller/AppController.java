package com.girnarsoft.springboot.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.girnarsoft.springboot.dao.Employee;
import com.girnarsoft.springboot.services.ServiceClass;

@Controller
public class AppController {
	@Autowired
	JdbcTemplate jdbc;

	DataBaseOperations db = new DataBaseOperations();
	ServiceClass serviceClass = new ServiceClass();

	@RequestMapping("/add")
	public String insertEmployee(@RequestParam("name1") String name, @RequestParam("password") String password,
			@RequestParam("designation") String designation, @RequestParam("department") String department,
			@RequestParam("age") int age, Model model, HttpSession httpSession) {

		int currentId = Integer.parseInt((String) httpSession.getAttribute("currentId"));
		int deptId = db.getDepartId(jdbc, department);
		String result = serviceClass.hireEmployee(jdbc, name, deptId, designation, age, currentId, password, currentId);
		model.addAttribute("errormessage", result);
		return "hire";
	}

	@RequestMapping("/delete")
	public String deleteEmployee(@RequestParam("id") int employeeId, Model model, HttpSession httpSession) {

		if (!db.checkEmployee(jdbc, employeeId)) {
			model.addAttribute("errormessage", "no employee found");
			return "delEmp";
		}
		int currentId = Integer.parseInt((String) httpSession.getAttribute("currentId"));
		String result = serviceClass.deleteEmployee(jdbc, employeeId, currentId);
		model.addAttribute("errormessage", result);
		return "delEmp";
	}

	@RequestMapping("/showemployee")
	public String showEmployee(Model model) {

		List<Employee> employee = db.getAllEmployee(jdbc);

		if (employee == null)
			model.addAttribute("errormessage", "No Employee Found");
		model.addAttribute("allEmployee", employee);
		return "showEmployee";

	}

	@RequestMapping("/promote")
	public String promoteEmployee(@RequestParam("employeeId") int employeeId,
			@RequestParam("designation") String newDesignation, Model model, HttpSession httpSession) {

		if (!db.checkEmployee(jdbc, employeeId)) {
			model.addAttribute("errormessage", "no employee found");
			return "promEmp";
		}
		int currentId = Integer.parseInt((String) httpSession.getAttribute("currentId"));

		String result = serviceClass.promoteEmployee(jdbc, employeeId, newDesignation, currentId);

		model.addAttribute("errormessage", result);
		return "promEmp";

	}

	@RequestMapping("/showEmpUnderYou")
	public String showEmployeeUnderMentor(Model model, HttpSession httpSession) {
		int currentId = Integer.parseInt((String) httpSession.getAttribute("currentId"));
		List<Employee> employee = db.getEmployeeUnderYou(jdbc, currentId);
		if (employee == null)
			model.addAttribute("errormessage", "No Employee Found");
		model.addAttribute("allEmployee", employee);

		return "empUnderMentor";

	}

	@RequestMapping("/hire")
	public String moveToHire() {
		return "hire";

	}

	@RequestMapping("/deleteEmp")
	public String moveToDelEmp() {
		return "delEmp";
	}

	@RequestMapping("/promoteEmp")
	public String moveToPromote() {
		return "promEmp";

	}

}
