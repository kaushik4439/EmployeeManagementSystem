package com.girnarsoft.springboot.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.girnarsoft.springboot.controller.DataBaseOperations;

public class ServiceClass {

	private static DataBaseOperations dataBaseOperations = new DataBaseOperations();

	public String promoteEmployee(JdbcTemplate jdbc, int employeeId, String newDesignation, int currentId) {

		String currentDesignation = dataBaseOperations.getDesignation(jdbc, employeeId);
		String yourDesignation = dataBaseOperations.getDesignation(jdbc, currentId);

		if (newDesignation.equalsIgnoreCase(currentDesignation)) {

			return "Already on same post";
		}

		else if (yourDesignation.equalsIgnoreCase("director")) {
			if (currentDesignation.equalsIgnoreCase("ceo") || currentDesignation.equalsIgnoreCase("director")
					|| newDesignation.equalsIgnoreCase("ceo")) {
				return " you don't have access to promote this employee";

			}
		}

		else if (yourDesignation.equalsIgnoreCase("hr")) {
			if (currentDesignation.equalsIgnoreCase("director") || currentDesignation.equalsIgnoreCase("ceo")
					|| currentDesignation.equalsIgnoreCase("HR") || newDesignation.equalsIgnoreCase("ceo")
					|| newDesignation.equalsIgnoreCase("director")) {
				return "you don't have access to promote this employee";

			}
		} else if (yourDesignation.equalsIgnoreCase("manager")) {
			if (currentDesignation.equalsIgnoreCase("director") || currentDesignation.equalsIgnoreCase("ceo")
					|| currentDesignation.equalsIgnoreCase("HR") || currentDesignation.equalsIgnoreCase("manager")
					|| newDesignation.equalsIgnoreCase("ceo") || newDesignation.equalsIgnoreCase("director")
					|| newDesignation.equalsIgnoreCase("hr")) {
				return "you don't have access to promote this employee";

			}
		}

		else if (!yourDesignation.equalsIgnoreCase("ceo"))
			return "you do not have access to promote";

		if (!dataBaseOperations.promoteEmployee(jdbc, employeeId, newDesignation))
			return "no employee found";

		return "successfully promoted";

	}

	public String deleteEmployee(JdbcTemplate jdbc, int employeeId, int currentId) {
		String designation = dataBaseOperations.getDesignation(jdbc, employeeId);
		String yourDesignation = dataBaseOperations.getDesignation(jdbc, currentId);
		if (yourDesignation.equalsIgnoreCase("ceo")) {
			if (designation.equalsIgnoreCase("ceo")) {

				return "you can't delete this employee";
			}
		}
		if (yourDesignation.equalsIgnoreCase("director")) {
			if (designation.equalsIgnoreCase("ceo") || designation.equalsIgnoreCase("director")) {

				return "you can't delete this employee";
			}
		} else if (yourDesignation.equalsIgnoreCase("hr")) {
			if (designation.equalsIgnoreCase("ceo") || designation.equalsIgnoreCase("director")
					|| designation.equalsIgnoreCase("HR")) {
				return "you can't delete this employee";

			}

		} else if (yourDesignation.equalsIgnoreCase("manager")) {
			if (designation.equalsIgnoreCase("ceo") || designation.equalsIgnoreCase("director")
					|| designation.equalsIgnoreCase("HR") || designation.equalsIgnoreCase("manager")) {
				return "you can't delete this employee";

			}
		}

		else if (!yourDesignation.equalsIgnoreCase("ceo"))
			return "you do not have access to delete";

		if (!dataBaseOperations.deleteEmployee(jdbc, employeeId))
			return "no employee found";
		return "successfully deleted";

	}

	public String hireEmployee(JdbcTemplate jdbc, String name, int deptId, String designation, int age, int mentorId,
			String password, int currentId) {

		String yourDesignation = dataBaseOperations.getDesignation(jdbc, currentId);
		if (yourDesignation.equalsIgnoreCase("director")) {
			if (designation.equalsIgnoreCase("ceo")) {
				return "you can't hire ceo";
			}
		} else if (yourDesignation.equalsIgnoreCase("hr")) {
			if (designation.equalsIgnoreCase("ceo") || designation.equalsIgnoreCase("director")) {
				return "you can't hire " + designation;
			}

		} else if (yourDesignation.equalsIgnoreCase("manager")) {
			if (designation.equalsIgnoreCase("ceo") || designation.equalsIgnoreCase("director")
					|| designation.equalsIgnoreCase("hr")) {
				return "you can't hire " + designation;
			}

		} else if (!yourDesignation.equalsIgnoreCase("ceo"))
			return "you do not have access to hire";

		dataBaseOperations.insertEmp(jdbc, name, deptId, designation, age, currentId, password);

		return "successfully added";

	}

}
