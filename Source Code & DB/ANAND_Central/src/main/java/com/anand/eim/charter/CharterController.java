package com.anand.eim.charter;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.anand.eim.masters.M_Project_Function;
import com.anand.eim.masters.M_Project_Function_Service;
import com.anand.eim.masters.M_Project_Methodology;
import com.anand.eim.masters.M_Project_Methodology_Service;
import com.anand.eim.masters.M_Project_Type;
import com.anand.eim.masters.M_Project_Type_Service;
import com.anand.masters.M_Entity;
import com.anand.masters.M_Entity_Service;
import com.anand.masters.M_User;
import com.anand.masters.M_User_Service;

@Controller
public class CharterController {

	@Autowired private M_User_Service mUserService;
	@Autowired private M_Entity_Service mEntityService;
	@Autowired private M_Project_Function_Service projectFunctionService;
	@Autowired private M_Project_Methodology_Service projectMethodologyService;
	@Autowired private M_Project_Type_Service projectTypeService;
	@Autowired private T_Project_Charter_Service projectCharterService;
	@Autowired private T_Project_Charter_Approval_Service projectCharterApprovalService;
	@Autowired private T_Project_Contract_Approval_Service projectContractApprovalService;
	@Autowired private T_Project_Closure_Approval_Service projectClosureApprovalService;


	@ModelAttribute("financeControllerList")
	public List<M_User> financeControllerList() { return mUserService.getActiveUserByRole(1, "EIM Finance Controller"); }

	@ModelAttribute("projectInternalTeam")
	public List<M_User> projectInternalTeam() { return mUserService.getUserOfSameEntities(); }

	@ModelAttribute("projectLeaderList")
	public List<M_User> projectLeaderList() { return mUserService.getActiveUserByRole(1, "EIM Project Leader"); }

	@ModelAttribute("sponsorList")
	public List<M_User> sponsorList() { return mUserService.getActiveUserByRole(1, "EIM Sponsor"); }

	@ModelAttribute("processOwnerList")
	public List<M_User> processOwnerList() { return mUserService.getActiveUserByRole(1, "EIM Process Owner"); }

	@ModelAttribute("problemSolvingLeaderList")
	public List<M_User> problemSolvingLeaderList() { return mUserService.getActiveUserByRole(1, "EIM Problem Solving Leader Primary"); }

	@ModelAttribute("corporateProblemSolvingLeaderList")
	public List<M_User> corporateProblemSolvingLeaderList() { return mUserService.getActiveUserByRole(1, "EIM Corporate Problem-Solving Leader"); }

	@ModelAttribute("cooOrBusinessLeaderList")
	public List<M_User> cooOrBusinessLeaderList() { return mUserService.getActiveUserByRole(1, "EIM Business Leader COO"); }

	@ModelAttribute("projectMethodList")
	public List<M_Project_Methodology> projectMethodList() { return projectMethodologyService.getProjectMethodologyList(); }

	@ModelAttribute("projectTypeList")
	public List<M_Project_Type> projectTypeList() { return projectTypeService.getProjectTypeList(); }

	@ModelAttribute("projectFunctionList")
	public List<M_Project_Function> projectFunctionList() { return projectFunctionService.getProjectFunctionList(); }

	@ModelAttribute("companyList")
	public List<M_Entity> getCompanyList() { return mEntityService.getActiveChildEntityByStatus(1); }

	@ModelAttribute("parentEntityList")
	public List<M_Entity> getParentEntityList() { return mEntityService.getActiveParentEntityByStatus(1); }
	
	@ModelAttribute("childEntityList")
	public List<M_Entity> getChildEntityList() { return mEntityService.getActiveChildEntityByStatus(1); }

	@GetMapping("list-charter")
	public String listHopper(HttpServletRequest request, Model model) {
		try {
			List<T_Project_Charter> listCharter=projectCharterService.getCharterProjectList(request, 0);
			System.out.println("**** list-charter");
			Integer year=0;
			SimpleDateFormat df = new SimpleDateFormat("dd-MMM-yyyy");
			year = Integer.parseInt(""+df.format(listCharter.get(0).getCharterCreatedOn()).split("-")[2]);
			model.addAttribute("tempYearId", year);
			model.addAttribute("charterProjectList",listCharter);
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "eim/charter/listCharter";
	}

	@PostMapping("list-charter")
	public String postCharterValue(HttpServletRequest request, Model model, @ModelAttribute("listCharter") T_Project_Charter projectCharter,
			 RedirectAttributes reAttr) {
		try {
			Integer emptySelectFlag = -1;
			if(request.getParameter("yearId") !=  null && emptySelectFlag.compareTo(Integer.parseInt(""+request.getParameter("yearId"))) == 0) {
				emptySelectFlag = null;
				return "redirect:/list-charter";
			}
			List<T_Project_Charter> charterList = projectCharterService.getCharterProjectList(request, 0);			
			model.addAttribute("tempYearId", request.getParameter("yearId"));
			model.addAttribute("tempEntityId", request.getParameter("entityId"));
			model.addAttribute("tempChildId", request.getParameter("childId"));
			model.addAttribute("charterProjectList", charterList);
			emptySelectFlag = null;
		} catch(Exception e) {
			e.printStackTrace();
			reAttr.addFlashAttribute("css", "danger");
			reAttr.addFlashAttribute("regMsg", "Something went wrong, try again after sometime.");
		}		
		return "eim/charter/listCharter";
	}

	@GetMapping("list-charter-history")
	public String listHopperHistory(HttpServletRequest request, Model model) {
		try {
			System.out.println("**** list-charter-history");
			model.addAttribute("charterProjectList", projectCharterService.getCharterProjectHistoryList(request, 0));
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "eim/charter/listCharterHistory";
	}

	@GetMapping("create-charter")
	public String createHopper(HttpServletRequest request, Model model, @ModelAttribute("projectCharter") T_Project_Charter projectCharter) {
		try {
			System.out.println("**** create-charter");
			model.addAttribute("createEditCharter", 1);
			projectCharter.setCharterActive(1);
			projectCharter.setCountForCertification(0);
			projectCharter.setAlignedForBusinessGoalTree(0);
			projectCharter.setFallsUnderSponsorFunctionalArea(0);
			projectCharter.setProjectStatus(1);
			projectCharter.setSupplyChainImprovementProject(0);
			projectCharter.setSupplierFocusProject(0);
			projectCharter.setProjectWarrantyFocus(0);
			projectCharter.setExternalCustomerFocusProject(0);
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "eim/charter/createCharter";
	}

	@GetMapping("view-charter")
	public String viewCharter(HttpServletRequest request, Model model, @ModelAttribute("projectCharter") T_Project_Charter projectCharter
			, @ModelAttribute("charterApproval") T_Project_Charter_Approval projectCharterApproval) {
		try {
			System.out.println("**** view-charter");
			projectCharter = projectCharterService.getCharterProjectDetail(request);
			model.addAttribute("projectCharter", projectCharter);
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "eim/charter/viewCharter";
	}

	@PostMapping("saveProjectCharter")
	public String saveProjectCharter(HttpServletRequest request, Model model, @ModelAttribute("projectCharter") T_Project_Charter projectCharter,
			RedirectAttributes reAttr, @RequestParam("attachcharter") MultipartFile attachcharter) {
		try {
			System.out.println("**** saveProjectCharter");
			if(!attachcharter.isEmpty()) {
				projectCharter.setTempCharterAttachment(attachcharter);
			}
			String response = projectCharterService.saveCharterProjectDetails(projectCharter, request);
			System.out.println("save project hopper response : "+response);
			reAttr.addFlashAttribute("css", "success");
			if(response.contains("add")) {
				reAttr.addFlashAttribute("regMsg", "Project Charter added successfully.");
			} else {
				reAttr.addFlashAttribute("regMsg", "Project Charter information edited successfully.");
			}
			if(response.contains("done") && projectCharter.getSaveOrSubmit().compareTo(1) == 0) {
				projectCharterService.submitCharterMail(projectCharter, request);
			}
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
			reAttr.addFlashAttribute("css", "danger");
			reAttr.addFlashAttribute("regMsg", "Something went wrong, try again after sometime.");
		}
		if(projectCharter.getSaveOrSubmit().compareTo(1) == 0) {
			return "redirect:/list-charter";
		}
		return "redirect:/edit-charter?id="+projectCharter.gettProjectCharterId();
	}
	
	@PostMapping("saveProjectContractCharter")
	public String saveProjectContractCharter(HttpServletRequest request, Model model, @ModelAttribute("projectCharter") T_Project_Charter projectCharter,
			RedirectAttributes reAttr, @RequestParam("attachpresentation") MultipartFile attachpresentation) {
		try {
			System.out.println("**** saveProjectCharter");
			if(!attachpresentation.isEmpty()) {
				projectCharter.setTempFinalPresentation(attachpresentation);
			}
			String response = projectCharterService.saveCharterContractProjectDetails(projectCharter, request);
			System.out.println("save project hopper response : "+response);
			reAttr.addFlashAttribute("css", "success");
			if(response.contains("add")) {
				reAttr.addFlashAttribute("regMsg", "Project Charter saved successfully.");
			} else {
				reAttr.addFlashAttribute("regMsg", "Project Charter information edited successfully.");
			}
			if(response.contains("done") && projectCharter.getSaveOrSubmit().compareTo(1) == 0) {
				projectCharterService.submitCharterMail(projectCharter, request);
			}
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
			reAttr.addFlashAttribute("css", "danger");
			reAttr.addFlashAttribute("regMsg", "Something went wrong, try again after sometime.");
		}
		if(projectCharter.getSaveOrSubmit().compareTo(1) == 0) {
			return "redirect:/list-charter";
		}
		return "redirect:/view-charter?id="+projectCharter.gettProjectCharterId();
	}
	
	@PostMapping("saveProjectClosureCharter")
	public String saveProjectClosureCharter(HttpServletRequest request, Model model, @ModelAttribute("projectCharter") T_Project_Charter projectCharter,
			RedirectAttributes reAttr, @RequestParam("attachclosurepresentation") MultipartFile attachclosurepresentation) {
		try {
			System.out.println("**** saveProjectCharter");
			if(!attachclosurepresentation.isEmpty()) {
				projectCharter.setTempFinalClosurePresentation(attachclosurepresentation);
			}
			String response = projectCharterService.saveCharterClosureProjectDetails(projectCharter, request);
			System.out.println("save project hopper response : "+response);
			reAttr.addFlashAttribute("css", "success");
			if(response.contains("add")) {
				reAttr.addFlashAttribute("regMsg", "Project Charter saved successfully.");
			} else {
				reAttr.addFlashAttribute("regMsg", "Project Charter information edited successfully.");
			}
			if(response.contains("done") && projectCharter.getSaveOrSubmit().compareTo(1) == 0) {
				projectCharterService.submitCharterMail(projectCharter, request);
			}
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
			reAttr.addFlashAttribute("css", "danger");
			reAttr.addFlashAttribute("regMsg", "Something went wrong, try again after sometime.");
		}
		if(projectCharter.getSaveOrSubmit().compareTo(1) == 0) {
			return "redirect:/list-charter";
		}
		return "redirect:/view-charter?id="+projectCharter.gettProjectCharterId();
	}
	
	@PostMapping("saveSustenaceAudit")
	public String saveSustenanceAudit(HttpServletRequest request, Model model, @ModelAttribute("projectCharter") T_Project_Charter projectCharter,
			RedirectAttributes reAttr) {
		try {
			System.out.println("**** saveProjectCharter");
			String response = projectCharterService.saveSustenanceAuditDetails(projectCharter, request);
			System.out.println("save project hopper response : "+response);
			reAttr.addFlashAttribute("css", "success");
			if(response.contains("add")) {
				reAttr.addFlashAttribute("regMsg", "Project Charter saved successfully.");
			} else {
				reAttr.addFlashAttribute("regMsg", "Project Charter information edited successfully.");
			}
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
			reAttr.addFlashAttribute("css", "danger");
			reAttr.addFlashAttribute("regMsg", "Something went wrong, try again after sometime.");
		}
		return "redirect:/list-charter";
	}
	
	@PostMapping("saveSustenaceScore")
	public String saveSustenaceScore(HttpServletRequest request, Model model, @ModelAttribute("projectCharter") T_Project_Charter projectCharter,
			RedirectAttributes reAttr) {
		try {
			System.out.println("**** saveSustenanceScore");
			String response = projectCharterService.saveSustenanceScoreDetails(projectCharter, request);
			System.out.println("save project hopper response : "+response);
			reAttr.addFlashAttribute("css", "success");
			if(response.contains("add")) {
				reAttr.addFlashAttribute("regMsg", "Sustenance Score saved successfully.");
			}
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
			reAttr.addFlashAttribute("css", "danger");
			reAttr.addFlashAttribute("regMsg", "Something went wrong, try again after sometime.");
		}
		return "redirect:/list-charter";
	}
		
	
	@GetMapping("edit-charter")
	public String editCharter(HttpServletRequest request, Model model) {
		try {
			System.out.println("**** edit-charter");
			model.addAttribute("createEditCharter", 2);
			model.addAttribute("projectCharter", projectCharterService.getCharterProjectDetail(request));
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "eim/charter/createCharter";
	}

	@GetMapping("charter-approval-waiting")
	public String listCharterApprovalWaiting(HttpServletRequest request, Model model) {
		try {
			System.out.println("**** charter-approval-waiting");
			model.addAttribute("charterApprovalList", projectCharterApprovalService.getCharterApprovalList(request));
			model.addAttribute("contractApprovalList", projectContractApprovalService.getContractApprovalList(request));
			model.addAttribute("closureApprovalList", projectClosureApprovalService.getClosureApprovalList(request));
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "eim/charter/listCharterApprovalWaiting";
	}

	@GetMapping("approve-charter")
	public String approveCharter(HttpServletRequest request, Model model, @ModelAttribute("projectCharter") T_Project_Charter projectCharter) {
		try {
			System.out.println("**** approve-charter");
			projectCharter = projectCharterService.getCharterProjectDetail(request);
			model.addAttribute("projectCharter", projectCharter);
			T_Project_Charter_Approval projectCharterApproval = new T_Project_Charter_Approval();
			model.addAttribute("charterApproval", projectCharterApproval);
			projectCharterApproval = null;
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "eim/charter/charterApproval";
	}
	
	@GetMapping("approve-contract")
	public String approveContract(HttpServletRequest request, Model model, @ModelAttribute("projectCharter") T_Project_Charter projectCharter) {
		try {
			System.out.println("**** approve-charter");
			projectCharter = projectCharterService.getCharterProjectDetail(request);
			model.addAttribute("projectCharter", projectCharter);
			T_Project_Contract_Approval projectContractApproval = new T_Project_Contract_Approval();
			model.addAttribute("contractApproval", projectContractApproval);
			projectContractApproval = null;
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "eim/charter/charterApproval";
	}
	
	@GetMapping("approve-closure")
	public String approveClosure(HttpServletRequest request, Model model, @ModelAttribute("projectCharter") T_Project_Charter projectCharter) {
		try {
			System.out.println("**** approve-closure");
			projectCharter = projectCharterService.getCharterProjectDetail(request);
			model.addAttribute("projectCharter", projectCharter);
			T_Project_Closure_Approval projectClosureApproval = new T_Project_Closure_Approval();
			model.addAttribute("closureApproval", projectClosureApproval);
			projectClosureApproval = null;
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "eim/charter/charterApproval";
	}
	
	@PostMapping("submitApprovalStatus")
	public String submitApprovalStatus(HttpServletRequest request, Model model, @ModelAttribute("charterApproval") T_Project_Charter_Approval charterApproval,
			RedirectAttributes reAttr) {
		try {
			System.out.println("**** submitApprovalStatus");
			String response = projectCharterApprovalService.saveProjectCharterApproval(charterApproval, request);
			reAttr.addFlashAttribute("css", "success");
			reAttr.addFlashAttribute("regMsg", "Project Charter Approved added successfully, sent to next approver.");
			if(response.contains("next")) {
				
			} else if(response.contains("rejected")) {
				
			} else if(response.contains("terminate")) {
				
			}
			System.out.println("****");
			response = null;
			return "redirect:/charter-approval-waiting";
		} catch(Exception e) {
			e.printStackTrace();
			reAttr.addFlashAttribute("css", "danger");
			reAttr.addFlashAttribute("regMsg", "Something went wrong, try again after sometime.");
			return "redirect:/approve-charter?id="+charterApproval.getProjectCharterId();
		}
	}
	
	@PostMapping("submitContractApprovalStatus")
	public String submitContractApprovalStatus(HttpServletRequest request, Model model, @ModelAttribute("contractApproval") T_Project_Contract_Approval contractApproval,
			RedirectAttributes reAttr) {
		try {
			System.out.println("**** submitApprovalStatus");
			String response = projectContractApprovalService.saveProjectContractApproval(contractApproval, request);
			reAttr.addFlashAttribute("css", "success");
			reAttr.addFlashAttribute("regMsg", "Project Contract Approved added successfully, sent to next approver.");
			if(response.contains("next")) {
				
			} else if(response.contains("rejected")) {
				
			} else if(response.contains("terminate")) {
				
			}
			System.out.println("****");
			response = null;
			return "redirect:/charter-approval-waiting";
		} catch(Exception e) {
			e.printStackTrace();
			reAttr.addFlashAttribute("css", "danger");
			reAttr.addFlashAttribute("regMsg", "Something went wrong, try again after sometime.");
			return "redirect:/approve-contract?id="+contractApproval.getProjectCharterId();
		}
	}
	
	
	
	@PostMapping("submitClosureApprovalStatus")
	public String submitClosureApprovalStatus(HttpServletRequest request, Model model, @ModelAttribute("closureApproval") T_Project_Closure_Approval closureApproval,
			RedirectAttributes reAttr) {
		try {
			System.out.println("**** submitApprovalStatus");
			String response = projectClosureApprovalService.saveProjectClosureApproval(closureApproval, request);
			reAttr.addFlashAttribute("css", "success");
			reAttr.addFlashAttribute("regMsg", "Project Closure Approved added successfully, sent to next approver.");
			if(response.contains("next")) {
				
			} else if(response.contains("rejected")) {
				
			} else if(response.contains("terminate")) {
				
			}
			System.out.println("****");
			response = null;
			return "redirect:/charter-approval-waiting";
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println(e);
			reAttr.addFlashAttribute("css", "danger");
			reAttr.addFlashAttribute("regMsg", "Something went wrong, try again after sometime.");
			return "redirect:/approve-closure?id="+closureApproval.getProjectCharterId();
		}
	}
	
	@GetMapping("edit-charter-contract")
	public String editCharterContract(HttpServletRequest request, Model model) {
		try {
			System.out.println("**** edit-charter-contract");
			model.addAttribute("createEditCharter", 2);
			model.addAttribute("projectCharter", projectCharterService.getCharterProjectDetail(request));
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "eim/charter/editCharterContract";
	}
	@GetMapping("edit-charter-closure")
	public String editCharterClosure(HttpServletRequest request, Model model) {
		try {
			System.out.println("**** edit-charter-closure");
			model.addAttribute("createEditCharter", 2);
			model.addAttribute("projectCharter", projectCharterService.getCharterProjectDetail(request));
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "eim/charter/editCharterClosure";
	}
	@GetMapping("edit-sustenance-audit")
	public String editSustenanceAudit(HttpServletRequest request, Model model) {
		try {
			System.out.println("**** edit-sustenance-audit");
			model.addAttribute("createEditCharter", 2);
			model.addAttribute("projectCharter", projectCharterService.getCharterProjectDetail(request));
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "eim/charter/editSustenanceAudit";
	}
}