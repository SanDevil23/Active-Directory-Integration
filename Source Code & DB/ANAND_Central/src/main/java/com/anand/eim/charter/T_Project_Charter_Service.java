package com.anand.eim.charter;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface T_Project_Charter_Service {

	public T_Project_Charter getCharterProjectDetail(HttpServletRequest request);

	public T_Project_Charter_Review getCharterProjectReviewDetail(HttpServletRequest request);
	
	public String saveCharterProjectDetails(T_Project_Charter projectCharter, HttpServletRequest request) throws Exception;

	public String saveCharterContractProjectDetails(T_Project_Charter projectCharter, HttpServletRequest request) throws Exception;

	public String saveCharterClosureProjectDetails(T_Project_Charter projectCharter, HttpServletRequest request) throws Exception;

	public String saveSustenanceAuditDetails(T_Project_Charter projectCharter, HttpServletRequest request) throws Exception;
	
	public String saveSustenanceScoreDetails(T_Project_Charter projectCharter, HttpServletRequest request) throws Exception;
	
	public void submitCharterMail(T_Project_Charter projectCharter, HttpServletRequest request);

	public List<T_Project_Charter> getCharterProjectList(HttpServletRequest request, Integer offset);

	public List<T_Project_Charter_History> getCharterProjectHistoryList(HttpServletRequest request, Integer offset);

	public String getCharterCountForDashboard(HttpServletRequest request, Integer dataFetchFlag);
}
