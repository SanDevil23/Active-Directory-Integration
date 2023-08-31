/**
 * *******************************************************************************************
 * Copyright © 2021 Anand Group India. All rights reserved.
 * No part of this product may be reproduced in any form by any means without prior
 * written authorization of Anand Automotive Private Limited and its licensors, if any.
 * *******************************************************************************************
 * Author - Anand Group India - R S Iyer
 */
package com.anand.ijp;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.anand.masters.M_Department_Dao;
import com.anand.masters.M_Designation_Dao;
import com.anand.masters.M_Entity_Dao;
import com.anand.masters.M_Level_Dao;
import com.anand.masters.M_User;
import com.anand.masters.M_User_Dao;

@Service
public class Job_Posting_Service_Impl implements Job_Posting_Service {

	@Autowired private Job_Posting_Dao jobPostingDao;
	@Autowired private Job_Posting_History_Dao jobPostingHistoryDao;
	@Autowired private M_User_Dao mUserDao;
	@Autowired private M_Entity_Dao mEntityDao;
	@Autowired private M_Department_Dao mDepartmentDao;
	@Autowired private M_Designation_Dao mDesignationDao;
	@Autowired private M_Level_Dao mLevelDao;

	private String jobStatusString(Integer jobStatus) {
		//1-Save, 2-Approval Waiting, 3-On-Hold, 4-Open, 5-Closed, 6-Rejected
		if(jobStatus.compareTo(1) == 0) {
			return "Saved";
		} else if(jobStatus.compareTo(2) == 0) {
			return "Approval Pending";
		} else if(jobStatus.compareTo(3) == 0) {
			return "On-Hold";
		} else if(jobStatus.compareTo(4) == 0) {
			return "Open";
		} else if(jobStatus.compareTo(5) == 0) {
			return "Closed";
		} else if(jobStatus.compareTo(6) == 0) {
			return "Rejected";
		} else {
			return "-";
		}
	}

	private String jobAction(HttpServletRequest request, Integer jobStatus) {
		//1-Save, 2-Approval Waiting, 3-On-Hold, 4-Open, 5-Closed, 6-Rejected
		/*if(jobStatus.compareTo(1) == 0) {
			return "Saved";
		} else if(jobStatus.compareTo(2) == 0) {
			return "Approval Pending";
		} else if(jobStatus.compareTo(3) == 0) {
			return "On-Hold";
		} else if(jobStatus.compareTo(4) == 0) {
			return "Open";
		} else if(jobStatus.compareTo(5) == 0) {
			return "Closed";
		} else if(jobStatus.compareTo(6) == 0) {
			return "Rejected";
		} else {
			return "-";
		}*/
		return "";
	}

	@Override
	public List<Job_Posting> getJobsListOpenForEmployees(HttpServletRequest request) {
		List<Job_Posting> jobPostingListFinal = new ArrayList<Job_Posting>();
		List<Job_Posting> jobPostingList = new ArrayList<Job_Posting>();
		try {
			jobPostingList = jobPostingDao.findByLastApplicationDateNotNullAndActiveAndJobStatus(1, 4);
			for(Job_Posting jobPosting : jobPostingList) {
				jobPosting.setStatusString(jobStatusString(jobPosting.getJobStatus()));
				jobPostingListFinal.add(jobPosting);
			}
			Collections.sort(jobPostingListFinal);
		} catch(Exception e) {
			e.printStackTrace();
			jobPostingList.clear(); jobPostingList = null;
			jobPostingListFinal.clear(); jobPostingListFinal = null;
		}
		return jobPostingListFinal;
	}

	@Override
	public List<Job_Posting> getactiveJobsList(HttpServletRequest request, Integer offset) {
		List<Job_Posting> jobPostingListFinal = new ArrayList<Job_Posting>();
		List<Job_Posting> jobPostingList = new ArrayList<Job_Posting>();
		try {
			jobPostingList = jobPostingDao.getJobPostingListWiOffset(offset);
			for(Job_Posting jobPosting : jobPostingList) {
				jobPosting.setStatusString(jobStatusString(jobPosting.getJobStatus()));
				jobPostingListFinal.add(jobPosting);
			}
			Collections.sort(jobPostingListFinal);
		} catch(Exception e) {
			e.printStackTrace();
			jobPostingList.clear(); jobPostingList = null;
			jobPostingListFinal.clear(); jobPostingListFinal = null;
		}
		return jobPostingListFinal;
	}

	@Override
	@Transactional
	public String saveJobPostingDetails(HttpServletRequest request, Job_Posting jobPosting) {
		StringBuilder response = new StringBuilder();
		M_User currUser = mUserDao.findByUserLoginId(SecurityContextHolder.getContext().getAuthentication().getName());
		Date currDate = new Date();
		if(jobPosting.getJobPostingId() != null) {
			System.out.println(jobPosting.getManpowerRequisitioNo()+" - - - ");
			List<Job_Posting> existingManpowerRequisitionNo = jobPostingDao.findByManpowerRequisitioNoAndActiveAndJobPostingIdNot(jobPosting.getManpowerRequisitioNo(), 1, jobPosting.getJobPostingId());
			System.out.println(existingManpowerRequisitionNo.size()+" - - - ");
			if(existingManpowerRequisitionNo != null && existingManpowerRequisitionNo.size() > 0) {
				response.append("manpowerRequisitionIdMatch");
			} else {
				Job_Posting currJobPosting = jobPostingDao.findById(jobPosting.getJobPostingId()).get();
				Job_Posting_History jobPostingHistory = new Job_Posting_History();
				jobPostingHistory.setJobPostingHistory(currJobPosting);
				if(currJobPosting.getIjpNumber() != null) {
					jobPostingHistory.setIjpNumber(currJobPosting.getIjpNumber());
					jobPostingHistory.setLastApplicationDate(currJobPosting.getLastApplicationDate());
				}
				jobPostingHistory.setJobStatus(currJobPosting.getJobStatus());
				jobPostingHistory.setmEntityId(currJobPosting.getmEntityId());
				jobPostingHistory.setmDepartmentId(currJobPosting.getmDepartmentId());
				jobPostingHistory.setmDesignationId(currJobPosting.getmDesignationId());
				jobPostingHistory.setmLevelId(currJobPosting.getmLevelId());
				jobPostingHistory.setQualification(currJobPosting.getQualification());
				jobPostingHistory.setManpowerRequisitioNo(currJobPosting.getManpowerRequisitioNo());
				jobPostingHistory.setJobPurpose(currJobPosting.getJobPurpose());
				jobPostingHistory.setJobDuties(currJobPosting.getJobDuties());
				jobPostingHistory.setMinExp(currJobPosting.getMinExp());
				jobPostingHistory.setMaxExp(currJobPosting.getMaxExp());
				jobPostingHistory.setSkillSet(currJobPosting.getSkillSet());
				jobPostingHistory.setOtherPreRequisite(currJobPosting.getOtherPreRequisite());
				jobPostingHistory.setmUserId(currUser);
				jobPostingHistory.setCreatedOn(currDate);
				jobPostingHistory.setActive(1);
				jobPostingHistoryDao.save(jobPostingHistory);

				currJobPosting.setJobStatus(jobPosting.getJobStatus());
				currJobPosting.setmEntityId(mEntityDao.findById(jobPosting.getEntityTempId()).get());
				currJobPosting.setmDepartmentId(mDepartmentDao.findById(jobPosting.getDepartmentIdTempId()).get());
				currJobPosting.setmDesignationId(mDesignationDao.findById(jobPosting.getDesignationIdTempId()).get());
				currJobPosting.setmLevelId(mLevelDao.findById(jobPosting.getLevelTempId()).get());
				currJobPosting.setQualification(jobPosting.getEducationTempIds());
				currJobPosting.setManpowerRequisitioNo(jobPosting.getManpowerRequisitioNo());
				currJobPosting.setJobPurpose(jobPosting.getJobPurpose());
				currJobPosting.setJobDuties(jobPosting.getJobDuties());
				currJobPosting.setMinExp(jobPosting.getMinExp());
				currJobPosting.setMaxExp(jobPosting.getMaxExp());
				currJobPosting.setSkillSet(jobPosting.getSkillSet());
				currJobPosting.setOtherPreRequisite(jobPosting.getOtherPreRequisite());
				currJobPosting.setUpdatedOn(currDate);
				currJobPosting.setmUserUpdatedBy(currUser);
				jobPostingDao.save(currJobPosting);
								
				jobPostingHistory = null;
				currJobPosting = null;
				response.append("edit");
			}
		} else {
			System.out.println(jobPosting.getManpowerRequisitioNo()+" - - - ");
			List<Job_Posting> existingManpowerRequisitionNo = jobPostingDao.findByManpowerRequisitioNoAndActive(jobPosting.getManpowerRequisitioNo(), 1);
			System.out.println(existingManpowerRequisitionNo.size()+" - - - ");
			if(existingManpowerRequisitionNo != null && existingManpowerRequisitionNo.size() > 0) {
				response.append("manpowerRequisitionIdMatch");
			} else {
				jobPosting.setmEntityId(mEntityDao.findById(jobPosting.getEntityTempId()).get());
				jobPosting.setmDepartmentId(mDepartmentDao.findById(jobPosting.getDepartmentIdTempId()).get());
				jobPosting.setmDesignationId(mDesignationDao.findById(jobPosting.getDesignationIdTempId()).get());
				jobPosting.setmLevelId(mLevelDao.findById(jobPosting.getLevelTempId()).get());
				jobPosting.setQualification(jobPosting.getEducationTempIds());
				jobPosting.setmUserId(currUser);
				jobPosting.setCreatedOn(currDate);
				jobPosting.setActive(1);
				jobPostingDao.save(jobPosting);
				response.append("add");
			}
		}
		response.append("done");
		currDate = null; currUser = null;
		return response.toString();
	}

	@Override
	public Job_Posting getJobPostingDetails(HttpServletRequest request) {
		try {
			Job_Posting jobPosting = jobPostingDao.findById(Long.parseLong(""+request.getParameter("job-id"))).get();
			jobPosting.setEntityTempId(jobPosting.getmEntityId().getmEntityId());
			jobPosting.setDepartmentIdTempId(jobPosting.getmDepartmentId().getmDepartmentId());
			jobPosting.setDesignationIdTempId(jobPosting.getmDesignationId().getmDesignationId());
			jobPosting.setLevelTempId(jobPosting.getmLevelId().getmLevelId());
			jobPosting.setEducationTempIds(jobPosting.getQualification());
			return jobPosting;
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}