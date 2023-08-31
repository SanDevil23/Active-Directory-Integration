package com.anand.eim.charter;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.anand.common.EncryptionDecryptionFunction;
import com.anand.masters.M_User;
import com.anand.masters.M_User_Dao;

@Service
public class T_Project_Closure_Approval_Service_Impl implements T_Project_Closure_Approval_Service {

	@Autowired private T_Project_Closure_Approval_Dao projectClosureApprovalDao;
/*	@Autowired private T_Project_Charter_Request_Terminate_Approval_Dao projectCharterRequestTerminateApprovalDao;
*/	@Autowired private T_Project_Charter_Dao projectCharterDao;
	@Autowired private M_User_Dao userMasterDao;

	@Override
	public List<T_Project_Closure_Approval> getClosureApprovalList(HttpServletRequest request) {
		List<T_Project_Closure_Approval> pendingApprovalList = new ArrayList<T_Project_Closure_Approval>();
		try {
			M_User user = userMasterDao.findByUserLoginId(SecurityContextHolder.getContext().getAuthentication().getName());
			for(T_Project_Closure_Approval closureApproval : projectClosureApprovalDao.getApprovalList(user.getmUserId(), 0, 1, 0)) {
				T_Project_Charter charter = closureApproval.getProjectClosureApproval();
				charter.setProjectName(EncryptionDecryptionFunction.getDecryptedData(charter.getProjectName()));
				if(charter.getProjectDescription() != null) {
					charter.setProjectDescription(EncryptionDecryptionFunction.getDecryptedData(charter.getProjectDescription()));
				}
				closureApproval.setProjectClosureApproval(charter);
				charter = null;
				pendingApprovalList.add(closureApproval);
				System.out.println("Hi");
			}
		} catch(Exception e) {
			e.printStackTrace();
			pendingApprovalList.clear();
			pendingApprovalList = null;
		}
		for (int i = 0; i < pendingApprovalList.size();i++) 
	      { 		      
	          System.out.println(pendingApprovalList.get(i)); 		
	      }
		return pendingApprovalList;
	}

	@Override
	@Transactional
	public String saveProjectClosureApproval(T_Project_Closure_Approval closureApproval, HttpServletRequest request) {
		StringBuilder response = new StringBuilder();
		Date currDate = new Date();
		T_Project_Closure_Approval projectClosureApproval = projectClosureApprovalDao.findById(closureApproval.gettProjectClosureApprovalId()).get();
		projectClosureApproval.setApprovalStatus(closureApproval.getApprovalStatus());
		projectClosureApproval.setApprovalDate(currDate);
		projectClosureApproval.setApprovalComments(closureApproval.getApprovalComments());
		projectClosureApproval.setFirstCriteria(closureApproval.getFirstCriteria());
		projectClosureApproval.setSecondCriteria(closureApproval.getSecondCriteria());
		projectClosureApproval.setThirdCriteria(closureApproval.getThirdCriteria());
		projectClosureApproval.setFourthCriteria(closureApproval.getFourthCriteria());
		projectClosureApproval.setFifthCriteria(closureApproval.getFifthCriteria());
		projectClosureApproval.setSurveyComments(closureApproval.getSurveyComments());
		projectClosureApproval.setTotalScore(closureApproval.getTotalScore());	
		
		System.out.print(closureApproval.getTotalScore());
		projectClosureApprovalDao.save(projectClosureApproval);
		if(closureApproval.getApprovalStatus().compareTo(1) == 0) {
			Integer addFlag = 0;
			T_Project_Closure_Approval nextApprover = new T_Project_Closure_Approval();
			nextApprover.setProjectClosureApproval(projectClosureApproval.getProjectClosureApproval());
			nextApprover.setApprovalStatus(0);
			
			if(projectClosureApproval.getApproverType().compareTo(1) == 0) {
				nextApprover.setApproverId(projectClosureApproval.getProjectClosureApproval().getProcessOwner());
				nextApprover.setApproverType(2);
			} else if(projectClosureApproval.getApproverType().compareTo(2) == 0) {
				nextApprover.setApproverId(projectClosureApproval.getProjectClosureApproval().getProblemSolvingLeader());
				nextApprover.setApproverType(3);
			} else if(projectClosureApproval.getApproverType().compareTo(3) == 0) {
				nextApprover.setApproverId(projectClosureApproval.getProjectClosureApproval().getFinanceController());
				nextApprover.setApproverType(4);
			} else if(projectClosureApproval.getApproverType().compareTo(4) == 0) {
				nextApprover.setApproverId(projectClosureApproval.getProjectClosureApproval().getBusinessHead());
				nextApprover.setApproverType(5);
			} else if(projectClosureApproval.getApproverType().compareTo(5) == 0) {
				nextApprover.setApproverType(6);
				nextApprover.setApproverId(projectClosureApproval.getProjectClosureApproval().getCorporateProblemSolvingLeader());
			} else {
				addFlag = 1;
			}
			if(addFlag.compareTo(0) == 0) {
				
				nextApprover.setActive(1);
				nextApprover.setApprovalSubmissionDate(currDate);
				projectClosureApprovalDao.save(nextApprover);
			}
			nextApprover = null;
			
			if(projectClosureApproval.getApproverType().compareTo(6) == 0) {
				T_Project_Charter projectCharter = projectCharterDao.findById(projectClosureApproval.getProjectClosureApproval().gettProjectCharterId()).get();
				projectCharter.setProjectCharterStatus(9); //Set Charter Status from CHARTER SUBMITTED -> CHARTER APPROVED
				projectCharterDao.save(projectCharter);
				projectCharter = null;
			}
			response.append("next");
			projectClosureApproval = null;
		} else if (closureApproval.getApprovalStatus().compareTo(2) == 0) {
			T_Project_Charter projectClosure = projectCharterDao.findById(projectClosureApproval.getProjectClosureApproval().gettProjectCharterId()).get();
			projectClosure.setProjectCharterStatus(10); //Set Charter Status from CHARTER SUBMITTED -> CHARTER REJECTED 
			projectCharterDao.save(projectClosure);
			response.append("rejected");
			projectClosure = null;
		} else if (closureApproval.getApprovalStatus().compareTo(3) == 0) {
			/*T_Project_Charter_Request_Terminate_Approval requestTerminateApprovalSubmission = new T_Project_Charter_Request_Terminate_Approval();
			requestTerminateApprovalSubmission.setProjectCharterApproval(projectClosureApproval.getProjectClosureApproval());
			requestTerminateApprovalSubmission.setApprovalStatus(0);
			requestTerminateApprovalSubmission.setApproverType(1);
			requestTerminateApprovalSubmission.setApproverId(projectClosureApproval.getProjectClosureApproval().getSponsor());
			requestTerminateApprovalSubmission.setActive(1);
			projectCharterRequestTerminateApprovalDao.save(requestTerminateApprovalSubmission);
			requestTerminateApprovalSubmission = null;
			response.append("terminate");*/
		}
		projectClosureApproval = null;
		response.append("done");
		return response.toString();
	}
}