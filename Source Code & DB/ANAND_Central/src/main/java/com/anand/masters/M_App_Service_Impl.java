/**
 * *******************************************************************************************
 * Copyright © 2021 Anand Group India. All rights reserved.
 * No part of this product may be reproduced in any form by any means without prior
 * written authorization of Anand Automotive Private Limited and its licensors, if any.
 * *******************************************************************************************
 * Author - Anand Group India - R S Iyer
 */
package com.anand.masters;

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

import com.google.gson.Gson;

@Service
public class M_App_Service_Impl implements M_App_Service {

	@Autowired private M_App_Dao mAppDao;
	@Autowired private M_App_History_Dao mAppHistoryDao;
	@Autowired private M_User_Dao mUserDao;

	@Override
	public List<M_App> getAppList(HttpServletRequest request, Integer offset) {
		List<M_App> finalAppList = new ArrayList<M_App>();
		try {
			List<M_App> appList = null;
			Integer activenessCheck = 1;
			if(request.getParameter("all") != null && activenessCheck.compareTo(Integer.parseInt(""+request.getParameter("all"))) == 0) {
				appList = mAppDao.findAll();
			} else {
				appList = mAppDao.getAppWithOffset(offset);
			}
			for(M_App app : appList) {
				app.setActionForList("");
				if((request.getSession(true).getAttribute("admin") != null && activenessCheck.compareTo(Integer.parseInt(""+request.getSession(true).getAttribute("admin"))) == 0)
					|| (request.getSession(true).getAttribute("itAdmin") != null && activenessCheck.compareTo(Integer.parseInt(""+request.getSession(true).getAttribute("itAdmin"))) == 0)) {
					app.setActionForList("<a href='#' title='Edit App' onclick='editApp("+app.getmAppId()+");'><i class='fas fa-edit'></i></a>");
				}
				finalAppList.add(app);
			}
			Collections.sort(finalAppList);
		} catch(Exception e) {
			e.printStackTrace();
			finalAppList.clear(); finalAppList = null;
		}
		return finalAppList;
	}

	@Override
	public List<M_App> getAppByActiveStatus(Integer appActive) {
		List<M_App> appList = null;
		try {
			appList = mAppDao.findByAppActive(appActive);
			Collections.sort(appList);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return appList;
	}

	@Override
	@Transactional
	public String saveAppDetails(HttpServletRequest request, M_App app) {
		StringBuilder response = new StringBuilder();
		M_User user = mUserDao.findByUserLoginId(SecurityContextHolder.getContext().getAuthentication().getName());
		Date currDate = new Date();
		if(app.getmAppId() != null) {
			/*M_App currApp = mAppDao.getOne(app.getmAppId());*/
			M_App currApp = mAppDao.findById(Long.parseLong(""+app.getmAppId())).get();
			Integer proceedFlag = 0;
			List<M_App> appExists = mAppDao.findByAppName(app.getAppName());
			if(appExists != null && appExists.size() != 0) {
				for(M_App appDetails : appExists) {
					if(app.getAppName().equalsIgnoreCase(appDetails.getAppName()) && currApp.getmAppId().compareTo(appDetails.getmAppId()) != 0) {
						proceedFlag = 1;
					}
				}
			}
			appExists = null;
			if(proceedFlag.compareTo(0) == 0) {
				M_App_History appHistory = new M_App_History();
				appHistory.setmAppId(currApp);
				appHistory.setAppActive(currApp.getAppActive());
				appHistory.setAppName(currApp.getAppName());
				appHistory.setAppDescription(currApp.getAppDescription());
				appHistory.setmUserId(user);
				appHistory.setCreatedOn(currDate);
				mAppHistoryDao.save(appHistory);
				appHistory = null;

				currApp.setAppName(app.getAppName());
				currApp.setAppDescription(app.getAppDescription());
				currApp.setAppActive(app.getAppActive());
				currApp.setAppUpdatedBy(user);
				currApp.setAppUpdatedOn(currDate);
				mAppDao.save(currApp);
				currApp = null;
				response.append("edit");
			} else {
				response.append("nameExists");
			}
			proceedFlag = null;
		} else {
			List<M_App> appExists = mAppDao.findByAppName(app.getAppName());
			if(appExists != null && appExists.size() != 0) {
				System.out.println("name exists");
				response.append("nameExists");
			} else {
				app.setAppCreatedBy(user);
				app.setAppCreatedOn(currDate);
				mAppDao.save(app);
				response.append("add");
			}
			appExists = null;
		}
		currDate = null; user = null;
		return response.toString();
	}

	@Override
	public String getAppDetails(HttpServletRequest request) {
		String response = "";
		Map<String, String> appDetails = new HashMap<String, String>();
		try {
			/*M_App app = mAppDao.getOne(Integer.parseInt(""+request.getParameter("mAppId")));*/
			M_App app = mAppDao.findById(Long.parseLong(""+request.getParameter("mAppId"))).get();
			appDetails.put("appName", app.getAppName());
			appDetails.put("appDescription", app.getAppDescription());
			appDetails.put("appActive", ""+app.getAppActive());
			Gson gson = new Gson();
			response = gson.toJson(appDetails);
			gson = null; app = null; appDetails = null;
		} catch(Exception e) {
			e.printStackTrace();
			response = "error";
		}
		return response;
	}

}