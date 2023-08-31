package com.anand.eim.charter;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface T_Project_Charter_Approval_Service {

	List<T_Project_Charter_Approval> getCharterApprovalList(HttpServletRequest request);

	String saveProjectCharterApproval(T_Project_Charter_Approval charterApproval, HttpServletRequest request);
}
