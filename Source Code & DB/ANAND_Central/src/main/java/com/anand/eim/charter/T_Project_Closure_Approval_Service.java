package com.anand.eim.charter;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface T_Project_Closure_Approval_Service {

	List<T_Project_Closure_Approval> getClosureApprovalList(HttpServletRequest request);

	String saveProjectClosureApproval(T_Project_Closure_Approval closureApproval, HttpServletRequest request);
}
