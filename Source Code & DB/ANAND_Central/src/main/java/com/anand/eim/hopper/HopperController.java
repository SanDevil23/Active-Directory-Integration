package com.anand.eim.hopper;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.anand.masters.M_Entity;
import com.anand.masters.M_Entity_Service;
import com.anand.eim.masters.M_Project_Function;
import com.anand.eim.masters.M_Project_Function_Service;
import com.anand.eim.masters.M_Project_Methodology;
import com.anand.eim.masters.M_Project_Methodology_Service;
import com.anand.eim.masters.M_Project_Type;
import com.anand.eim.masters.M_Project_Type_Service;
import com.anand.masters.M_User;
import com.anand.masters.M_User_Service;

@Controller
public class HopperController {

	@Autowired private M_User_Service mUserService;
	@Autowired private M_Entity_Service mEntityService;
	@Autowired private M_Project_Function_Service projectFunctionService;
	@Autowired private M_Project_Methodology_Service projectMethodologyService;
	@Autowired private M_Project_Type_Service projectTypeService;
	@Autowired private T_Project_Hopper_Service projectHopperService;

	@ModelAttribute("adminList")
	public List<M_User> adminList() { return mUserService.getActiveUserByRole(1, "EIM Admin"); }

	@ModelAttribute("projectLeaderList")
	public List<M_User> projectLeaderList() { return mUserService.getActiveUserByRole(1, "EIM Project Leader"); }

	@ModelAttribute("sponsorList")
	public List<M_User> sponsorList() { return mUserService.getActiveUserByRole(1, "EIM Sponsor"); }

	@ModelAttribute("problemSolvingLeaderList")
	public List<M_User> problemSolvingLeaderList() { return mUserService.getActiveUserByRole(1, "EIM Problem Solving Leader Primary"); }

	@ModelAttribute("corporateProblemSolvingLeaderList")
	public List<M_User> corporateProblemSolvingLeaderList() { return mUserService.getActiveUserByRole(1, "EIM Corporate Problem-Solving Leader"); }

	@ModelAttribute("projectMethodList")
	public List<M_Project_Methodology> projectMethodList() { return projectMethodologyService.getProjectMethodologyList(); }

	@ModelAttribute("projectTypeList")
	public List<M_Project_Type> projectTypeList() { return projectTypeService.getProjectTypeList(); }

	@ModelAttribute("projectFunctionList")
	public List<M_Project_Function> projectFunctionList() { return projectFunctionService.getProjectFunctionList(); }

	@ModelAttribute("companyList")
	public List<M_Entity> getCompanyList() { return mEntityService.getActiveChildEntityByStatus(1); }

	@RequestMapping("list-hopper")
	public String listHopper(HttpServletRequest request, Model model) {
		try {
			System.out.println("**** list-hopper 1");
			model.addAttribute("hopperProjectList", projectHopperService.getHopperProjectList(request, 0));
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "eim/hopper/listHopper";
	}

	@RequestMapping("list-hopper-history")
	public String listHopperHistory(HttpServletRequest request, Model model) {
		try {
			System.out.println("**** list-hopper");
			model.addAttribute("hopperProjectList", projectHopperService.getHopperProjectHistoryList(request, 0));
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "eim/hopper/listHopperHistory";
	}

	@RequestMapping("create-hopper")
	public String createHopper(HttpServletRequest request, Model model, @ModelAttribute("projectHopper") T_Project_Hopper projectHopper) {
		try {
			System.out.println("**** create-hopper");
			
			model.addAttribute("createEditHopper", 1);
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "eim/hopper/createHopper";
	}

	@PostMapping("saveProjectHopper")
	public String saveProjectHopper(HttpServletRequest request, Model model, @ModelAttribute("projectHopper") T_Project_Hopper projectHopper,
			RedirectAttributes reAttr) {
		try {
			System.out.println("**** saveProjectHopper");
			String response = projectHopperService.saveHopperProjectDetails(projectHopper, request);
			System.out.println("save project hopper response : "+response);
			if(response.contains("done")) {
				reAttr.addFlashAttribute("css", "success");
				if(response.contains("add")) {
					reAttr.addFlashAttribute("regMsg", "Project Hopper added successfully.");
				} else {
					reAttr.addFlashAttribute("regMsg", "Project Hopper information edited successfully.");
				}
			} else {
				reAttr.addFlashAttribute("css", "danger");
				reAttr.addFlashAttribute("regMsg", "Something went wrong, try again after sometime.");
			}
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
			reAttr.addFlashAttribute("css", "danger");
			reAttr.addFlashAttribute("regMsg", "Something went wrong, try again after sometime.");
		}
		return "redirect:/list-hopper";
	}

	@RequestMapping("edit-hopper")
	public String editHopper(HttpServletRequest request, Model model) {
		try {
			System.out.println("**** edit-hopper");
			model.addAttribute("createEditHopper", 2);
			model.addAttribute("projectHopper", projectHopperService.getHopperProjectDetail(request));
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "eim/hopper/createHopper";
	}
}
