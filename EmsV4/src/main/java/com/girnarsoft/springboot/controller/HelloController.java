package com.girnarsoft.springboot.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HelloController {

	@Autowired
	JdbcTemplate jdbc;

	DataBaseOperations db = new DataBaseOperations();

	@RequestMapping("/")
	public String index() {
		return "index";
	}

	@RequestMapping("/hello")
	public String sayHello(@RequestParam("id") String id, @RequestParam("password") String password, Model model,
			HttpSession httpSession) {
		
		
		model.addAttribute("id", id);
		model.addAttribute("pass", password);
		if (db.verifyPassword(jdbc, Integer.parseInt(id), password)) {
			httpSession.setAttribute("currentId", id);
			String designation = db.getDesignation(jdbc, Integer.parseInt(id));
			return "ceo";
		} else {
			model.addAttribute("errormsg", "enter correct details");
			return "index";
		}
	}

}
