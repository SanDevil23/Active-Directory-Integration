package com.anand.ijp;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.anand.masters.M_Department;
import com.anand.masters.M_Department_Service;
import com.anand.masters.M_Designation;
import com.anand.masters.M_Designation_Service;
import com.anand.masters.M_Entity;
import com.anand.masters.M_Entity_Service;
import com.anand.masters.M_Level;
import com.anand.masters.M_Level_Dao;
import com.anand.masters.M_Qualification;
import com.anand.masters.M_Qualification_Dao;

@Controller
public class JobPostingController {

	@Autowired private Job_Posting_Service jobPostingService;
	@Autowired private M_Entity_Service mEntityService;
	@Autowired private M_Department_Service mDepartmentService;
	@Autowired private M_Designation_Service mDesignationService;
	@Autowired private M_Qualification_Dao mQualificationDao;
	@Autowired private M_Level_Dao mLevelDao;

	@ModelAttribute("activeParentEntityList")
	public List<M_Entity> activeParentEntityList() { return mEntityService.getActiveParentEntityByStatus(1); }

	@ModelAttribute("activeChildEntityList")
	public List<M_Entity> activeChildEntityList() { return mEntityService.getActiveChildEntityByStatus(1); }

	@ModelAttribute("activeDepartmentList")
	public List<M_Department> activeDepartmentList() { return mDepartmentService.getDepartmentByActiveStatus(1); }

	@ModelAttribute("activeDesignationList")
	public List<M_Designation> activeDesignationList() { return mDesignationService.getDesignationByActiveStatus(1); }

	@ModelAttribute("activeLevelList")
	public List<M_Level> activeLevelList() { return mLevelDao.findByActive(1); }

	@ModelAttribute("activeQualificationList")
	public List<M_Qualification> activeQualificationList() { return mQualificationDao.findByActive(1); }

	@GetMapping("job-posting")
	public String jobPosting(HttpServletRequest request, @ModelAttribute("jobPosting") Job_Posting jobPosting, Model model) {
		try {
			if(request.getParameter("job-id") != null) {
				model.addAttribute("jobPosting", jobPostingService.getJobPostingDetails(request));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "ijp/jobPost/job-posting";
	}

	@PostMapping("job-posting")
	public String jobPostingPot(HttpServletRequest request, @ModelAttribute("jobPosting") Job_Posting jobPosting,
			RedirectAttributes reAttr, Model model) {
		StringBuilder response = new StringBuilder();
		try {
			response.append(jobPostingService.saveJobPostingDetails(request, jobPosting));
			if(response.toString().contains("done")) {
				reAttr.addFlashAttribute("css", "success");
				if(response.toString().contains("add")) {
					reAttr.addFlashAttribute("regMsg", "IJP Added Successfully");
				} else if(response.toString().contains("edit")) {
					reAttr.addFlashAttribute("regMsg", "IJP Edited Successfully");
				} else if(response.toString().contains("manpowerRequisitionIdMatch")) {
					model.addAttribute("css", "danger");
					model.addAttribute("regMsg", "Manpower Requisition ID Mismatch.");
					model.addAttribute("jobPosting", jobPosting);
					return "ijp/jobPost/job-posting";
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
			reAttr.addFlashAttribute("css", "danger");
			reAttr.addFlashAttribute("regMsg", "Something went wrong, try again later");
		}
		return "redirect:/job-list";
	}

	@GetMapping("job-list")
	public String dashboardIjp(HttpServletRequest request, Model model) throws Exception {
		try {
			System.out.println("**** dashboard");
			model.addAttribute("openIjpList", jobPostingService.getactiveJobsList(request, 0));
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "ijp/jobPost/job-list";
	}
}
