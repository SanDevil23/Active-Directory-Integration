package com.anand.act.coaching;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ACT_CoachingDetailsRestController {

	@Autowired private ACT_Coachee_Goals_Service actCoacheeGoalsService;
	@Autowired private ACT_Coachee_Report_Service actCoacheeReportService;

	@GetMapping("getCoacheeGoalDetails")
	public String getCoacheeGoalDetails(HttpServletRequest request) {
		StringBuilder response = new StringBuilder();
		try {
			response.append(actCoacheeGoalsService.getCoacheeGoalDetails(request));
			System.out.println(response);
		} catch(Exception e) {
			response.setLength(0);
			response.append("error");
		}
		return response.toString();
	}

	@GetMapping("getCoacheeReportDetails")
	public String getCoacheeReportDetails(HttpServletRequest request) {
		StringBuilder response = new StringBuilder();
		try {
			response.append(actCoacheeReportService.getCoacheeReportDetails(request));
			System.out.println(response.toString());
		} catch(Exception e) {
			e.printStackTrace();
			response.setLength(0);
			response.append("error");
		}
		return response.toString();
	}
}
