package com.anand.ifc.rcm;

import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface M_Rcm_Service {
	
	public List<M_Rcm> getRcmList(HttpServletRequest request, Integer offset);
	public List<M_Transaction> getRcmTxnList(HttpServletRequest request, Integer offset);

	public String saveDepartmentDetails(HttpServletRequest request, M_Rcm rcm) throws ParseException;
	public String saveTrackerDetails(HttpServletRequest request, M_Tracker tracker) throws ParseException;
	public String saveTransactionDetails(HttpServletRequest request, M_Transaction transaction) throws Exception;
	
	public String getRcmDetails(HttpServletRequest request);
	public String getRcmTransactionDetails(HttpServletRequest request);
	public String getApprovalDetails(HttpServletRequest request);
	
	public M_Transaction getFileDetails(HttpServletRequest request);

}