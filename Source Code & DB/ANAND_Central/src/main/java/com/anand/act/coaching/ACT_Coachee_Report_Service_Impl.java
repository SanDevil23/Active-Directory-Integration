/**
 * *******************************************************************************************
 * Copyright © 2021 Anand Group India. All rights reserved.
 * No part of this product may be reproduced in any form by any means without prior
 * written authorization of Anand Automotive Private Limited and its licensors, if any.
 * *******************************************************************************************
 * Author - Anand Group India - R S Iyer
 */
package com.anand.act.coaching;

import java.text.ParseException;
import java.text.SimpleDateFormat;
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
public class ACT_Coachee_Report_Service_Impl implements ACT_Coachee_Report_Service {

	@Autowired private ACT_Coachee_Report_Dao actCoacheeReportDao;
	@Autowired private ACT_Coachee_Report_History_Dao actCoacheeReportHistoryDao;
	@Autowired private ACT_Coachee_Report_Action_Dao actCoacheeReportActionDao;
	@Autowired private ACT_Coach_Coachee_Map_Dao actCoachCoacheeMapDao;
	@Autowired private ACT_Coaching_Batch_Dao actCoachingBatchDao;
	@Autowired private ACT_Coachee_Goals_Dao actCoacheeGoalsDao;
	@Autowired private M_User_Dao mUserDao;

	@Override
	public List<ACT_Coachee_Report> getCoacheeReportList(HttpServletRequest request) {
		List<ACT_Coachee_Report> coacheeReportList = new ArrayList<ACT_Coachee_Report>();
		M_User coacheeUserId = mUserDao.findById(Long.parseLong(""+request.getParameter("coachee-id"))).get();
		M_User user = mUserDao.findByUserLoginId(SecurityContextHolder.getContext().getAuthentication().getName());
		ACT_Coaching_Batch coachingBatch = actCoachingBatchDao.findById(Long.parseLong(""+request.getParameter("batch-id"))).get();
		List<ACT_Coach_Coachee_Map> coachCoacheeMap = actCoachCoacheeMapDao.findByCoachCoacheeMappingSetAndCoacheeUserId(coachingBatch, coacheeUserId);
		List<ACT_Coachee_Report> tempCoachingReportList = new ArrayList<ACT_Coachee_Report>();
		try {
			System.out.println(request.getParameter("coachee-id")+" --- ");
			for(ACT_Coach_Coachee_Map currCoachCoacheeMap : coachCoacheeMap) {
				tempCoachingReportList = actCoacheeReportDao.findByCoacheeReportSet(currCoachCoacheeMap);
			}
			Integer activenessCheck = 1;
			for(ACT_Coachee_Report report : tempCoachingReportList) {
				if(report.getReportStatus().compareTo(1) == 0) {
					if((request.getSession(true).getAttribute("ctAdmin") != null && 
							activenessCheck.compareTo(Integer.parseInt(""+request.getSession(true).getAttribute("ctAdmin"))) == 0) || 
						(request.getSession(true).getAttribute("itAdmin") != null && 
						activenessCheck.compareTo(Integer.parseInt(""+request.getSession(true).getAttribute("itAdmin"))) == 0) || 
						(report.getCoacheeReportSet().getCoachUserId().getmUserId().compareTo(user.getmUserId()) == 0)) {
						report.setActionForCoachingReport("<a href='#' title='Edit Report' onclick='editReportCoach("+report.getActCoacheeReportId()+");'><i class='fas fa-edit'></i></a>");
					} else if(report.getCoacheeReportSet().getCoacheeUserId().getmUserId().compareTo(user.getmUserId()) == 0) {
						report.setActionForCoachingReport("<i title='Report Submitted' class='fas fa-edit'></i></a>");
					}
				} else if(report.getReportStatus().compareTo(2) == 0) {
					if((request.getSession(true).getAttribute("ctAdmin") != null && 
							activenessCheck.compareTo(Integer.parseInt(""+request.getSession(true).getAttribute("ctAdmin"))) == 0) || 
						(request.getSession(true).getAttribute("itAdmin") != null && 
						activenessCheck.compareTo(Integer.parseInt(""+request.getSession(true).getAttribute("itAdmin"))) == 0) || 
						(report.getCoacheeReportSet().getCoacheeUserId().getmUserId().compareTo(user.getmUserId()) == 0)) {
						report.setActionForCoachingReport("<a href='#' title='Edit Report' onclick='editReport("+report.getActCoacheeReportId()+");'><i class='fas fa-edit'></i></a>");
					}
				} else {
					report.setActionForCoachingReport("<i title='Report Complete' class='fas fa-check icon-anand-success'></i>");
				}
				if(report.getReasonForNotConducting() == null) {
					report.setReasonForNotConducting("-");
				}
				if(report.getDiscussionAndInputsFromCoach() == null) {
					report.setDiscussionAndInputsFromCoach("-");
				}
				if(report.getCoacheeReportActionList() != null && report.getCoacheeReportActionList().size() != 0) {
					List<ACT_Coachee_Report_Action> tempActionList = new ArrayList<ACT_Coachee_Report_Action>();
					tempActionList.addAll(report.getCoacheeReportActionList());
					report.setCoacheeReportActionTempList(tempActionList);
					tempActionList = null;
				}
				coacheeReportList.add(report);
			}
			Collections.sort(coacheeReportList);
		} catch(Exception e) {
			e.printStackTrace();
			coacheeReportList.clear();
			coacheeReportList = null;
		}
		tempCoachingReportList.clear(); tempCoachingReportList = null; user = null;
		coacheeUserId = null; coachingBatch = null; coachCoacheeMap = null;
		return coacheeReportList;
	}

	@Override
	@Transactional
	public String saveCoacheeReportDetails(HttpServletRequest request, ACT_Coach_Coachee_Map actCoachCoacheeMap) throws ParseException {
		StringBuilder response = new StringBuilder();
		M_User user = mUserDao.findByUserLoginId(SecurityContextHolder.getContext().getAuthentication().getName());
		Date currDate = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		Date sessionDate = dateFormat.parse(actCoachCoacheeMap.getCoacheeReportTemp().getSessionDateString());
		ACT_Coach_Coachee_Map currActCoachCoacheeMap = actCoachCoacheeMapDao.findById(actCoachCoacheeMap.getCoacheeReportTemp().getActCoachCoacheeMapId()).get();
		List<ACT_Coachee_Report> sessionDateReportCheck = actCoacheeReportDao.findBySessionDateAndCoacheeReportSet(sessionDate, currActCoachCoacheeMap);
		if(sessionDateReportCheck != null && sessionDateReportCheck.size() != 0) {
			for(ACT_Coachee_Report coacheeReport : sessionDateReportCheck) {
				
				ACT_Coachee_Report_History coacheeReportHistory = new ACT_Coachee_Report_History();
				coacheeReportHistory.setActCoacheeReport(coacheeReport);
				coacheeReportHistory.setCoacheeReportSet(coacheeReport.getCoacheeReportSet());
				coacheeReportHistory.setSessionDate(coacheeReport.getSessionDate());
				coacheeReportHistory.setMeetingConductedStatus(coacheeReport.getMeetingConductedStatus());
				coacheeReportHistory.setReportStatus(coacheeReport.getReportStatus());
				coacheeReportHistory.setReportStatus(coacheeReport.getReportStatus());
				coacheeReportHistory.setReasonForNotConducting(coacheeReport.getReasonForNotConducting());
				coacheeReportHistory.setCoacheeAdditionalComments(coacheeReport.getCoacheeAdditionalComments());
				coacheeReportHistory.setDiscussionAndInputsFromCoach(coacheeReport.getDiscussionAndInputsFromCoach());
				coacheeReportHistory.setReportActive(coacheeReport.getReportActive());
				coacheeReportHistory.setmUserId(user);
				if(coacheeReport.getUpdatedOn() != null) {
					coacheeReportHistory.setCreatedOn(coacheeReport.getUpdatedOn());
				} else {
					coacheeReportHistory.setCreatedOn(currDate);
				}
				actCoacheeReportHistoryDao.save(coacheeReportHistory);
				coacheeReportHistory = null;
				
				coacheeReport.setMeetingConductedStatus(actCoachCoacheeMap.getCoacheeReportTemp().getMeetingConductedStatus());
				coacheeReport.setReportStatus(actCoachCoacheeMap.getCoacheeReportTemp().getReportStatus());
				if(actCoachCoacheeMap.getCoacheeReportTemp().getMeetingConductedStatus().compareTo(1) == 0) {
					coacheeReport.setReasonForNotConducting(null);
					coacheeReport.setCoacheeAdditionalComments(actCoachCoacheeMap.getCoacheeReportTemp().getCoacheeAdditionalComments().replace( "^\\s*$" , "\n"));
					coacheeReport.setDiscussionAndInputsFromCoach(actCoachCoacheeMap.getCoacheeReportTemp().getDiscussionAndInputsFromCoach().replace( "^\\s*$" , "\n"));
				} else {
					coacheeReport.setReasonForNotConducting(actCoachCoacheeMap.getCoacheeReportTemp().getReasonForNotConducting().replace( "^\\s*$" , "\n"));
					coacheeReport.setCoacheeAdditionalComments(null);
					coacheeReport.setDiscussionAndInputsFromCoach(null);
				}
				coacheeReport.setmUserIdUpdated(user);
				coacheeReport.setUpdatedOn(currDate);
				actCoacheeReportDao.save(coacheeReport);
				
				for(ACT_Coachee_Report_Action coacheeGoalReportAction : coacheeReport.getCoacheeReportActionList()) {
					coacheeGoalReportAction.setReportActionActive(0);
					actCoacheeReportActionDao.save(coacheeGoalReportAction);
				}
				
				for(ACT_Coachee_Report_Action coacheeGoalReportAction : actCoachCoacheeMap.getCoacheeReportTemp().getCoacheeReportActionTempList()) {
					if(coacheeGoalReportAction.getReportActionActive().compareTo(1) == 0) {
						ACT_Coachee_Report_Action goalReportAction;
						if(coacheeGoalReportAction.getActCoacheeReportActionId() != null) {
							System.out.println("1 --- ");
							goalReportAction = actCoacheeReportActionDao.findById(coacheeGoalReportAction.getActCoacheeReportActionId()).get();
							goalReportAction.setActCoachCaocheeMapId(goalReportAction.getActCoachCaocheeMapId());
							goalReportAction.setCoacheeReportActionList(goalReportAction.getCoacheeReportActionList());
							goalReportAction.setActCoacheeGoalId(goalReportAction.getActCoacheeGoalId());
							goalReportAction.setGoalAction(goalReportAction.getGoalAction());
							goalReportAction.setmUserIdUpdated(user);
							goalReportAction.setUpdatedOn(currDate);
						} else {
							System.out.println("2 --- ");
							goalReportAction = new ACT_Coachee_Report_Action();
							goalReportAction.setActCoachCaocheeMapId(currActCoachCoacheeMap);
							goalReportAction.setCoacheeReportActionList(coacheeReport);
							goalReportAction.setActCoacheeGoalId(actCoacheeGoalsDao.findById(coacheeGoalReportAction.getActCoacheeGoalId().getActCoacheeGoalsId()).get());
							goalReportAction.setGoalAction(coacheeGoalReportAction.getGoalAction().replace( "^\\s*$" , "\n"));
							goalReportAction.setmUserId(user);
							goalReportAction.setCreatedOn(currDate);
						}
						goalReportAction.setReportActionStatus(1);
						goalReportAction.setReportActionActive(coacheeGoalReportAction.getReportActionActive());
						actCoacheeReportActionDao.save(goalReportAction);
						goalReportAction = null;
					}
				}
			}
			response.append("dateExists");
		} else {
			ACT_Coachee_Report coacheeReport = new ACT_Coachee_Report();
			coacheeReport.setCoacheeReportSet(currActCoachCoacheeMap);
			coacheeReport.setSessionDate(sessionDate);
			coacheeReport.setMeetingConductedStatus(actCoachCoacheeMap.getCoacheeReportTemp().getMeetingConductedStatus());
			coacheeReport.setReportStatus(actCoachCoacheeMap.getCoacheeReportTemp().getReportStatus());
			if(actCoachCoacheeMap.getCoacheeReportTemp().getMeetingConductedStatus().compareTo(1) == 0) {
				coacheeReport.setReasonForNotConducting(null);
				coacheeReport.setCoacheeAdditionalComments(actCoachCoacheeMap.getCoacheeReportTemp().getCoacheeAdditionalComments().replace( "^\\s*$" , "\n"));
				coacheeReport.setDiscussionAndInputsFromCoach(actCoachCoacheeMap.getCoacheeReportTemp().getDiscussionAndInputsFromCoach().replace( "^\\s*$" , "\n"));
			} else {
				coacheeReport.setReasonForNotConducting(actCoachCoacheeMap.getCoacheeReportTemp().getReasonForNotConducting().replace( "^\\s*$" , "\n"));
				coacheeReport.setCoacheeAdditionalComments(null);
				coacheeReport.setDiscussionAndInputsFromCoach(null);
			}
			coacheeReport.setReportActive(1);
			coacheeReport.setmUserId(user);
			coacheeReport.setCreatedOn(currDate);
			actCoacheeReportDao.save(coacheeReport);
			
			for(ACT_Coachee_Report_Action coacheeGoalReportAction : actCoachCoacheeMap.getCoacheeReportTemp().getCoacheeReportActionTempList()) {
				if(coacheeGoalReportAction.getReportActionActive().compareTo(1) == 0) {
					ACT_Coachee_Report_Action goalReportAction = new ACT_Coachee_Report_Action();
					goalReportAction.setActCoachCaocheeMapId(currActCoachCoacheeMap);
					goalReportAction.setCoacheeReportActionList(coacheeReport);
					goalReportAction.setActCoacheeGoalId(actCoacheeGoalsDao.findById(coacheeGoalReportAction.getActCoacheeGoalId().getActCoacheeGoalsId()).get());
					goalReportAction.setGoalAction(coacheeGoalReportAction.getGoalAction().replace( "^\\s*$" , "\n"));
					goalReportAction.setReportActionStatus(1);
					goalReportAction.setmUserId(user);
					goalReportAction.setCreatedOn(currDate);
					goalReportAction.setReportActionActive(coacheeGoalReportAction.getReportActionActive());
					actCoacheeReportActionDao.save(goalReportAction);
					goalReportAction = null;
				}
			}
			
			coacheeReport = null;
			response.append("add");
		}
		currActCoachCoacheeMap = null;
		sessionDate = null; dateFormat = null;
		
		currDate = null; user = null;
		return response.toString();
	}

	@Override
	@Transactional
	public String saveCoacheeReportCoachDetails(HttpServletRequest request, ACT_Coach_Coachee_Map actCoachCoacheeMap) throws ParseException {
		M_User user = mUserDao.findByUserLoginId(SecurityContextHolder.getContext().getAuthentication().getName());
		Date currDate = new Date();
		ACT_Coachee_Report coacheeReport = actCoacheeReportDao.findById(actCoachCoacheeMap.getCoacheeReportTemp().getActCoacheeReportId()).get();
		
		ACT_Coachee_Report_History coacheeReportHistory = new ACT_Coachee_Report_History();
		coacheeReportHistory.setActCoacheeReport(coacheeReport);
		coacheeReportHistory.setCoacheeReportSet(coacheeReport.getCoacheeReportSet());
		coacheeReportHistory.setSessionDate(coacheeReport.getSessionDate());
		coacheeReportHistory.setMeetingConductedStatus(coacheeReport.getMeetingConductedStatus());
		coacheeReportHistory.setReportStatus(coacheeReport.getReportStatus());
		coacheeReportHistory.setReportStatus(coacheeReport.getReportStatus());
		coacheeReportHistory.setReasonForNotConducting(coacheeReport.getReasonForNotConducting());
		coacheeReportHistory.setCoacheeAdditionalComments(coacheeReport.getCoacheeAdditionalComments());
		coacheeReportHistory.setDiscussionAndInputsFromCoach(coacheeReport.getDiscussionAndInputsFromCoach());
		coacheeReportHistory.setCoachAdditionalComments(coacheeReport.getCoachAdditionalComments());
		coacheeReportHistory.setAnyConcernOrObservation(coacheeReport.getAnyConcernOrObservation());
		coacheeReportHistory.setCoachReasonForNotConducting(coacheeReport.getCoachReasonForNotConducting());
		coacheeReportHistory.setReportActive(coacheeReport.getReportActive());
		coacheeReportHistory.setmUserId(user);
		if(coacheeReport.getUpdatedOn() != null) {
			coacheeReportHistory.setCreatedOn(coacheeReport.getUpdatedOn());
		} else {
			coacheeReportHistory.setCreatedOn(currDate);
		}
		actCoacheeReportHistoryDao.save(coacheeReportHistory);
		coacheeReportHistory = null;
		
		if(coacheeReport.getMeetingConductedStatus() != null && coacheeReport.getMeetingConductedStatus().compareTo(1) == 0) {
			coacheeReport.setCoachAdditionalComments(actCoachCoacheeMap.getCoacheeReportTemp().getCoachAdditionalComments().replace( "^\\s*$" , "\n"));
			if(actCoachCoacheeMap.getCoacheeReportTemp().getAnyConcernOrObservation() != null && !actCoachCoacheeMap.getCoacheeReportTemp().getAnyConcernOrObservation().isEmpty()) {
				coacheeReport.setAnyConcernOrObservation(actCoachCoacheeMap.getCoacheeReportTemp().getAnyConcernOrObservation().replace( "^\\s*$" , "\n"));
			}
		} else if(coacheeReport.getMeetingConductedStatus() != null && coacheeReport.getMeetingConductedStatus().compareTo(2) == 0) {
			coacheeReport.setCoachReasonForNotConducting(actCoachCoacheeMap.getCoacheeReportTemp().getCoachReasonForNotConducting().replace( "^\\s*$" , "\n"));
		}
		coacheeReport.setReportStatus(3);
		coacheeReport.setmUserIdUpdated(user);
		coacheeReport.setUpdatedOn(currDate);
		actCoacheeReportDao.save(coacheeReport);
		coacheeReport = null; currDate = null; user = null;
		return "done";
	}

	@Override
	public String getCoacheeReportDetails(HttpServletRequest request) {
		StringBuilder response = new StringBuilder();
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		Map<String, String> reportDetails = new HashMap<String, String>();
		try {
			ACT_Coachee_Report coacheeReport = actCoacheeReportDao.findById(Long.parseLong(""+request.getParameter("actCoacheeReportId"))).get();
			reportDetails.put("sessionDate", dateFormat.format(coacheeReport.getSessionDate()));
			reportDetails.put("meetingStatus", ""+coacheeReport.getMeetingConductedStatus());
			reportDetails.put("reportStatus", ""+coacheeReport.getReportStatus());
			reportDetails.put("reasonForNotConducting", "");
			if(coacheeReport.getReasonForNotConducting() != null && !coacheeReport.getReasonForNotConducting().isEmpty()) {
				System.out.println(coacheeReport.getReasonForNotConducting());
				reportDetails.put("reasonForNotConducting", coacheeReport.getReasonForNotConducting());
			}
			reportDetails.put("discussionAndInputsFromCoach", "");
			if(coacheeReport.getDiscussionAndInputsFromCoach() != null && !coacheeReport.getDiscussionAndInputsFromCoach().isEmpty()) {
				reportDetails.put("discussionAndInputsFromCoach", coacheeReport.getDiscussionAndInputsFromCoach());
			}
			reportDetails.put("additionalCommentsByCoachee", "");
			if(coacheeReport.getCoacheeAdditionalComments() != null && !coacheeReport.getCoacheeAdditionalComments().isEmpty()) {
				reportDetails.put("additionalCommentsByCoachee", coacheeReport.getCoacheeAdditionalComments());
			}
			reportDetails.put("additionalCommentsByCoach", "");
			if(coacheeReport.getCoachAdditionalComments() != null && !coacheeReport.getCoachAdditionalComments().isEmpty()) {
				reportDetails.put("additionalCommentsByCoach", coacheeReport.getCoachAdditionalComments());
			}
			reportDetails.put("anyConcernOrObservation", "");
			if(coacheeReport.getAnyConcernOrObservation() != null && !coacheeReport.getAnyConcernOrObservation().isEmpty()) {
				reportDetails.put("anyConcernOrObservation", coacheeReport.getAnyConcernOrObservation());
			}
			reportDetails.put("coachCoacheeMappingId", ""+coacheeReport.getCoacheeReportSet().getActCoachCoacheeMapId());
			Gson gson = new Gson();
			response.append(gson.toJson(reportDetails));
			gson = null; coacheeReport = null;
		} catch(Exception e) {
			e.printStackTrace();
			response.setLength(0);
			response.append("error");
		}
		dateFormat = null; reportDetails = null;
		return response.toString();
	}

	@Override
	public List<ACT_Coachee_Report_Action> getCoacheeGoalActionList(HttpServletRequest request) {
		
		List<ACT_Coachee_Report_Action> coacheeReportActionList = new ArrayList<ACT_Coachee_Report_Action>();
		M_User coacheeUserId = mUserDao.findById(Long.parseLong(""+request.getParameter("coachee-id"))).get();
		ACT_Coaching_Batch coachingBatch = actCoachingBatchDao.findById(Long.parseLong(""+request.getParameter("batch-id"))).get();
		List<ACT_Coach_Coachee_Map> coachCoacheeMap = actCoachCoacheeMapDao.findByCoachCoacheeMappingSetAndCoacheeUserId(coachingBatch, coacheeUserId);
		List<ACT_Coachee_Report_Action> tempCoachingReportActionList = new ArrayList<ACT_Coachee_Report_Action>();
		try {
			System.out.println(request.getParameter("coachee-id")+" --- ");
			for(ACT_Coach_Coachee_Map currCoachCoacheeMap : coachCoacheeMap) {
				tempCoachingReportActionList = actCoacheeReportActionDao.findByActCoachCaocheeMapId(currCoachCoacheeMap);
			}
			for(ACT_Coachee_Report_Action reportAction : tempCoachingReportActionList) {
				if(reportAction.getReportActionActive().compareTo(1) == 0) {
					coacheeReportActionList.add(reportAction);
				}
			}
			Collections.sort(coacheeReportActionList);
		} catch(Exception e) {
			e.printStackTrace();
			coacheeReportActionList.clear();
			coacheeReportActionList = null;
		}
		tempCoachingReportActionList.clear(); tempCoachingReportActionList = null;
		coacheeUserId = null; coachingBatch = null; coachCoacheeMap = null;
		return coacheeReportActionList;
	}
}