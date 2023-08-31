package com.anand.eim.charter;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface T_Project_Contract_Approval_Service {

	List<T_Project_Contract_Approval> getContractApprovalList(HttpServletRequest request);

	String saveProjectContractApproval(T_Project_Contract_Approval contractApproval, HttpServletRequest request);
}
