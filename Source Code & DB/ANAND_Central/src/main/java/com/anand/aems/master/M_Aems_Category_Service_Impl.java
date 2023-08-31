/**
 * *******************************************************************************************
 * Copyright © 2021 Anand Group India. All rights reserved.
 * No part of this product may be reproduced in any form by any means without prior
 * written authorization of Anand Automotive Private Limited and its licensors, if any.
 * *******************************************************************************************
 * Author - Anand Group India - R S Iyer
 */
package com.anand.aems.master;

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
public class M_Aems_Category_Service_Impl implements M_Aems_Category_Service {

	@Autowired private M_Aems_Category_Dao mAemsCategoryDao;
	@Autowired private M_Aems_Category_History_Dao mAemsCategoryHistoryDao;
	@Autowired private M_User_Dao mUserDao;

	@Override
	public List<M_Aems_Category> getAemsCategoryList(HttpServletRequest request, Integer offset) {
		List<M_Aems_Category> finalAemsCategoryList = new ArrayList<M_Aems_Category>();
		try {
			List<M_Aems_Category> aemsCategoryList = null;
			Integer activenessCheck = 1;
			if(request.getParameter("all") != null && activenessCheck.compareTo(Integer.parseInt(""+request.getParameter("all"))) == 0) {
				aemsCategoryList = mAemsCategoryDao.findAll();
			} else {
				aemsCategoryList = mAemsCategoryDao.getAemsCategoryWithOffset(offset);
			}
			for(M_Aems_Category AemsCategory : aemsCategoryList) {
				AemsCategory.setActionForList("");
				if((request.getSession(true).getAttribute("aemsAdmin") != null && activenessCheck.compareTo(Integer.parseInt(""+request.getSession(true).getAttribute("aemsAdmin"))) == 0)
					|| (request.getSession(true).getAttribute("itAdmin") != null && activenessCheck.compareTo(Integer.parseInt(""+request.getSession(true).getAttribute("itAdmin"))) == 0)) {
					AemsCategory.setActionForList("<a href='#' title='Edit AEMS Category' onclick='editAemsCategory("+AemsCategory.getmAemsCategoryId()+");'><i class='fas fa-edit'></i></a>");
				}
				finalAemsCategoryList.add(AemsCategory);
			}
			Collections.sort(finalAemsCategoryList);
		} catch(Exception e) {
			e.printStackTrace();
			finalAemsCategoryList.clear(); finalAemsCategoryList = null;
		}
		return finalAemsCategoryList;
	}

	@Override
	public List<M_Aems_Category> getAemsCategoryByActiveStatus(Integer AemsCategoryActive) {
		List<M_Aems_Category> AemsCategoryList = null;
		try {
			AemsCategoryList = mAemsCategoryDao.findByAemsCategoryActive(AemsCategoryActive);
			Collections.sort(AemsCategoryList);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return AemsCategoryList;
	}

	@Override
	@Transactional
	public String saveAemsCategoryDetails(HttpServletRequest request, M_Aems_Category aemsCategory) {
		StringBuilder response = new StringBuilder();
		M_User user = mUserDao.findByUserLoginId(SecurityContextHolder.getContext().getAuthentication().getName());
		Date currDate = new Date();
		if(aemsCategory.getmAemsCategoryId() != null) {
			M_Aems_Category currAemsCategory = mAemsCategoryDao.findById(Long.parseLong(""+aemsCategory.getmAemsCategoryId())).get();
			Integer proceedFlag = 0;
			List<M_Aems_Category> AemsCategoryExists = mAemsCategoryDao.findByAemsCategoryName(aemsCategory.getAemsCategoryName());
			if(AemsCategoryExists != null && AemsCategoryExists.size() != 0) {
				for(M_Aems_Category AemsCategoryDetails : AemsCategoryExists) {
					if(aemsCategory.getAemsCategoryName().equalsIgnoreCase(AemsCategoryDetails.getAemsCategoryName()) && currAemsCategory.getmAemsCategoryId().compareTo(AemsCategoryDetails.getmAemsCategoryId()) != 0) {
						proceedFlag = 1;
					}
				}
			}
			AemsCategoryExists = null;
			if(proceedFlag.compareTo(0) == 0) {
				M_Aems_Category_History AemsCategoryHistory = new M_Aems_Category_History();
				AemsCategoryHistory.setAemsProjectCategoryHistory(currAemsCategory);
				AemsCategoryHistory.setAemsCategoryActive(currAemsCategory.getAemsCategoryActive());
				AemsCategoryHistory.setAemsCategoryName(currAemsCategory.getAemsCategoryName());
				AemsCategoryHistory.setmUserId(user);
				AemsCategoryHistory.setCreatedOn(currDate);
				mAemsCategoryHistoryDao.save(AemsCategoryHistory);
				AemsCategoryHistory = null;

				currAemsCategory.setAemsCategoryName(aemsCategory.getAemsCategoryName());
				currAemsCategory.setAemsCategoryActive(aemsCategory.getAemsCategoryActive());
				currAemsCategory.setmUserIdUpdated(user);
				currAemsCategory.setUpdatedOn(currDate);
				mAemsCategoryDao.save(currAemsCategory);
				currAemsCategory = null;
				response.append("edit");
			} else {
				response.append("nameExists");
			}
			proceedFlag = null;
		} else {
			List<M_Aems_Category> AemsCategoryExists = mAemsCategoryDao.findByAemsCategoryName(aemsCategory.getAemsCategoryName());
			if(AemsCategoryExists != null && AemsCategoryExists.size() != 0) {
				System.out.println("name exists");
				response.append("nameExists");
			} else {
				aemsCategory.setmUserId(user);
				aemsCategory.setCreatedOn(currDate);
				mAemsCategoryDao.save(aemsCategory);
				
				response.append("add");
			}
			AemsCategoryExists = null;
		}
		currDate = null; user = null;
		return response.toString();
	}

	@Override
	public String getAemsCategoryDetails(HttpServletRequest request) {
		String response = "";
		Map<String, String> AemsCategoryDetails = new HashMap<String, String>();
		try {
			M_Aems_Category AemsCategory = mAemsCategoryDao.findById(Long.parseLong(""+request.getParameter("mAemsCategoryId"))).get();
			AemsCategoryDetails.put("aemsCategoryName", AemsCategory.getAemsCategoryName());
			AemsCategoryDetails.put("aemsCategoryActive", ""+AemsCategory.getAemsCategoryActive());
			Gson gson = new Gson();
			response = gson.toJson(AemsCategoryDetails);
			gson = null; AemsCategory = null; AemsCategoryDetails = null;
		} catch(Exception e) {
			e.printStackTrace();
			response = "error";
		}
		return response;
	}
}