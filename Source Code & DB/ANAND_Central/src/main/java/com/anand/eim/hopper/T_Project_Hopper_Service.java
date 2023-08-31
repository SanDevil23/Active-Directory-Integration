package com.anand.eim.hopper;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface T_Project_Hopper_Service {

	public T_Project_Hopper getHopperProjectDetail(HttpServletRequest request);

	public String saveHopperProjectDetails(T_Project_Hopper projectHopper, HttpServletRequest request);

	public List<T_Project_Hopper> getHopperProjectList(HttpServletRequest request, Integer offset);

	public List<T_Project_Hopper_History> getHopperProjectHistoryList(HttpServletRequest request, Integer offset);

	public String getHopperCountForDashboard(HttpServletRequest request, Integer dataFetchFlag);
}
