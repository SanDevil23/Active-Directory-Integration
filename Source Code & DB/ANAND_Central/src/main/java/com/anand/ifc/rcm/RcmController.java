package com.anand.ifc.rcm;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.anand.ifc.masters.M_Process;
import com.anand.ifc.masters.M_Process_Service;
import com.anand.masters.M_Department;
import com.anand.masters.M_Department_Service;
import com.anand.masters.M_Entity;
import com.anand.masters.M_Entity_Service;
import com.anand.masters.M_User_Service;

@Controller
public class RcmController {

	@Autowired private M_Entity_Service mEntityService;
	@Autowired private M_Process_Service mProcessService;
	@Autowired private M_Department_Service mDepartmentService;
	@Autowired private M_Rcm_Service mRcmService;
	@Autowired private M_User_Service mUserService;

	@ModelAttribute("activeParentEntityList")
	public List<M_Entity> activeParentEntityList() { return mEntityService.getActiveParentEntityByStatus(1); }

	@ModelAttribute("activeChildEntityList")
	public List<M_Entity> activeChildEntityList() { return mEntityService.getActiveChildEntityByStatus(1); }

	@ModelAttribute("activeProcessList")
	public List<M_Process> activeProcessList() { return mProcessService.getProcessByActiveStatus(1); }

	@ModelAttribute("activeDepartmentList")
	public List<M_Department> activeDepartmentList() { return mDepartmentService.getDepartmentByActiveStatus(1); }
	

	@GetMapping("rcm-master")
	public String rcmMaster(HttpServletRequest request, Model model, @ModelAttribute("rcm") M_Rcm rcm) throws Exception{
		try {
			System.out.println("**** rcm");
			model.addAttribute("rcmList", mRcmService.getRcmList(request, 0));
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "ifc/rcm/rcm_master";
	}
	
	@PostMapping("rcm-master")
	public String rcmMasterPost(HttpServletRequest request,Model model, @ModelAttribute("rcm") M_Rcm rcm,RedirectAttributes reAttr)
	{
		try {
			System.out.println("**** rcm-master post");
			StringBuilder response = new StringBuilder();
			response.append(mRcmService.saveDepartmentDetails(request, rcm));
			reAttr.addFlashAttribute("css", "success");
			if(response.toString().contains("add")) {
				reAttr.addFlashAttribute("regMsg", "RCM information added successfully.");
			} if(response.toString().contains("edit")) {
				reAttr.addFlashAttribute("regMsg", "RCM information edited successfully.");
			}
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
			reAttr.addFlashAttribute("css", "danger");
			reAttr.addFlashAttribute("regMsg", "Something went wrong, try again after sometime.");
		}
		return "redirect:/rcm-master";
	}
	
	@GetMapping("rcm-tracker")
	public String rcmTracker(HttpServletRequest request, Model model, @ModelAttribute("transaction") M_Transaction transaction,
			@ModelAttribute("tracker") M_Tracker tracker) {
		try {
			System.out.println("**** rcm-tracker");
			List<M_Transaction> rcmTransactionList = mRcmService.getRcmTxnList(request, 0);
			Integer year = 0;
			SimpleDateFormat df = new SimpleDateFormat("dd-MMM-yyyy");
			System.out.println(rcmTransactionList.size());
			year = Integer.parseInt(""+df.format(rcmTransactionList.get(0).getCreatedOn()).split("-")[2]);
			//Long processId=rcmTransactionList.get(0).getControlReference().getmProcessId().getmProcessId();
			model.addAttribute("tempYearId", year);
			model.addAttribute("tempProcessId", -1);
			model.addAttribute("tempFrequency", -1);
			model.addAttribute("tempPlantId", -1);
			model.addAttribute("tempResponsiblePersonId", -1);
			model.addAttribute("tempLineManagerId", -1);
			model.addAttribute("tempPraacId", -1);
			model.addAttribute("tempParentId", -1);
			model.addAttribute("responsiblePersonList", mUserService.getActiveUserByRoleInList(1, "IFC SOH Person", request));
			model.addAttribute("lineManagerList", mUserService.getLineManagerList(request));
			model.addAttribute("praacList", mUserService.getPraacList(request));
			model.addAttribute("txnList", rcmTransactionList);
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "ifc/rcm/rcm_tracker";
	}
	
	@PostMapping("rcm-tracker")
	public String rcmTrackerPost(HttpServletRequest request,Model model, @ModelAttribute("transaction") M_Transaction transaction,RedirectAttributes reAttr)
	{
		try {
			System.out.println("**** rcm-tracker post");
			StringBuilder response = new StringBuilder();
			response.append(mRcmService.saveTransactionDetails(request, transaction));
			if(response.toString().contains("add")) {
				reAttr.addFlashAttribute("css", "success");
				reAttr.addFlashAttribute("regMsg", "Compliance Information Submitted Successfully.");
			} else {
				reAttr.addFlashAttribute("css", "danger");
				reAttr.addFlashAttribute("regMsg", "Something went wrong, try again after sometime.");
			}
			response.setLength(0); response = null;
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
			reAttr.addFlashAttribute("css", "danger");
			reAttr.addFlashAttribute("regMsg", "Something went wrong, try again after sometime.");
		}
		return "redirect:/rcm-tracker";
	}
	@PostMapping("rcm-tracker1")
	public String rcmTrackerPost1(HttpServletRequest request,Model model, @ModelAttribute("tracker") M_Tracker tracker,RedirectAttributes reAttr)
	{
		try {
			System.out.println("**** rcm-tracker post 1");
			StringBuilder response = new StringBuilder();
			response.append(mRcmService.saveTrackerDetails(request, tracker));
			reAttr.addFlashAttribute("css", "success");
			if(response.toString().contains("add")) {
				reAttr.addFlashAttribute("regMsg", "RCM information added successfully.");
			} if(response.toString().contains("edit")) {
				reAttr.addFlashAttribute("regMsg", "RCM information edited successfully.");
			}
			System.out.println("****");
		} catch(Exception e) {
			e.printStackTrace();
			reAttr.addFlashAttribute("css", "danger");
			reAttr.addFlashAttribute("regMsg", "Something went wrong, try again after sometime.");
		}
		return "redirect:/rcm-tracker";
	}

	@PostMapping("postTrackerValue")
	public String postTrackerValue(HttpServletRequest request, Model model, @ModelAttribute("transaction") M_Transaction transaction,
			@ModelAttribute("tracker") M_Tracker tracker, RedirectAttributes reAttr)
	{
		try {
			Integer emptySelectFlag = -1;
			if(request.getParameter("yearId") !=  null && emptySelectFlag.compareTo(Integer.parseInt(""+request.getParameter("yearId"))) == 0) {
				emptySelectFlag = null;
				return "redirect:/rcm-tracker";
			}
			List<M_Transaction> rcmTransactionList = mRcmService.getRcmTxnList(request, 0);
			/*Integer year = rcmTransactionList.get(0).getCreatedOn();*/
			
			model.addAttribute("tempYearId", request.getParameter("yearId"));
			model.addAttribute("tempProcessId", request.getParameter("processId"));
			model.addAttribute("tempFrequency", request.getParameter("frequency"));
			model.addAttribute("tempPlantId", request.getParameter("plantId"));
			model.addAttribute("tempResponsiblePersonId", request.getParameter("responsiblePersonId"));
			model.addAttribute("tempLineManagerId", request.getParameter("lineManagerId"));
			model.addAttribute("tempPraacId", request.getParameter("praacId"));
			model.addAttribute("tempParentId", request.getParameter("parentEntityId"));
			model.addAttribute("responsiblePersonList", mUserService.getActiveUserByRoleInList(1, "IFC SOH Person", request));
			model.addAttribute("lineManagerList", mUserService.getLineManagerList(request));
			model.addAttribute("praacList", mUserService.getPraacList(request));
			model.addAttribute("txnList", rcmTransactionList);
			System.out.println("**** Tracker Values Post");
			emptySelectFlag = null;
		} catch(Exception e) {
			e.printStackTrace();
			reAttr.addFlashAttribute("css", "danger");
			reAttr.addFlashAttribute("regMsg", "Something went wrong, try again after sometime.");
		}
		return "ifc/rcm/rcm_tracker";
		
	}
	
}