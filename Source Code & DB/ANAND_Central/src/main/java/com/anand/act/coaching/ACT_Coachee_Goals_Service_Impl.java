/**
 * *******************************************************************************************
 * Copyright © 2021 Anand Group India. All rights reserved.
 * No part of this product may be reproduced in any form by any means without prior
 * written authorization of Anand Automotive Private Limited and its licensors, if any.
 * *******************************************************************************************
 * Author - Anand Group India - R S Iyer
 */
package com.anand.act.coaching;

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

import com.anand.act.batch.ACT_Coach_Coachee_Map;
import com.anand.act.batch.ACT_Coach_Coachee_Map_Dao;
import com.anand.act.batch.ACT_Coaching_Batch;
import com.anand.act.batch.ACT_Coaching_Batch_Dao;
import com.anand.masters.M_User;
import com.anand.masters.M_User_Dao;
import com.google.gson.Gson;

@Service
public class ACT_Coachee_Goals_Service_Impl implements ACT_Coachee_Goals_Service {

	@Autowired private ACT_Coachee_Goals_Dao actCoacheeGoalsDao;
	@Autowired private ACT_Coachee_Goals_History_Dao actCoacheeGoalsHistoryDao;
	@Autowired private ACT_Coach_Coachee_Map_Dao actCoachCoacheeMapDao;
	@Autowired private ACT_Coaching_Batch_Dao actCoachingBatchDao;;
	@Autowired private M_User_Dao mUserDao;

	@Override
	public String checkCoacheeIsAddedInLatestAldp(HttpServletRequest request) {
		StringBuilder response = new StringBuilder();
		try {
			ACT_Coaching_Batch latestBatch = actCoachingBatchDao.findById(Long.parseLong(""+request.getParameter("batch-id"))).get();
			M_User user = mUserDao.findByUserLoginId(SecurityContextHolder.getContext().getAuthentication().getName());
			final long currUserId = user.getmUserId();
			
			List<ACT_Coach_Coachee_Map> coachCoacheeMapList = new ArrayList<ACT_Coach_Coachee_Map>();
			coachCoacheeMapList.addAll(latestBatch.getCoachCoacheeMappingSet());
			
			Integer activenessCheck = 1;
			
			if(request.getSession(true).getAttribute("ctCoachee") != null && 
				activenessCheck.compareTo(Integer.parseInt(""+request.getSession(true).getAttribute("ctCoachee"))) == 0) {
				if(Integer.parseInt(""+coachCoacheeMapList.stream()
				.filter(coacheeCheck -> coacheeCheck.getActCoachCoacheeMapActive().compareTo(1) == 0)
				.filter(coacheeCheck -> coacheeCheck.getCoacheeUserId().getmUserId().compareTo(currUserId) == 0).count()) > 0) {
					response.append("yes");
				} else {
					response.append("no");
				}
			} else {
				response.append("yes");
			}
			
			activenessCheck = null;
			coachCoacheeMapList.clear(); coachCoacheeMapList = null;
			user = null; latestBatch = null;
		} catch(Exception e) {
			e.printStackTrace();
			response.setLength(0);
			response.append("error");
		}
		return response.toString();
	}

	@Override
	public List<ACT_Coachee_Goals> getCoacheeGoalsList(HttpServletRequest request) {
		List<ACT_Coachee_Goals> coacheeGoalsList = new ArrayList<ACT_Coachee_Goals>();
		M_User coacheeUserId = mUserDao.findById(Long.parseLong(""+request.getParameter("coachee-id"))).get();
		ACT_Coaching_Batch coachingBatch = actCoachingBatchDao.findById(Long.parseLong(""+request.getParameter("batch-id"))).get();
		Date currDate = new Date();
		List<ACT_Coach_Coachee_Map> coachCoacheeMap = actCoachCoacheeMapDao.findByCoachCoacheeMappingSetAndCoacheeUserId(coachingBatch, coacheeUserId);
		List<ACT_Coachee_Goals> tempCoachingGoalList = new ArrayList<ACT_Coachee_Goals>();
		try {
			System.out.println(request.getParameter("coachee-id")+" --- ");
			for(ACT_Coach_Coachee_Map currCoachCoacheeMap : coachCoacheeMap) {
				tempCoachingGoalList = actCoacheeGoalsDao.findByCoacheeGoalsSet(currCoachCoacheeMap);
			}
			for(ACT_Coachee_Goals goal : tempCoachingGoalList) {
				if(currDate.compareTo(coachingBatch.getBatchEndDate()) < 1) {
					goal.setActionForCoachingGoal("<a href='#' title='Edit Goal' onclick='editGoal("+goal.getActCoacheeGoalsId()+");'><i class='fas fa-edit'></i></a>");
				} else {
					goal.setActionForCoachingGoal("<i title='Batch Ended, No Editing Allowed' class='fas fa-edit'></i></a>");
				}
				coacheeGoalsList.add(goal);
			}
			Collections.sort(coacheeGoalsList);
		} catch(Exception e) {
			e.printStackTrace();
			coacheeGoalsList.clear();
			coacheeGoalsList = null;
		}
		tempCoachingGoalList.clear(); tempCoachingGoalList = null;
		coacheeUserId = null; coachingBatch = null; currDate = null; coachCoacheeMap = null;
		return coacheeGoalsList;
	}

	@Override
	@Transactional
	public String saveCoacheeGoalsDetails(HttpServletRequest request, ACT_Coachee_Goals actCoacheeGoals){
		StringBuilder response = new StringBuilder();
		M_User user = mUserDao.findByUserLoginId(SecurityContextHolder.getContext().getAuthentication().getName());
		Date currDate = new Date();
		actCoacheeGoals.setCoachingGoalDescription(actCoacheeGoals.getCoachingGoalDescription().replace( "^\\s*$" , "\n"));
		System.out.println(actCoacheeGoals.getCoachingGoalDescription());
		if(actCoacheeGoals.getActCoacheeGoalsId() != null) {
			ACT_Coachee_Goals currCoacheeGoal = actCoacheeGoalsDao.findById(Long.parseLong(""+actCoacheeGoals.getActCoacheeGoalsId())).get();
			Integer proceedFlag = 0;
			List<ACT_Coachee_Goals> coacheeGoalsExists = actCoacheeGoalsDao.findByCoachingGoalAndCoacheeGoalsSet(
					actCoacheeGoals.getCoachingGoal(), actCoachCoacheeMapDao.findById(actCoacheeGoals.getActCoachCoacheeMapId()).get());
			if(coacheeGoalsExists != null && coacheeGoalsExists.size() != 0) {
				for(ACT_Coachee_Goals coacheeGoalsDetails : coacheeGoalsExists) {
					if(actCoacheeGoals.getCoachingGoal().equalsIgnoreCase(coacheeGoalsDetails.getCoachingGoal()) 
						&& currCoacheeGoal.getActCoacheeGoalsId().compareTo(coacheeGoalsDetails.getActCoacheeGoalsId()) != 0) {
						proceedFlag = 1;
					}
				}
			}
			coacheeGoalsExists = null;
			if(proceedFlag.compareTo(0) == 0) {
				ACT_Coachee_Goals_History coacheeGoalsHistory = new ACT_Coachee_Goals_History();
				coacheeGoalsHistory.setParentCoachingGoal(currCoacheeGoal);
				coacheeGoalsHistory.setCoachingGoalActive(currCoacheeGoal.getCoachingGoalActive());
				coacheeGoalsHistory.setCoachingGoal(currCoacheeGoal.getCoachingGoal());
				coacheeGoalsHistory.setCoachingGoalDescription(currCoacheeGoal.getCoachingGoalDescription());
				coacheeGoalsHistory.setmUserId(user);
				if(currCoacheeGoal.getUpdatedOn() != null) {
					coacheeGoalsHistory.setCreatedOn(currCoacheeGoal.getUpdatedOn());
				} else {
					coacheeGoalsHistory.setCreatedOn(currCoacheeGoal.getCreatedOn());
				}
				actCoacheeGoalsHistoryDao.save(coacheeGoalsHistory);
				coacheeGoalsHistory = null;

				currCoacheeGoal.setCoachingGoal(actCoacheeGoals.getCoachingGoal());
				currCoacheeGoal.setCoachingGoalDescription(actCoacheeGoals.getCoachingGoalDescription());
				currCoacheeGoal.setCoachingGoalActive(actCoacheeGoals.getCoachingGoalActive());
				currCoacheeGoal.setmUserIdUpdated(user);
				currCoacheeGoal.setUpdatedOn(currDate);
				actCoacheeGoalsDao.save(currCoacheeGoal);
				currCoacheeGoal = null;
				response.append("edit");
			} else {
				response.append("nameExists");
			}
			proceedFlag = null;
		} else {
			List<ACT_Coachee_Goals> coacheeGoalsExists = actCoacheeGoalsDao.findByCoachingGoalAndCoacheeGoalsSet(
					actCoacheeGoals.getCoachingGoal(), actCoachCoacheeMapDao.findById(actCoacheeGoals.getActCoachCoacheeMapId()).get());
			if(coacheeGoalsExists != null && coacheeGoalsExists.size() != 0) {
				System.out.println("name exists");
				response.append("nameExists");
			} else {
				actCoacheeGoals.setCoacheeGoalsSet(actCoachCoacheeMapDao.findById(actCoacheeGoals.getActCoachCoacheeMapId()).get());
				actCoacheeGoals.setmUserId(user);
				actCoacheeGoals.setCreatedOn(currDate);
				actCoacheeGoals.setCoachingGoalActive(actCoacheeGoals.getCoachingGoalActive());
				actCoacheeGoalsDao.save(actCoacheeGoals);
				response.append("add");
			}
			coacheeGoalsExists = null;
		}
		currDate = null; user = null;
		return response.toString();
	}

	@Override
	public String getCoacheeGoalDetails(HttpServletRequest request) {
		StringBuilder response = new StringBuilder();
		Map<String, String> goalDetails = new HashMap<String, String>();
		try {
			ACT_Coachee_Goals coacheeGoal = actCoacheeGoalsDao.findById(Long.parseLong(""+request.getParameter("actCoacheeGoalsId"))).get();
			goalDetails.put("goalName", coacheeGoal.getCoachingGoal());
			goalDetails.put("goalDescription", coacheeGoal.getCoachingGoalDescription());
			goalDetails.put("goalActive", ""+coacheeGoal.getCoachingGoalActive());
			Gson gson = new Gson();
			response.append(gson.toJson(goalDetails));
			gson = null; coacheeGoal = null; goalDetails = null;
		} catch(Exception e) {
			e.printStackTrace();
			response.setLength(0);
			response.append("error");
		}
		return response.toString();
	}
}