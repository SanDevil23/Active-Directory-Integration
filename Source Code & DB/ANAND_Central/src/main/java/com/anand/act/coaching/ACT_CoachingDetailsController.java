package com.anand.act.coaching;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.anand.act.batch.ACT_Coach_Coachee_Map;
import com.anand.act.batch.ACT_Coaching_Batch;
import com.anand.act.batch.ACT_Coaching_Batch_Service;
import com.anand.masters.M_User;
import com.anand.masters.M_User_Service;

@Controller
public class ACT_CoachingDetailsController {

	@Autowired private M_User_Service mUserService;
	@Autowired private ACT_Coaching_Batch_Service actCoachingBatchService;
	@Autowired private ACT_Coachee_Goals_Service actCoacheeGoalsService;
	@Autowired private ACT_Coachee_Report_Service actCoacheeReportService;

	@ModelAttribute("latestBatchDetails")
	public ACT_Coaching_Batch latestBatchDetails() { return actCoachingBatchService.getCurrentBatch(); }

	@ModelAttribute("coachList")
	public List<M_User> coachList() { return mUserService.getActiveUserByRole(1, "CT Coach"); }

	@ModelAttribute("coacheeList")
	public List<M_User> coacheeList() { return mUserService.getActiveUserByRole(1, "CT Coachee"); }

	@ModelAttribute("supervisorList")
	public List<M_User> supervisorList() { return mUserService.getActiveUserByRole(1, "CT Supervisor"); }

	@GetMapping("coaching-batch-details")
	public String coachingBatch(HttpServletRequest request, Model model) {
		try {
			System.out.println("**** coaching-batch-details");
			model.addAttribute("batchList", actCoachingBatchService.getBatchList(request, 0));
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "aldp/coachingBatchDetails/coaching-batch-details";
	}

	@GetMapping("coachee-list")
	public String coacheeList(HttpServletRequest request, Model model) {
		try {
			System.out.println("**** coachee-list");
			model.addAttribute("batchList", actCoachingBatchService.getBatchList(request, 0));
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "aldp/coachingBatchDetails/coachee-list";
	}

	@GetMapping("coaching-goals")
	public String coachingGoals(HttpServletRequest request, Model model, @ModelAttribute("actCoacheeGoals") ACT_Coachee_Goals actCoacheeGoals,
			RedirectAttributes reAttr) {
		try {
			System.out.println("**** coaching-goals");
			model.addAttribute("coachCoacheeMapDetails", actCoachingBatchService.getCoachCoacheeMapInformation(request));
			StringBuilder response = new StringBuilder();
			model.addAttribute("coachCoacheeMapInfo", actCoachingBatchService.getCoachCoacheeMapInformation(request));
			response.append(actCoacheeGoalsService.checkCoacheeIsAddedInLatestAldp(request));
			if(response.toString().contains("yes")) {
				model.addAttribute("coacheeGoalsList", actCoacheeGoalsService.getCoacheeGoalsList(request));
				model.addAttribute("coacheeIdForPage", request.getParameter("coachee-id"));
			} else if(response.toString().contains("no")) {
				reAttr.addFlashAttribute("css", "danger");
				reAttr.addFlashAttribute("regMsg", "Sorry you are not in latest ALDP Batch, we re-directed you to Batch List.");
				return "redirect:/coaching-batch";
			} else {
				reAttr.addFlashAttribute("css", "danger");
				reAttr.addFlashAttribute("regMsg", "Sorry something went wrong, try again later");
				return "redirect:/dashboard-act";
			}
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "aldp/coachingBatchDetails/coaching-goals";
	}

	@PostMapping("coaching-goals")
	public String coachingGoalsPost(@ModelAttribute("actCoacheeGoals") ACT_Coachee_Goals actCoacheeGoals, HttpServletRequest request, 
			Model model, RedirectAttributes reAttr) throws Exception {
		try {
			System.out.println("**** coaching-goals post");
			StringBuilder response = new StringBuilder();
			response.append(actCoacheeGoalsService.saveCoacheeGoalsDetails(request, actCoacheeGoals));
			reAttr.addFlashAttribute("css", "success");
			if(response.toString().contains("add")) {
				reAttr.addFlashAttribute("regMsg", "Coaching Goal information added successfully.");
			} else if(response.toString().contains("edit")) {
				reAttr.addFlashAttribute("regMsg", "Coaching Goal information edited successfully.");
			} else if(response.toString().contains("nameExists")) {
				model.addAttribute("batchList", actCoachingBatchService.getBatchList(request, 0));
				model.addAttribute("actCoachingBatch", actCoacheeGoals);
				if(actCoacheeGoals.getActCoacheeGoalsId() != null) {
					model.addAttribute("css", "danger");
					model.addAttribute("regMsg", "Coaching Goal Name alread exists, provide different name and save again.");
				} else {
					model.addAttribute("css", "danger");
					model.addAttribute("regMsg", "Coaching Goal Name alread exists, provide different name and save again.");
				}
				return "aldp/coachingBatchDetails/coaching-goals";
			}
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
			reAttr.addFlashAttribute("css", "danger");
			reAttr.addFlashAttribute("regMsg", "Something went wrong, try again after sometime.");
		}
		return "redirect:/coaching-goals?batch-id="+request.getParameter("batch-id")+"&coachee-id="+request.getParameter("coacheeIdForPage");
	}

	@GetMapping("coaching-report")
	public String coachingReport(HttpServletRequest request, Model model, @ModelAttribute("actCoachCoacheeMap") ACT_Coach_Coachee_Map actCoachCoacheeMap,
			RedirectAttributes reAttr) {
		try {
			System.out.println("**** coaching-batch-details");
			model.addAttribute("coachCoacheeMapDetails", actCoachingBatchService.getCoachCoacheeMapInformation(request));
			StringBuilder response = new StringBuilder();
			response.append(actCoacheeGoalsService.checkCoacheeIsAddedInLatestAldp(request));
			if(response.toString().contains("yes")) {
				model.addAttribute("coacheeGoalsList", actCoacheeGoalsService.getCoacheeGoalsList(request));
				model.addAttribute("coacheeReportList", actCoacheeReportService.getCoacheeReportList(request));
				model.addAttribute("coacheeGoalActionList", actCoacheeReportService.getCoacheeGoalActionList(request));
				model.addAttribute("coacheeIdForPage", request.getParameter("coachee-id"));
			} else if(response.toString().contains("no")) {
				reAttr.addFlashAttribute("css", "danger");
				reAttr.addFlashAttribute("regMsg", "Sorry you are not in latest ALDP Batch, we re-directed you to Batch List.");
				return "redirect:/coaching-batch";
			} else {
				reAttr.addFlashAttribute("css", "danger");
				reAttr.addFlashAttribute("regMsg", "Sorry something went wrong, try again later");
				return "redirect:/dashboard-act";
			}
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "aldp/coachingBatchDetails/coaching-report";
	}

	@PostMapping("coaching-report")
	public String coachingReportPost(HttpServletRequest request, Model model, @ModelAttribute("actCoachCoacheeMap") ACT_Coach_Coachee_Map actCoachCoacheeMap,
			RedirectAttributes reAttr) throws Exception {
		try {
			System.out.println("**** coaching-report post");
			StringBuilder response = new StringBuilder();
			response.append(actCoacheeReportService.saveCoacheeReportDetails(request, actCoachCoacheeMap));
			System.out.println(response.toString()+" - response");
			reAttr.addFlashAttribute("css", "success");
			if(response.toString().contains("add")) {
				reAttr.addFlashAttribute("regMsg", "Coaching Report information added successfully.");
			} else if(response.toString().contains("edit")) {
				reAttr.addFlashAttribute("regMsg", "Coaching Report information updated successfully.");
			} else if(response.toString().contains("dateExists")) {
				reAttr.addFlashAttribute("regMsg", "Session Date Already Existed, Coaching Report information updated successfully.");
			}
			System.out.println(response.toString()+" - response 1");
		} catch(Exception e) {
			e.printStackTrace();
			reAttr.addFlashAttribute("css", "danger");
			reAttr.addFlashAttribute("regMsg", "Something went wrong, try again after sometime.");
		}
		System.out.println(" - response 2");
		return "redirect:/coaching-report?batch-id="+request.getParameter("batch-id")+"&coachee-id="+request.getParameter("coacheeIdForPage");
	}

	@PostMapping("coaching-report-coach")
	public String coachingReportCoachPost(HttpServletRequest request, Model model, @ModelAttribute("actCoachCoacheeMap") ACT_Coach_Coachee_Map actCoachCoacheeMap,
			RedirectAttributes reAttr) throws Exception {
		try {
			System.out.println("**** coaching-report-coach post");
			StringBuilder response = new StringBuilder();
			response.append(actCoacheeReportService.saveCoacheeReportCoachDetails(request, actCoachCoacheeMap));
			System.out.println(response.toString()+" - response");
			reAttr.addFlashAttribute("css", "success");
			if(response.toString().contains("done")) {
				reAttr.addFlashAttribute("regMsg", "Coaching Report information updated successfully.");
			}
		} catch(Exception e) {
			e.printStackTrace();
			reAttr.addFlashAttribute("css", "danger");
			reAttr.addFlashAttribute("regMsg", "Something went wrong, try again after sometime.");
		}
		return "redirect:/coaching-report?batch-id="+request.getParameter("batch-id")+"&coachee-id="+request.getParameter("coacheeIdForPage");
	}
}
