package com.anand.act.batch;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.anand.masters.M_User;
import com.anand.masters.M_User_Service;

@Controller
public class ACT_CoachingBatchController {

	@Autowired private M_User_Service mUserService;
	@Autowired private ACT_Coaching_Batch_Service actCoachingBatchService;

	@ModelAttribute("latestBatchDetails")
	public ACT_Coaching_Batch latestBatchDetails() { return actCoachingBatchService.getCurrentBatch(); }

	@ModelAttribute("coachList")
	public List<M_User> coachList() { return mUserService.getActiveUserByRole(1, "CT Coach"); }

	@ModelAttribute("coacheeList")
	public List<M_User> coacheeList() { return mUserService.getActiveUserByRole(1, "CT Coachee"); }

	@ModelAttribute("supervisorList")
	public List<M_User> supervisorList() { return mUserService.getActiveUserByRole(1, "CT Supervisor"); }

	@GetMapping("coaching-batch")
	public String coachingBatch(HttpServletRequest request, Model model, @ModelAttribute("actCoachingBatch") ACT_Coaching_Batch actCoachingBatch) throws Exception {
		try {
			System.out.println("**** coaching-batch");
			model.addAttribute("batchList", actCoachingBatchService.getBatchList(request, 0));
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "aldp/coachingBatch/coaching-batch";
	}

	@PostMapping("coaching-batch")
	public String coachingBatchPost(@ModelAttribute("actCoachingBatch") ACT_Coaching_Batch actCoachingBatch, HttpServletRequest request, 
			Model model, RedirectAttributes reAttr) throws Exception {
		try {
			System.out.println("**** batch post");
			StringBuilder response = new StringBuilder();
			response.append(actCoachingBatchService.saveBatchDetails(request, actCoachingBatch));
			reAttr.addFlashAttribute("css", "success");
			if(response.toString().contains("add")) {
				reAttr.addFlashAttribute("regMsg", "Coaching Batch information added successfully.");
			} else if(response.toString().contains("edit")) {
				reAttr.addFlashAttribute("regMsg", "Coaching Batch information edited successfully.");
			} else if(response.toString().contains("nameExists")) {
				model.addAttribute("batchList", actCoachingBatchService.getBatchList(request, 0));
				model.addAttribute("actCoachingBatch", actCoachingBatch);
				if(actCoachingBatch.getActCoachingBatchId() != null) {
					model.addAttribute("cssEdit", "danger");
					model.addAttribute("regMsgEdit", "Coaching Batch Name alread exists, provide different name and save again.");
					model.addAttribute("openEditModel", "openEditModel");
				} else {
					model.addAttribute("css", "danger");
					model.addAttribute("regMsg", "Coaching Batch Name alread exists, provide different name and save again.");
					model.addAttribute("openAddModal", "openAddModal");
				}
				return "aldp/coachingBatch/coaching-batch";
			}
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
			reAttr.addFlashAttribute("css", "danger");
			reAttr.addFlashAttribute("regMsg", "Something went wrong, try again after sometime.");
		}
		return "redirect:/coaching-batch";
	}

	@GetMapping("coache-coachee")
	public String coachCoachee(HttpServletRequest request, Model model, @ModelAttribute("actCoachingBatch") ACT_Coaching_Batch actCoachingBatch) throws Exception {
		try {
			System.out.println("**** coache-coachee");
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "aldp/coachingBatch/coache-coachee";
	}
}
