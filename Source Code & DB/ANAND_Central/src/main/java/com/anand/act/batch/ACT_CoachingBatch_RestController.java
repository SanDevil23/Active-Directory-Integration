package com.anand.act.batch;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

@RestController
public class ACT_CoachingBatch_RestController {

	@Autowired private ACT_Coaching_Batch_Service actCoachingBatchService;

	@GetMapping("getBatchDetails")
	public String getBatchDetails(HttpServletRequest request) {
		String response = "";
		try {
			response = actCoachingBatchService.getBatchDetails(request);
			System.out.println(response);
		} catch(Exception e) {
			e.printStackTrace();
			response = "error";
		}
		return response;
	}

	@GetMapping("loadMoreBatch")
	public String loadMoreBatch(HttpServletRequest request) {
		StringBuilder response = new StringBuilder();
		List<Map<String, String>> finalBatchList = new ArrayList<Map<String, String>>();
		try {
			SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy");
			List<ACT_Coaching_Batch> roleList = actCoachingBatchService.getBatchList(request, Integer.parseInt(""+request.getParameter("offsetValue")));
			for(ACT_Coaching_Batch role : roleList) {
				Map<String, String> roleMap = new HashMap<String, String>();
				roleMap.put("batchName", role.getBatchName());
				roleMap.put("batchDescription", role.getBatchDescription());
				if(role.getBatchActive().compareTo(1) == 0) {
					roleMap.put("batchActive","<span class='badge badge-success'>Active</span>");
				} else {
					roleMap.put("batchActive","<span class='badge badge-danger'>In-Active</span>");
				}
				roleMap.put("batchCreatedBy", role.getmUserId().getUserFirstName()+" "+role.getmUserId().getUserLastName());
				roleMap.put("batchCreatedOn", dateFormat.format(role.getCreatedOn()));
				if(role.getmUserIdUpdated() != null) {
					roleMap.put("batchUpdatedBy", role.getmUserIdUpdated().getUserFirstName()+" "+role.getmUserIdUpdated().getUserLastName());
					roleMap.put("batchUpdatedOn", dateFormat.format(role.getUpdatedOn()));
				} else {
					roleMap.put("batchUpdatedBy", "");
					roleMap.put("batchUpdatedOn", "");
				}
				roleMap.put("batchStartDate", dateFormat.format(role.getBatchStartDate()));
				roleMap.put("batchEndDate", dateFormat.format(role.getBatchEndDate()));
				roleMap.put("batchAction", role.getActionForList());
				finalBatchList.add(roleMap);
				roleMap = null;
			}
			dateFormat = null;
			Gson gson = new Gson();
			response.append(gson.toJson(finalBatchList));
			gson = null;
		} catch(Exception e) {
			e.printStackTrace();
			response.setLength(0);
			response.append("error");
		}
		finalBatchList.clear(); finalBatchList = null;
		return response.toString();
	}
}
