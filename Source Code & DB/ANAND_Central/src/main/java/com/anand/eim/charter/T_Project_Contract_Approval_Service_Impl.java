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
public class T_Project_Contract_Approval_Service_Impl implements T_Project_Contract_Approval_Service {

	@Autowired private T_Project_Contract_Approval_Dao projectContractApprovalDao;
	@Autowired private T_Project_Charter_Request_Terminate_Approval_Dao projectCharterRequestTerminateApprovalDao;
	@Autowired private T_Project_Charter_Dao projectCharterDao;
	@Autowired private M_User_Dao userMasterDao;

	@Override
	public List<T_Project_Contract_Approval> getContractApprovalList(HttpServletRequest request) {
		List<T_Project_Contract_Approval> pendingApprovalList = new ArrayList<T_Project_Contract_Approval>();
		try {
			M_User user = userMasterDao.findByUserLoginId(SecurityContextHolder.getContext().getAuthentication().getName());
			for(T_Project_Contract_Approval contractApproval : projectContractApprovalDao.getApprovalList(user.getmUserId(), 0, 1, 0)) {
				T_Project_Charter charter = contractApproval.getProjectContractApproval();
				charter.setProjectName(EncryptionDecryptionFunction.getDecryptedData(charter.getProjectName()));
				if(charter.getProjectDescription() != null) {
					charter.setProjectDescription(EncryptionDecryptionFunction.getDecryptedData(charter.getProjectDescription()));
				}
				contractApproval.setProjectContractApproval(charter);
				charter = null;
				pendingApprovalList.add(contractApproval);
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
	public String saveProjectContractApproval(T_Project_Contract_Approval contractApproval, HttpServletRequest request) {
		StringBuilder response = new StringBuilder();
		Date currDate = new Date();
		T_Project_Contract_Approval projectContractApproval = projectContractApprovalDao.findById(contractApproval.gettProjectContractApprovalId()).get();
		projectContractApproval.setApprovalStatus(contractApproval.getApprovalStatus());
		projectContractApproval.setApprovalDate(currDate);
		projectContractApproval.setApprovalComments(contractApproval.getApprovalComments());
		projectContractApprovalDao.save(projectContractApproval);
		if(contractApproval.getApprovalStatus().compareTo(1) == 0) {
			Integer addFlag = 0;
			T_Project_Contract_Approval nextApprover = new T_Project_Contract_Approval();
			nextApprover.setProjectContractApproval(projectContractApproval.getProjectContractApproval());
			nextApprover.setApprovalStatus(0);
			if(projectContractApproval.getApproverType().compareTo(1) == 0) {
				nextApprover.setApproverId(projectContractApproval.getProjectContractApproval().getProcessOwner());
				nextApprover.setApproverType(2);
			} else if(projectContractApproval.getApproverType().compareTo(2) == 0) {
				nextApprover.setApproverId(projectContractApproval.getProjectContractApproval().getProblemSolvingLeader());
				nextApprover.setApproverType(3);
			} else if(projectContractApproval.getApproverType().compareTo(3) == 0) {
				nextApprover.setApproverId(projectContractApproval.getProjectContractApproval().getFinanceController());
				nextApprover.setApproverType(4);
			} else if(projectContractApproval.getApproverType().compareTo(4) == 0) {
				nextApprover.setApproverId(projectContractApproval.getProjectContractApproval().getBusinessHead());
				nextApprover.setApproverType(5);
			} else if(projectContractApproval.getApproverType().compareTo(5) == 0) {
				nextApprover.setApproverType(6);
				nextApprover.setApproverId(projectContractApproval.getProjectContractApproval().getCorporateProblemSolvingLeader());
			} else {
				addFlag = 1;
			}
			if(addFlag.compareTo(0) == 0) {
				nextApprover.setActive(1);
				nextApprover.setApprovalSubmissionDate(currDate);
				projectContractApprovalDao.save(nextApprover);
			}
			nextApprover = null;
			if(projectContractApproval.getApproverType().compareTo(6) == 0) {
				T_Project_Charter projectContract = projectCharterDao.findById(projectContractApproval.getProjectContractApproval().gettProjectCharterId()).get();
				projectContract.setProjectCharterStatus(6); //Set Charter Status from CONTRACT SUBMITTED -> CONTRACT APPROVED
				projectCharterDao.save(projectContract);
				projectContract = null;
			}
			response.append("next");
			projectContractApproval = null;
		} else if (contractApproval.getApprovalStatus().compareTo(2) == 0) {
			T_Project_Charter projectCharter = projectCharterDao.findById(projectContractApproval.getProjectContractApproval().gettProjectCharterId()).get();
			projectCharter.setProjectCharterStatus(7); //Set Charter Status from CONTRACT SUBMITTED -> CONTRACT REJECTED 
			projectCharterDao.save(projectCharter);
			response.append("rejected");
			projectCharter = null;
		} else if (contractApproval.getApprovalStatus().compareTo(3) == 0) {
			T_Project_Charter_Request_Terminate_Approval requestTerminateApprovalSubmission = new T_Project_Charter_Request_Terminate_Approval();
			requestTerminateApprovalSubmission.setProjectCharterApproval(projectContractApproval.getProjectContractApproval());
			requestTerminateApprovalSubmission.setApprovalStatus(0);
			requestTerminateApprovalSubmission.setApproverType(1);
			requestTerminateApprovalSubmission.setApproverId(projectContractApproval.getProjectContractApproval().getSponsor());
			requestTerminateApprovalSubmission.setActive(1);
			projectCharterRequestTerminateApprovalDao.save(requestTerminateApprovalSubmission);
			requestTerminateApprovalSubmission = null;
			response.append("terminate");
		}
		projectContractApproval = null;
		response.append("done");
		return response.toString();
	}
}