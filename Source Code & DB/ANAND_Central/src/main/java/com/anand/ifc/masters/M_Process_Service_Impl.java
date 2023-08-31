/**
 * *******************************************************************************************
 * Copyright © 2021 Anand Group India. All rights reserved.
 * No part of this product may be reproduced in any form by any means without prior
 * written authorization of Anand Automotive Private Limited and its licensors, if any.
 * *******************************************************************************************
 * Author - Anand Group India - R S Iyer
 */
package com.anand.ifc.masters;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.anand.masters.M_User;
import com.anand.masters.M_User_Dao;
import com.google.gson.Gson;

@Service
public class M_Process_Service_Impl implements M_Process_Service {

	@Autowired private M_Process_Dao mProcessDao;
	@Autowired private M_Process_History_Dao mProcessHistoryDao;
	@Autowired private M_User_Dao mUserDao;

	@Override
	public List<M_Process> getProcessList(HttpServletRequest request, Integer offset) {
		List<M_Process> finalProcessList = new ArrayList<M_Process>();
		try {
			List<M_Process> processList = null;
			Integer activenessCheck = 1;
			if(request.getParameter("all") != null && activenessCheck.compareTo(Integer.parseInt(""+request.getParameter("all"))) == 0) {
				processList = mProcessDao.findAll();
			} else {
				processList = mProcessDao.getProcessWithOffset(offset);
			}
			for(M_Process process : processList) {
				process.setActionForList("");
				if((request.getSession(true).getAttribute("admin") != null && activenessCheck.compareTo(Integer.parseInt(""+request.getSession(true).getAttribute("admin"))) == 0)
					|| (request.getSession(true).getAttribute("itAdmin") != null && activenessCheck.compareTo(Integer.parseInt(""+request.getSession(true).getAttribute("itAdmin"))) == 0)) {
					process.setActionForList("<a href='#' title='Edit Process' onclick='editProcess("+process.getmProcessId()+");'><i class='fas fa-edit'></i></a>");
				}
				finalProcessList.add(process);
			}
			Collections.sort(finalProcessList);
		} catch(Exception e) {
			e.printStackTrace();
			finalProcessList.clear(); finalProcessList = null;
		}
		return finalProcessList;
	}

	@Override
	public List<M_Process> getProcessByActiveStatus(Integer processActive) {
		List<M_Process> processList = null;
		try {
			processList = mProcessDao.findByProcessActive(processActive);
			Collections.sort(processList);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return processList;
	}

	@Override
	@Transactional
	public String saveProcessDetails(HttpServletRequest request, M_Process process) {
		StringBuilder response = new StringBuilder();
		M_User user = mUserDao.findByUserLoginId(SecurityContextHolder.getContext().getAuthentication().getName());
		Date currDate = new Date();
		if(process.getmProcessId() != null) {
			M_Process currProcess = mProcessDao.findById(Long.parseLong(""+process.getmProcessId())).get();
			Integer proceedFlag = 0;
			List<M_Process> processExists = mProcessDao.findByProcessName(process.getProcessName());
			if(processExists != null && processExists.size() != 0) {
				for(M_Process processDetails : processExists) {
					if(process.getProcessName().equalsIgnoreCase(processDetails.getProcessName()) && currProcess.getmProcessId().compareTo(processDetails.getmProcessId()) != 0) {
						proceedFlag = 1;
					}
				}
			}
			processExists = null;
			if(proceedFlag.compareTo(0) == 0) {
				M_Process_History processHistory = new M_Process_History();
				processHistory.setmProcessId(currProcess);
				processHistory.setProcessActive(currProcess.getProcessActive());
				processHistory.setProcessName(currProcess.getProcessName());
				processHistory.setCreatedBy(user);
				processHistory.setCreatedOn(currDate);
				mProcessHistoryDao.save(processHistory);
				processHistory = null;

				currProcess.setProcessName(process.getProcessName());
				currProcess.setProcessActive(process.getProcessActive());
				currProcess.setUpdatedBy(user);
				currProcess.setUpdatedOn(currDate);
				mProcessDao.save(currProcess);
				currProcess = null;
				response.append("edit");
			} else {
				response.append("nameExists");
			}
			proceedFlag = null;
		} else {
			List<M_Process> processExists = mProcessDao.findByProcessName(process.getProcessName());
			if(processExists != null && processExists.size() != 0) {
				System.out.println("name exists");
				response.append("nameExists");
			} else {
				process.setCreatedBy(user);
				process.setCreatedOn(currDate);
				mProcessDao.save(process);
				
				response.append("add");
			}
			processExists = null;
		}
		currDate = null; user = null;
		return response.toString();
	}

	@Override
	public String getProcessDetails(HttpServletRequest request) {
		String response = "";
		Map<String, String> processDetails = new HashMap<String, String>();
		try {
			M_Process process = mProcessDao.findById(Long.parseLong(""+request.getParameter("mProcessId"))).get();
			processDetails.put("processName", process.getProcessName());
			processDetails.put("processActive", ""+process.getProcessActive());
			Gson gson = new Gson();
			response = gson.toJson(processDetails);
			gson = null; process = null; processDetails = null;
		} catch(Exception e) {
			e.printStackTrace();
			response = "error";
		}
		return response;
	}
}