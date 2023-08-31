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
public class M_Role_Service_Impl implements M_Role_Service {

	@Autowired private M_Role_Dao mRoleDao;
	@Autowired private M_Role_History_Dao mRoleHistoryDao;
	@Autowired private M_User_Dao mUserDao;

	@Override
	public List<M_Role> getRoleList(HttpServletRequest request, Integer offset) {
		List<M_Role> finalRoleList = new ArrayList<M_Role>();
		try {
			List<M_Role> roleList = null;
			Integer activenessCheck = 1;
			if(request.getParameter("all") != null && activenessCheck.compareTo(Integer.parseInt(""+request.getParameter("all"))) == 0) {
				roleList = mRoleDao.findAll();
			} else {
				roleList = mRoleDao.getRoleWithOffset(offset);
			}
			for(M_Role role : roleList) {
				role.setActionForList("");
				if((request.getSession(true).getAttribute("admin") != null && activenessCheck.compareTo(Integer.parseInt(""+request.getSession(true).getAttribute("admin"))) == 0)
					|| (request.getSession(true).getAttribute("itAdmin") != null && activenessCheck.compareTo(Integer.parseInt(""+request.getSession(true).getAttribute("itAdmin"))) == 0)) {
					role.setActionForList("<a href='#' title='Edit Role' onclick='editRole("+role.getmRoleId()+");'><i class='fas fa-edit'></i></a>");
				}
				finalRoleList.add(role);
			}
			Collections.sort(finalRoleList);
		} catch(Exception e) {
			e.printStackTrace();
			finalRoleList.clear(); finalRoleList = null;
		}
		return finalRoleList;
	}

	@Override
	public List<M_Role> getRoleByActiveStatus(Integer roleActive) {
		List<M_Role> roleList = null;
		try {
			roleList = mRoleDao.findByRoleActive(roleActive);
			Collections.sort(roleList);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return roleList;
	}

	@Override
	@Transactional
	public String saveRoleDetails(HttpServletRequest request, M_Role role) {
		StringBuilder response = new StringBuilder();
		M_User user = mUserDao.findByUserLoginId(SecurityContextHolder.getContext().getAuthentication().getName());
		Date currDate = new Date();
		if(role.getmRoleId() != null) {
			/*M_Role currRole = mRoleDao.getOne(role.getmRoleId());*/
			M_Role currRole = mRoleDao.findById(Long.parseLong(""+role.getmRoleId())).get();
			Integer proceedFlag = 0;
			List<M_Role> roleExists = mRoleDao.findByRoleName(role.getRoleName());
			if(roleExists != null && roleExists.size() != 0) {
				for(M_Role roleDetails : roleExists) {
					if(role.getRoleName().equalsIgnoreCase(roleDetails.getRoleName()) && currRole.getmRoleId().compareTo(roleDetails.getmRoleId()) != 0) {
						proceedFlag = 1;
					}
				}
			}
			roleExists = null;
			if(proceedFlag.compareTo(0) == 0) {
				M_Role_History roleHistory = new M_Role_History();
				roleHistory.setmRoleId(currRole);
				roleHistory.setRoleActive(currRole.getRoleActive());
				roleHistory.setRoleName(currRole.getRoleName());
				roleHistory.setRoleDescription(currRole.getRoleDescription());
				roleHistory.setmUserId(user);
				roleHistory.setCreatedOn(currDate);
				mRoleHistoryDao.save(roleHistory);
				roleHistory = null;

				currRole.setRoleName(role.getRoleName());
				currRole.setRoleDescription(role.getRoleDescription());
				currRole.setRoleActive(role.getRoleActive());
				currRole.setmUserIdUpdated(user);
				currRole.setUpdatedOn(currDate);
				mRoleDao.save(currRole);
				currRole = null;
				response.append("edit");
			} else {
				response.append("nameExists");
			}
			proceedFlag = null;
		} else {
			List<M_Role> roleExists = mRoleDao.findByRoleName(role.getRoleName());
			if(roleExists != null && roleExists.size() != 0) {
				System.out.println("name exists");
				response.append("nameExists");
			} else {
				role.setmUserId(user);
				role.setCreatedOn(currDate);
				mRoleDao.save(role);
				response.append("add");
			}
			roleExists = null;
		}
		currDate = null; user = null;
		return response.toString();
	}

	@Override
	public String getRoleDetails(HttpServletRequest request) {
		String response = "";
		Map<String, String> roleDetails = new HashMap<String, String>();
		try {
			/*M_Role role = mRoleDao.getOne(Integer.parseInt(""+request.getParameter("mRoleId")));*/
			M_Role role = mRoleDao.findById(Long.parseLong(""+request.getParameter("mRoleId"))).get();
			roleDetails.put("roleName", role.getRoleName());
			roleDetails.put("roleDescription", role.getRoleDescription());
			roleDetails.put("roleActive", ""+role.getRoleActive());
			Gson gson = new Gson();
			response = gson.toJson(roleDetails);
			gson = null; role = null; roleDetails = null;
		} catch(Exception e) {
			e.printStackTrace();
			response = "error";
		}
		return response;
	}

}