/**
 * *******************************************************************************************
 * Copyright © 2021 Anand Group India. All rights reserved.
 * No part of this product may be reproduced in any form by any means without prior
 * written authorization of Anand Automotive Private Limited and its licensors, if any.
 * *******************************************************************************************
 * Author - Sheshadhri Iyer
 */
package com.anand.index;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClient;
import org.springframework.security.oauth2.client.annotation.RegisteredOAuth2AuthorizedClient;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.anand.act.batch.ACT_Coaching_Batch;
import com.anand.act.batch.ACT_Coaching_Batch_Service;
import com.anand.aems.master.M_Aems_Category_Service;
import com.anand.aems.master.M_Aems_Sub_Category_Service;
import com.anand.ijp.Job_Posting_Service;
import com.anand.masters.M_Department_Service;
import com.anand.masters.M_Designation_Service;
import com.anand.masters.M_Entity;
import com.anand.masters.M_Entity_Service;
import com.anand.masters.M_User;
import com.anand.masters.M_User_App_Map;
import com.anand.masters.M_User_Dao;
import com.anand.masters.M_User_Role_Map;
import com.anand.masters.M_User_Service;

@Controller
public class IndexController {

	@Autowired private M_User_Dao userMasterDao;
	@Autowired private M_Department_Service mDepartmentService;
	@Autowired private M_Designation_Service mDesignationService;
	@Autowired private M_Entity_Service mEntityService;
	@Autowired private M_User_Service mUserService;
	@Autowired private M_Aems_Category_Service mAemsCategoryService;
	@Autowired private M_Aems_Sub_Category_Service mAemsSubCategoryService;
	@Autowired private Job_Posting_Service jobPostingService;
	

	@ModelAttribute("activeParentEntityList")
	public List<M_Entity> activeParentEntityList() { return mEntityService.getActiveParentEntityByStatus(1); }

	@ModelAttribute("activeChildEntityList")
	public List<M_Entity> activeChildEntityList() { return mEntityService.getActiveChildEntityByStatus(1); }

	public void setUserValuesInSession(String userEmail, HttpServletRequest request) {
		try {
			System.out.println("------\nCame here to set user values in session");
			HttpSession session = request.getSession(true);
			M_User currentUser = userMasterDao.findByUserLoginId(userEmail);
			session.setAttribute("itAdmin", 0);
			session.setAttribute("projectLeader", 0);
			session.setAttribute("eim", 0);
			session.setAttribute("sponser", 0);
			session.setAttribute("problemSolvingLeader", 0);
			session.setAttribute("financeController", 0);
			session.setAttribute("businessLeaderCoo", 0);
			session.setAttribute("coporateProblemSolvingLeader", 0);
			session.setAttribute("processOwner", 0);

			session.setAttribute("compHr", 0);
			session.setAttribute("corpHr", 0);

			session.setAttribute("praac", 0);
			session.setAttribute("lineManager", 0);
			session.setAttribute("sohPerson", 0);
			session.setAttribute("ifcAuditor", 0);
			session.setAttribute("ifcAdmin", 0);

			session.setAttribute("aemsCorp", 0);
			session.setAttribute("aemsComp", 0);
			session.setAttribute("aemsLoc", 0);
			session.setAttribute("aemsAdmin", 0);

			session.setAttribute("ctProcessOwner", 0);
		    session.setAttribute("ctSupervisor", 0);
		    session.setAttribute("ctAdmin", 0);
		    session.setAttribute("ctCoachee", 0);
			session.setAttribute("ctCoach", 0);
			
			session.setAttribute("mrApprover", 0);
			session.setAttribute("mrInitiator", 0);

			for(M_User_Role_Map object : currentUser.getUserInfoForRole()) {
				if(object.getUserRoleActive().compareTo(1) == 0) {
					System.out.println(object.getRoleInfoForUsers().getRoleName());
				    if(object.getRoleInfoForUsers().getRoleName().equalsIgnoreCase("IT Admin")) {
				    	session.setAttribute("itAdmin", 1);
				    } else if(object.getRoleInfoForUsers().getRoleName().equalsIgnoreCase("EIM Project Leader")) {
				    	session.setAttribute("projectLeader", 1);
				    } else if(object.getRoleInfoForUsers().getRoleName().equalsIgnoreCase("EIM Admin")) {
				    	session.setAttribute("eim", 1);
				    } else if(object.getRoleInfoForUsers().getRoleName().equalsIgnoreCase("EIM Sponsor")) {
				    	session.setAttribute("sponser", 1);
				    } else if(object.getRoleInfoForUsers().getRoleName().equalsIgnoreCase("EIM Problem Solving Leader Primary")) {
				    	session.setAttribute("problemSolvingLeader", 1);
				    } else if(object.getRoleInfoForUsers().getRoleName().equalsIgnoreCase("EIM Finance Controller")) {
				    	session.setAttribute("financeController", 1);
				    } else if(object.getRoleInfoForUsers().getRoleName().equalsIgnoreCase("EIM Business Leader COO")) {
				    	session.setAttribute("businessLeaderCoo", 1);
				    } else if(object.getRoleInfoForUsers().getRoleName().equalsIgnoreCase("EIM Corporate Problem-Solving Leader")) {
				    	session.setAttribute("coporateProblemSolvingLeader", 1);
				    } else if(object.getRoleInfoForUsers().getRoleName().equalsIgnoreCase("EIM Process Owner")) {
				    	session.setAttribute("processOwner", 1);
				    } else if(object.getRoleInfoForUsers().getRoleName().equalsIgnoreCase("Company HR")) {
				    	session.setAttribute("compHr", 1);
				    } else if(object.getRoleInfoForUsers().getRoleName().equalsIgnoreCase("Corporate HR")) {
				    	session.setAttribute("corpHr", 1);
				    } else if(object.getRoleInfoForUsers().getRoleName().equalsIgnoreCase("IFC PRAAC")) {
				    	session.setAttribute("praac", 1);
				    } else if(object.getRoleInfoForUsers().getRoleName().equalsIgnoreCase("IFC Line Manager")) {
				    	session.setAttribute("lineManager", 1);
				    } else if(object.getRoleInfoForUsers().getRoleName().equalsIgnoreCase("IFC SOH Person")) {
				    	session.setAttribute("sohPerson", 1);
				    } else if(object.getRoleInfoForUsers().getRoleName().equalsIgnoreCase("IFC Auditor")) {
				    	session.setAttribute("ifcAuditor", 1);
				    } else if(object.getRoleInfoForUsers().getRoleName().equalsIgnoreCase("IFC Admin")) {
				    	session.setAttribute("ifcAdmin", 1);
				    } else if(object.getRoleInfoForUsers().getRoleName().equalsIgnoreCase("AEMS Corporate Sustainability")) {
				    	session.setAttribute("aemsCorp", 1);
				    } else if(object.getRoleInfoForUsers().getRoleName().equalsIgnoreCase("AEMS Company Location Sustainability")) {
				    	session.setAttribute("aemsComp", 1);
				    } else if(object.getRoleInfoForUsers().getRoleName().equalsIgnoreCase("AEMS Company Location Sustainability")) {
				    	session.setAttribute("aemsLoc", 1);
				    } else if(object.getRoleInfoForUsers().getRoleName().equalsIgnoreCase("AEMS Admin")) {
				    	session.setAttribute("aemsAdmin", 1);
				    } else if(object.getRoleInfoForUsers().getRoleName().equalsIgnoreCase("CT Process Owner")) {
				    	session.setAttribute("ctProcessOwner", 1);
				    } else if(object.getRoleInfoForUsers().getRoleName().equalsIgnoreCase("CT Supervisor")) {
				    	session.setAttribute("ctSupervisor", 1);
				    } else if(object.getRoleInfoForUsers().getRoleName().equalsIgnoreCase("CT Admin")) {
				    	session.setAttribute("ctAdmin", 1);
				    } else if(object.getRoleInfoForUsers().getRoleName().equalsIgnoreCase("CT Coachee")) {
				    	session.setAttribute("ctCoachee", 1);
				    } else if(object.getRoleInfoForUsers().getRoleName().equalsIgnoreCase("CT Coach")) {
				    	session.setAttribute("ctCoach", 1);
				    } else if(object.getRoleInfoForUsers().getRoleName().equalsIgnoreCase("MR Initiator")) {
				    	session.setAttribute("mrInitiator", 1);
				    } else if(object.getRoleInfoForUsers().getRoleName().equalsIgnoreCase("MR Approver")) {
				    	session.setAttribute("mrApprover", 1);
				    }
				}
			}
			session.setAttribute("IJP", 0);
			session.setAttribute("EMC", 0);
			session.setAttribute("ALDP", 0);
			session.setAttribute("EIM", 0);
			session.setAttribute("IFC", 0);
			session.setAttribute("AEMS", 0);
			session.setAttribute("MR", 0);
			for(M_User_App_Map object : currentUser.getUserInfoForApp()) {
				if(object.getUserAppActive().compareTo(1) == 0) {
					if(object.getAppInfoForUsers().getAppName().equalsIgnoreCase("IJP")) {
				    	session.setAttribute("IJP", 1);
				    } else if(object.getAppInfoForUsers().getAppName().equalsIgnoreCase("EMC")) {
				    	session.setAttribute("EMC", 1);
				    } else if(object.getAppInfoForUsers().getAppName().equalsIgnoreCase("ALDP")) {
				    	session.setAttribute("ALDP", 1);
				    } else if(object.getAppInfoForUsers().getAppName().equalsIgnoreCase("EIM")) {
				    	session.setAttribute("EIM", 1);
				    } else if(object.getAppInfoForUsers().getAppName().equalsIgnoreCase("IFC")) {
				    	session.setAttribute("IFC", 1);
				    } else if(object.getAppInfoForUsers().getAppName().equalsIgnoreCase("AEMS")) {
				    	session.setAttribute("AEMS", 1);
				    } else if(object.getAppInfoForUsers().getAppName().equalsIgnoreCase("MR")) {
				    	session.setAttribute("MR", 1);
				    }
				}
			}
			session.setAttribute("sessionUserInfo", currentUser);
			System.out.println("------");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@GetMapping("/authenticate-sso")
	@ResponseBody
	public String graph(
	   @RegisteredOAuth2AuthorizedClient("authenticate-sso") OAuth2AuthorizedClient graphClient,
	   HttpServletRequest request
	) {
	   // toJsonString() is just a demo.
	   // oAuth2AuthorizedClient contains access_token. We can use this access_token to access the resource server.
		setUserValuesInSession(graphClient.getPrincipalName(), request);
		return "redirect:dashboard";
	}

	@GetMapping("/")
	public String slashOrIndex(HttpServletRequest request, Model model) throws Exception {
		System.out.println("**** /");
		System.out.println("****");
		return "login_page";
	}

	@GetMapping("login")
	public String anandGroupIndialogin(HttpServletRequest request, Model model, RedirectAttributes reAttr) throws Exception {
		System.out.println("**** login");
		if(request.getParameter("error") != null) {
			model.addAttribute("regMsg_login", "Invalid Credentials.");
			model.addAttribute("css_login", "danger");
		}
		if(request.getParameter("logout") != null && request.getParameter("logout").equalsIgnoreCase("sessionout")) {
			return "sessionTimeout";
		} else if(request.getParameter("logout") != null && !request.getParameter("logout").isEmpty()) {
			model.addAttribute("regMsg", "Logged out successfully.");
			model.addAttribute("css", "success");
		}
		if(request.getParameter("verifyEmail") != null) {
			System.out.println("Came here");
			StringBuilder response = new StringBuilder();
			response.append(""+mUserService.verifyEmail(request));
			System.out.println(response.toString());
			if(response.toString().equalsIgnoreCase("verified")) {
				mUserService.sendVerificationMail(request);
				reAttr.addFlashAttribute("regMsg", "Email Verification Successfully Completed.");
				reAttr.addFlashAttribute("css", "success");
			} else if(response.toString().equalsIgnoreCase("alreadyVerified")) {
				reAttr.addFlashAttribute("regMsg", "Email verificaiton already done.");
				reAttr.addFlashAttribute("css", "success");
			} else {
				reAttr.addFlashAttribute("regMsg", "Something went wrong, try again after sometime.");
				reAttr.addFlashAttribute("css", "danger");
			}
			return "redirect:/login";
		}
		System.out.println("****");
		return "login_page";
	}

	@GetMapping("main")
	public String main(HttpServletRequest request, Model model) throws Exception {
		try {
			System.out.println("**** main");
			System.out.println(SecurityContextHolder.getContext().getAuthentication().getName());
			System.out.println(SecurityContextHolder.getContext().getAuthentication().getAuthorities());
			System.out.println(SecurityContextHolder.getContext().getAuthentication().getDetails().toString());
			setUserValuesInSession(SecurityContextHolder.getContext().getAuthentication().getName(), request);
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:dashboard";
	}

	/**
	 * Basic Landing Tomcat Page
	 * @author Sheshadhri Iyer
	 */
	@GetMapping("dashboard")
	public String dashboard(HttpServletRequest request, Model model) throws Exception {
		try {
			System.out.println("**** dashboard");
			setUserValuesInSession(SecurityContextHolder.getContext().getAuthentication().getName(), request);
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "dashboard_v1";
	}

	@GetMapping("dashboard-ijp")
	public String dashboardIjp(HttpServletRequest request, Model model) throws Exception {
		try {
			System.out.println("**** dashboard");
			setUserValuesInSession(SecurityContextHolder.getContext().getAuthentication().getName(), request);
			model.addAttribute("openIjpList", jobPostingService.getJobsListOpenForEmployees(request));
			/*model.addAttribute("openIjpList", jobPostingService.getactiveJobsList(request, 0));*/
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "ijp/dashboard_ijp";
	}

	@GetMapping("dashboard-eim")
	public String dashboardEim(HttpServletRequest request, Model model) throws Exception {
		try {
			System.out.println("**** dashboard-eim");
			setUserValuesInSession(SecurityContextHolder.getContext().getAuthentication().getName(), request);
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "eim/dashboard";
	}

	@GetMapping("dashboard-ifc")
	public String dashboardIfc(HttpServletRequest request, Model model) throws Exception {
		try {
			System.out.println("**** dashboard-ifc");
			setUserValuesInSession(SecurityContextHolder.getContext().getAuthentication().getName(), request);
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "ifc/dashboard";
	}

	@GetMapping("dashboard-emc")
	public String dashboardEmc(HttpServletRequest request, Model model) throws Exception {
		try {
			System.out.println("**** dashboard-emc");
			setUserValuesInSession(SecurityContextHolder.getContext().getAuthentication().getName(), request);
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "emc/dashboard";
	}

	@Autowired private ACT_Coaching_Batch_Service actCoachingBatchService;
	@ModelAttribute("latestBatchDetails")
	public ACT_Coaching_Batch latestBatchDetails() { return actCoachingBatchService.getCurrentBatch(); }

	@GetMapping("dashboard-act")
	public String dashboardAct(HttpServletRequest request, Model model) throws Exception {
		try {
			System.out.println("**** dashboard-act");
			setUserValuesInSession(SecurityContextHolder.getContext().getAuthentication().getName(), request);
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "aldp/dashboard";
	}

	@GetMapping("dashboard-aems")
	public String dashboardAems(HttpServletRequest request, Model model) throws Exception {
		try {
			System.out.println("**** dashboard-aems");
			setUserValuesInSession(SecurityContextHolder.getContext().getAuthentication().getName(), request);
			model.addAttribute("activeCategoryList", mAemsCategoryService.getAemsCategoryByActiveStatus(1));
			model.addAttribute("activeSubCategoryList", mAemsSubCategoryService.getAemsSubCategoryByActiveStatus(1));
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "aems/dashboard";
	}

	@GetMapping("dashboard-mr")
	public String dashboardMr(HttpServletRequest request, Model model) throws Exception {
		try {
			System.out.println("**** dashboard-mr");
			setUserValuesInSession(SecurityContextHolder.getContext().getAuthentication().getName(), request);
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "mr/dashboard";
	}

	@GetMapping("logout")
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
		try {
			System.out.println("**** logout");
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			if (auth != null) {
				new SecurityContextLogoutHandler().logout(request, response, auth);
			}
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/login?logout";
	}

	@GetMapping("deny")
	public String deny(HttpServletRequest request, Model model) throws Exception {
		return "denyPage";
	}

	@GetMapping("session-timeout")
	public String session_timeout(HttpServletRequest request, Model model) throws Exception {
		return "sessionTimeout";
	}

	@GetMapping("signup")
	public String signup(HttpServletRequest request, Model model, @ModelAttribute("user") M_User user) throws Exception {
		model.addAttribute("activeDesignationList", mDesignationService.getDesignationByActiveStatus(1));
		model.addAttribute("activeDepartmentList", mDepartmentService.getDepartmentByActiveStatus(1));
		return "signup";
	}

	@PostMapping("signup")
	public String signupPost(HttpServletRequest request, Model model, @ModelAttribute("user") M_User user, RedirectAttributes reAttr) {
		StringBuilder response = new StringBuilder();
		try {
			response.append(mUserService.saveUserDetails(request, user));
			if(response.toString().equalsIgnoreCase("add")) {
				mUserService.sendRegistrationMail(request, user);
				reAttr.addFlashAttribute("regMsg", "Your registration is completed successfully.<br>Complete the registration using the link sent you for email verification.");
				reAttr.addFlashAttribute("css", "success");
			} else if(response.toString().equalsIgnoreCase("edit")) {
				
			} else {
				reAttr.addFlashAttribute("regMsg", "Something went wrong, try again after sometime.");
				reAttr.addFlashAttribute("css", "danger");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/login";
	}

	@GetMapping("signup-verification")
	public String signupVerification(HttpServletRequest request, Model model, RedirectAttributes reAttr) {
		try {
			String response = mUserService.verifyEmail(request);
			if(response.contains("alreadyverified")) {
				reAttr.addFlashAttribute("regMsg", "Your account was alredy verified.");
				reAttr.addFlashAttribute("css", "success");
			} else if(response.contains("verified")) {
				reAttr.addFlashAttribute("regMsg", "Email Verification is successfully completed.");
				reAttr.addFlashAttribute("css", "success");
			} else {
				reAttr.addFlashAttribute("regMsg", "Something went wrong while verifying the user, try again aftersometime.");
				reAttr.addFlashAttribute("css", "danger");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/login";
	}

	@GetMapping("forgot-password")
	public String forgot_password(HttpServletRequest request, Model model) {
		return "forgot-password";
	}
}