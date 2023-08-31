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
public class M_Aems_Sub_Category_Service_Impl implements M_Aems_Sub_Category_Service {

	@Autowired private M_Aems_Sub_Category_Dao mAemsSubCategoryDao;
	@Autowired private M_Aems_Sub_Category_History_Dao mAemsSubCategoryHistoryDao;
	@Autowired private M_Aems_Category_Dao mAemsCategoryDao;
	@Autowired private M_User_Dao mUserDao;

	@Override
	public List<M_Aems_Sub_Category> getAemsSubCategoryList(HttpServletRequest request, Integer offset) {
		List<M_Aems_Sub_Category> finalAemsSubCategoryList = new ArrayList<M_Aems_Sub_Category>();
		try {
			List<M_Aems_Sub_Category> aemsCategoryList = null;
			Integer activenessCheck = 1;
			if(request.getParameter("all") != null && activenessCheck.compareTo(Integer.parseInt(""+request.getParameter("all"))) == 0) {
				aemsCategoryList = mAemsSubCategoryDao.findAll();
			} else {
				aemsCategoryList = mAemsSubCategoryDao.getAemsSubCategoryWithOffset(offset);
			}
			for(M_Aems_Sub_Category AemsSubCategory : aemsCategoryList) {
				AemsSubCategory.setActionForList("");
				if((request.getSession(true).getAttribute("aemsAdmin") != null && activenessCheck.compareTo(Integer.parseInt(""+request.getSession(true).getAttribute("aemsAdmin"))) == 0)
					|| (request.getSession(true).getAttribute("itAdmin") != null && activenessCheck.compareTo(Integer.parseInt(""+request.getSession(true).getAttribute("itAdmin"))) == 0)) {
					AemsSubCategory.setActionForList("<a href='#' title='Edit AEMS Category' onclick='editAemsSubCategory("+AemsSubCategory.getmAemsSubCategoryId()+");'><i class='fas fa-edit'></i></a>");
				}
				finalAemsSubCategoryList.add(AemsSubCategory);
			}
			Collections.sort(finalAemsSubCategoryList);
		} catch(Exception e) {
			e.printStackTrace();
			finalAemsSubCategoryList.clear(); finalAemsSubCategoryList = null;
		}
		return finalAemsSubCategoryList;
	}

	@Override
	public List<M_Aems_Sub_Category> getAemsSubCategoryByActiveStatus(Integer aemsSubCategoryActive) {
		List<M_Aems_Sub_Category> AemsSubCategoryList = null;
		try {
			AemsSubCategoryList = mAemsSubCategoryDao.findByAemsSubCategoryActive(aemsSubCategoryActive);
			Collections.sort(AemsSubCategoryList);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return AemsSubCategoryList;
	}

	@Override
	@Transactional
	public String saveAemsSubCategoryDetails(HttpServletRequest request, M_Aems_Sub_Category aemsSubCategory) {
		StringBuilder response = new StringBuilder();
		M_User user = mUserDao.findByUserLoginId(SecurityContextHolder.getContext().getAuthentication().getName());
		Date currDate = new Date();
		if(aemsSubCategory.getmAemsSubCategoryId() != null) {
			M_Aems_Sub_Category currAemsSubCategory = mAemsSubCategoryDao.findById(Long.parseLong(""+aemsSubCategory.getmAemsSubCategoryId())).get();
			Integer proceedFlag = 0;
			List<M_Aems_Sub_Category> AemsSubCategoryExists = mAemsSubCategoryDao.findByAemsSubCategoryName(aemsSubCategory.getAemsSubCategoryName());
			if(AemsSubCategoryExists != null && AemsSubCategoryExists.size() != 0) {
				for(M_Aems_Sub_Category AemsSubCategoryDetails : AemsSubCategoryExists) {
					if(aemsSubCategory.getAemsSubCategoryName().equalsIgnoreCase(AemsSubCategoryDetails.getAemsSubCategoryName()) && currAemsSubCategory.getmAemsSubCategoryId().compareTo(AemsSubCategoryDetails.getmAemsSubCategoryId()) != 0) {
						proceedFlag = 1;
					}
				}
			}
			AemsSubCategoryExists = null;
			if(proceedFlag.compareTo(0) == 0) {
				M_Aems_Sub_Category_History aemsSubCategoryHistory = new M_Aems_Sub_Category_History();
				aemsSubCategoryHistory.setmAemsCategoryId(mAemsCategoryDao.findById(currAemsSubCategory.getmAemsCategoryId().getmAemsCategoryId()).get());
				aemsSubCategoryHistory.setAemsSubCategoryHistory(currAemsSubCategory);
				aemsSubCategoryHistory.setAemsSubCategoryActive(currAemsSubCategory.getAemsSubCategoryActive());
				aemsSubCategoryHistory.setAemsSubCategoryName(currAemsSubCategory.getAemsSubCategoryName());
				aemsSubCategoryHistory.setmUserId(user);
				aemsSubCategoryHistory.setCreatedOn(currDate);
				mAemsSubCategoryHistoryDao.save(aemsSubCategoryHistory);
				aemsSubCategoryHistory = null;

				currAemsSubCategory.setmAemsCategoryId(mAemsCategoryDao.findById(aemsSubCategory.getTempCategoryId()).get());
				currAemsSubCategory.setAemsSubCategoryName(aemsSubCategory.getAemsSubCategoryName());
				currAemsSubCategory.setAemsSubCategoryActive(aemsSubCategory.getAemsSubCategoryActive());
				currAemsSubCategory.setmUserIdUpdated(user);
				currAemsSubCategory.setUpdatedOn(currDate);
				mAemsSubCategoryDao.save(currAemsSubCategory);
				currAemsSubCategory = null;
				response.append("edit");
			} else {
				response.append("nameExists");
			}
			proceedFlag = null;
		} else {
			List<M_Aems_Sub_Category> AemsSubCategoryExists = mAemsSubCategoryDao.findByAemsSubCategoryName(aemsSubCategory.getAemsSubCategoryName());
			if(AemsSubCategoryExists != null && AemsSubCategoryExists.size() != 0) {
				System.out.println("name exists");
				response.append("nameExists");
			} else {
				aemsSubCategory.setmAemsCategoryId(mAemsCategoryDao.findById(aemsSubCategory.getTempCategoryId()).get());
				aemsSubCategory.setmUserId(user);
				aemsSubCategory.setCreatedOn(currDate);
				mAemsSubCategoryDao.save(aemsSubCategory);
				
				response.append("add");
			}
			AemsSubCategoryExists = null;
		}
		currDate = null; user = null;
		return response.toString();
	}

	@Override
	public String getAemsSubCategoryDetails(HttpServletRequest request) {
		String response = "";
		Map<String, String> aemsSubCategoryDetails = new HashMap<String, String>();
		try {
			M_Aems_Sub_Category aemsSubCategory = mAemsSubCategoryDao.findById(Long.parseLong(""+request.getParameter("mAemsSubCategoryId"))).get();
			aemsSubCategoryDetails.put("aemsSubCategoryName", aemsSubCategory.getAemsSubCategoryName());
			aemsSubCategoryDetails.put("aemsCategoryId", ""+aemsSubCategory.getmAemsCategoryId().getmAemsCategoryId());
			aemsSubCategoryDetails.put("aemsSubCategoryActive", ""+aemsSubCategory.getAemsSubCategoryActive());
			Gson gson = new Gson();
			response = gson.toJson(aemsSubCategoryDetails);
			gson = null; aemsSubCategory = null; aemsSubCategoryDetails = null;
		} catch(Exception e) {
			e.printStackTrace();
			response = "error";
		}
		return response;
	}
}