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
public class T_Project_Charter_Approval_Service_Impl implements T_Project_Charter_Approval_Service {

	@Autowired private T_Project_Charter_Approval_Dao projectCharterApprovalDao;
	@Autowired private T_Project_Charter_Request_Terminate_Approval_Dao projectCharterRequestTerminateApprovalDao;
	@Autowired private T_Project_Charter_Dao projectCharterDao;
	@Autowired private M_User_Dao userMasterDao;

	@Override
	public List<T_Project_Charter_Approval> getCharterApprovalList(HttpServletRequest request) {
		List<T_Project_Charter_Approval> pendingApprovalList = new ArrayList<T_Project_Charter_Approval>();
		try {
			M_User user = userMasterDao.findByUserLoginId(SecurityContextHolder.getContext().getAuthentication().getName());
			for(T_Project_Charter_Approval charterApproval : projectCharterApprovalDao.getApprovalList(user.getmUserId(), 0, 1, 0)) {
				T_Project_Charter charter = charterApproval.getProjectCharterApproval();
				charter.setProjectName(EncryptionDecryptionFunction.getDecryptedData(charter.getProjectName()));
				if(charter.getProjectDescription() != null) {
					charter.setProjectDescription(EncryptionDecryptionFunction.getDecryptedData(charter.getProjectDescription()));
				}
				charterApproval.setProjectCharterApproval(charter);
				charter = null;
				pendingApprovalList.add(charterApproval);
			}
		} catch(Exception e) {
			e.printStackTrace();
			pendingApprovalList.clear();
			pendingApprovalList = null;
		}
		return pendingApprovalList;
	}

	@Override
	@Transactional
	public String saveProjectCharterApproval(T_Project_Charter_Approval charterApproval, HttpServletRequest request) {
		StringBuilder response = new StringBuilder();
		Date currDate = new Date();
		T_Project_Charter_Approval projectCharterApproval = projectCharterApprovalDao.findById(charterApproval.gettProjectCharterApprovalId()).get();
		projectCharterApproval.setApprovalStatus(charterApproval.getApprovalStatus());
		projectCharterApproval.setApprovalDate(currDate);
		projectCharterApproval.setApprovalComments(charterApproval.getApprovalComments());
		projectCharterApprovalDao.save(projectCharterApproval);
		if(charterApproval.getApprovalStatus().compareTo(1) == 0) {
			Integer addFlag = 0;
			T_Project_Charter_Approval nextApprover = new T_Project_Charter_Approval();
			nextApprover.setProjectCharterApproval(projectCharterApproval.getProjectCharterApproval());
			nextApprover.setApprovalStatus(0);
			if(projectCharterApproval.getApproverType().compareTo(1) == 0) {
				nextApprover.setApproverId(projectCharterApproval.getProjectCharterApproval().getProcessOwner());
				nextApprover.setApproverType(2);
			} else if(projectCharterApproval.getApproverType().compareTo(2) == 0) {
				nextApprover.setApproverId(projectCharterApproval.getProjectCharterApproval().getProblemSolvingLeader());
				nextApprover.setApproverType(3);
			} else if(projectCharterApproval.getApproverType().compareTo(3) == 0) {
				nextApprover.setApproverId(projectCharterApproval.getProjectCharterApproval().getFinanceController());
				nextApprover.setApproverType(4);
			} else if(projectCharterApproval.getApproverType().compareTo(4) == 0) {
				nextApprover.setApproverId(projectCharterApproval.getProjectCharterApproval().getBusinessHead());
				nextApprover.setApproverType(5);
			} else if(projectCharterApproval.getApproverType().compareTo(5) == 0) {
				nextApprover.setApproverType(6);
				nextApprover.setApproverId(projectCharterApproval.getProjectCharterApproval().getCorporateProblemSolvingLeader());
			} else {
				addFlag = 1;
			}
			if(addFlag.compareTo(0) == 0) {
				nextApprover.setActive(1);
				nextApprover.setApprovalSubmissionDate(currDate);
				projectCharterApprovalDao.save(nextApprover);
			}
			nextApprover = null;
			
			if(projectCharterApproval.getApproverType().compareTo(6) == 0) {
				T_Project_Charter projectCharter = projectCharterDao.findById(projectCharterApproval.getProjectCharterApproval().gettProjectCharterId()).get();
				projectCharter.setProjectCharterStatus(2); //Set Charter Status from CHARTER SUBMITTED -> CHARTER APPROVED
				projectCharterDao.save(projectCharter);
				projectCharter = null;
			}
			response.append("next");
			projectCharterApproval = null;
		} else if (charterApproval.getApprovalStatus().compareTo(2) == 0) {
			T_Project_Charter projectCharter = projectCharterDao.findById(projectCharterApproval.getProjectCharterApproval().gettProjectCharterId()).get();
			projectCharter.setProjectCharterStatus(3); //Set Charter Status from CHARTER SUBMITTED -> CHARTER REJECTED 
			projectCharterDao.save(projectCharter);
			response.append("rejected");
			projectCharter = null;
		} else if (charterApproval.getApprovalStatus().compareTo(3) == 0) {
			T_Project_Charter_Request_Terminate_Approval requestTerminateApprovalSubmission = new T_Project_Charter_Request_Terminate_Approval();
			requestTerminateApprovalSubmission.setProjectCharterApproval(projectCharterApproval.getProjectCharterApproval());
			requestTerminateApprovalSubmission.setApprovalStatus(0);
			requestTerminateApprovalSubmission.setApproverType(1);
			requestTerminateApprovalSubmission.setApproverId(projectCharterApproval.getProjectCharterApproval().getSponsor());
			requestTerminateApprovalSubmission.setActive(1);
			projectCharterRequestTerminateApprovalDao.save(requestTerminateApprovalSubmission);
			requestTerminateApprovalSubmission = null;
			response.append("terminate");
		}
		projectCharterApproval = null;
		response.append("done");
		return response.toString();
	}
}