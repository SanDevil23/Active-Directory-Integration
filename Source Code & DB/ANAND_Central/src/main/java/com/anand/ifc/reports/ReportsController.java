package com.anand.ifc.reports;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.anand.masters.M_Department;
import com.anand.masters.M_Entity;
import com.anand.masters.M_Entity_Service;

@Controller
public class ReportsController {

	@Autowired private M_Entity_Service mEntityService;

	@ModelAttribute("activeParentEntityList")
	public List<M_Entity> activeParentEntityList() { return mEntityService.getActiveParentEntityByStatus(1); }

	@ModelAttribute("activeChildEntityList")
	public List<M_Entity> activeChildEntityList() { return mEntityService.getActiveChildEntityByStatus(1); }

	@GetMapping("reports-ifc")
	public String reports(HttpServletRequest request) {
		try {
			System.out.println("**** reports");
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "ifc/reports/reports_dashboard";
	}

	@GetMapping("entity-wise-report")
	public String entityWiseReport(HttpServletRequest request, Model model, @ModelAttribute("department") M_Department department) {
		try {
			System.out.println("**** reports");
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "ifc/reports/reports";
	}
}
