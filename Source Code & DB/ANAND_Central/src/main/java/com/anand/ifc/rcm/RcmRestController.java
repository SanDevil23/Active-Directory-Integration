package com.anand.ifc.rcm;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.anand.masters.M_User_Service;

@RestController
public class RcmRestController {

	@Autowired private M_User_Service mUserService;
	@Autowired private M_Rcm_Service mRcmService;

	@GetMapping("getSohPerson")
	public String getSohPerson(HttpServletRequest request) {
		StringBuilder response = new StringBuilder();
		try {
			System.out.println("**********************");
			System.out.println("getSohPerson");
			response.append(mUserService.getActiveUserByRoleInJson(1, "IFC SOH Person"));
			System.out.println(response);
			System.out.println("**********************");
		} catch(Exception e) {
			e.printStackTrace();
			response.setLength(0);
		}
		return response.toString();
	}

	@GetMapping("getLineManager")
	public String getLineManager(HttpServletRequest request) {
		StringBuilder response = new StringBuilder();
		try {
			System.out.println("**********************");
			System.out.println("getLineManager");
			response.append(mUserService.getLineManager(request));
			System.out.println(response);
			System.out.println("**********************");
		} catch(Exception e) {
			e.printStackTrace();
			response.setLength(0);
		}
		return response.toString();
	}

	@GetMapping("getPraac")
	public String getPraac(HttpServletRequest request) {
		StringBuilder response = new StringBuilder();
		try {
			System.out.println("**********************");
			System.out.println("getPraac");
			response.append(mUserService.getPraac(request));
			System.out.println(response);
			System.out.println("**********************");
		} catch(Exception e) {
			e.printStackTrace();
			response.setLength(0);
		}
		return response.toString();
	}	
	@GetMapping("getRcmDetails")
	public String getRcmDetails(HttpServletRequest request) {
		String response = "";
		try {
			response = mRcmService.getRcmDetails(request);
			System.out.println(response);
		} catch(Exception e) {
			e.printStackTrace();
			response = "error";
		}
		return response;
	}
	
	@GetMapping("getRcmTransactionDetails")
	public String getRcmTransactionDetails(HttpServletRequest request) {
		String response = "";
		try {
			response = mRcmService.getRcmTransactionDetails(request);
			System.out.println(response);
		} catch(Exception e) {
			e.printStackTrace();
			response = "error";
		}
		return response;
	}
	
	@GetMapping("getApprovalDetails")
	public String getApprovalDetails(HttpServletRequest request) {
		String response = "";
		try {
			response = mRcmService.getApprovalDetails(request);
			System.out.println(response);
		} catch(Exception e) {
			e.printStackTrace();
			response = "error";
		}
		return response;
	}
	
	
	@GetMapping("/getProofAttachment")
	public ResponseEntity<byte[]> getFile(HttpServletRequest request) {
		M_Transaction transaction = mRcmService.getFileDetails(request);
		return ResponseEntity.ok().header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + transaction.getProofAttachmentName() + "\"")
				.body(transaction.getProofAttachment());
	}
	
}
