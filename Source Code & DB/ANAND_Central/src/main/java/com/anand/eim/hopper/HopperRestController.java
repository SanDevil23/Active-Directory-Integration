package com.anand.eim.hopper;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HopperRestController {

	@Autowired private T_Project_Hopper_Service projectHopperService;

	@GetMapping("getHopperCount")
	public String getHopperCount(HttpServletRequest request) {
		StringBuilder response = new StringBuilder();
		try {
			System.out.println("**********************");
			System.out.println("getHopperCount");
			response.append(projectHopperService.getHopperCountForDashboard(request, 2));
			System.out.println(response);
			System.out.println("**********************");
		} catch(Exception e) {
			e.printStackTrace();
			response.setLength(0);
		}
		return response.toString();
	}

	@GetMapping("getHopperCumulativeSaving")
	public String getHopperCumulativeSaving(HttpServletRequest request) {
		StringBuilder response = new StringBuilder();
		try {
			System.out.println("**********************");
			System.out.println("getHopperCount");
			response.append(projectHopperService.getHopperCountForDashboard(request, 1));
			System.out.println(response);
			System.out.println("**********************");
		} catch(Exception e) {
			e.printStackTrace();
			response.setLength(0);
		}
		return response.toString();
	}
}
