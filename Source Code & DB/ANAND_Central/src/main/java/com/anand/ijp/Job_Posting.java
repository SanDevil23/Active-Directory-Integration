/**
 * *******************************************************************************************
 * Copyright © 2021 Anand Group India. All rights reserved.
 * No part of this product may be reproduced in any form by any means without prior
 * written authorization of Anand Automotive Private Limited and its licensors, if any.
 * *******************************************************************************************
 * Author - Anand Group India - R S Iyer
 */
package com.anand.ijp;

import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.anand.masters.M_Department;
import com.anand.masters.M_Designation;
import com.anand.masters.M_Entity;
import com.anand.masters.M_Level;
import com.anand.masters.M_User;

@Entity
@Table(name = "ijp_job_posting")
public class Job_Posting implements Comparable<Job_Posting> {

	@Override
	public int compareTo(Job_Posting jobPosting) {
		return Integer.parseInt(""+jobPosting.getJobPostingId()) - Integer.parseInt(""+this.jobPostingId);
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "job_posting_id",unique = true, nullable = false)
    private Long jobPostingId;

	@Column(name = "ijp_number")
    private String ijpNumber;

	@Column(name = "job_status")
    private Integer jobStatus;
	//1-Save, 2-Approval Waiting, 3-On-Hold, 4-Open, 5-Closed, 6-Rejected

	@OneToOne
    @JoinColumn(name = "m_entity_id", nullable = true)
	private M_Entity mEntityId;

	@OneToOne
    @JoinColumn(name = "m_designation_id", nullable = true)
	private M_Designation mDesignationId;

	@OneToOne
    @JoinColumn(name = "m_department_id", nullable = true)
	private M_Department mDepartmentId;

	@OneToOne
    @JoinColumn(name = "m_level_id", nullable = true)
	private M_Level mLevelId;

	@Column(name = "job_purpose")
    private String jobPurpose;

	@Column(name = "job_duties")
    private String jobDuties;

	@Column(name = "min_exp")
    private Integer minExp;

	@Column(name = "max_exp")
    private Integer maxExp;

	@Column(name = "qualification")
    private String qualification;

	@Column(name = "skill_set")
    private String skillSet;

	@Column(name = "other_pre_requisite")
    private String otherPreRequisite;

	@Column(name = "poc_email")
    private String pocEmail;

	@Column(name = "manpower_requisition_no")
    private String manpowerRequisitioNo;

	@Column(name = "created_on")
    private Date createdOn;

	@Column(name = "last_application_date")
    private Date lastApplicationDate;

	@OneToOne
    @JoinColumn(name = "m_user_id", nullable = true)
	private M_User mUserId;

	@Column(name = "updated_on")
    private Date updatedOn;

	@OneToOne
    @JoinColumn(name = "m_user_updated_by", nullable = true)
	private M_User mUserUpdatedBy;

	@Column(name = "active")
    private Integer active;

	@OneToMany(mappedBy="jobPostingHistory")
	private Set<Job_Posting_History> jobPostingHistory;

	public Long getJobPostingId() {
		return jobPostingId;
	}

	public void setJobPostingId(Long jobPostingId) {
		this.jobPostingId = jobPostingId;
	}

	public String getIjpNumber() {
		return ijpNumber;
	}

	public void setIjpNumber(String ijpNumber) {
		this.ijpNumber = ijpNumber;
	}

	public Integer getJobStatus() {
		return jobStatus;
	}

	public void setJobStatus(Integer jobStatus) {
		this.jobStatus = jobStatus;
	}

	public M_Entity getmEntityId() {
		return mEntityId;
	}

	public void setmEntityId(M_Entity mEntityId) {
		this.mEntityId = mEntityId;
	}

	public M_Designation getmDesignationId() {
		return mDesignationId;
	}

	public void setmDesignationId(M_Designation mDesignationId) {
		this.mDesignationId = mDesignationId;
	}

	public M_Department getmDepartmentId() {
		return mDepartmentId;
	}

	public void setmDepartmentId(M_Department mDepartmentId) {
		this.mDepartmentId = mDepartmentId;
	}

	public M_Level getmLevelId() {
		return mLevelId;
	}

	public void setmLevelId(M_Level mLevelId) {
		this.mLevelId = mLevelId;
	}

	public String getJobPurpose() {
		return jobPurpose;
	}

	public void setJobPurpose(String jobPurpose) {
		this.jobPurpose = jobPurpose;
	}

	public String getJobDuties() {
		return jobDuties;
	}

	public void setJobDuties(String jobDuties) {
		this.jobDuties = jobDuties;
	}

	public Integer getMinExp() {
		return minExp;
	}

	public void setMinExp(Integer minExp) {
		this.minExp = minExp;
	}

	public Integer getMaxExp() {
		return maxExp;
	}

	public void setMaxExp(Integer maxExp) {
		this.maxExp = maxExp;
	}

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public String getSkillSet() {
		return skillSet;
	}

	public void setSkillSet(String skillSet) {
		this.skillSet = skillSet;
	}

	public String getOtherPreRequisite() {
		return otherPreRequisite;
	}

	public void setOtherPreRequisite(String otherPreRequisite) {
		this.otherPreRequisite = otherPreRequisite;
	}

	public String getPocEmail() {
		return pocEmail;
	}

	public void setPocEmail(String pocEmail) {
		this.pocEmail = pocEmail;
	}

	public String getManpowerRequisitioNo() {
		return manpowerRequisitioNo;
	}

	public void setManpowerRequisitioNo(String manpowerRequisitioNo) {
		this.manpowerRequisitioNo = manpowerRequisitioNo;
	}

	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}

	public Date getLastApplicationDate() {
		return lastApplicationDate;
	}

	public void setLastApplicationDate(Date lastApplicationDate) {
		this.lastApplicationDate = lastApplicationDate;
	}

	public M_User getmUserId() {
		return mUserId;
	}

	public void setmUserId(M_User mUserId) {
		this.mUserId = mUserId;
	}

	public Date getUpdatedOn() {
		return updatedOn;
	}

	public void setUpdatedOn(Date updatedOn) {
		this.updatedOn = updatedOn;
	}

	public M_User getmUserUpdatedBy() {
		return mUserUpdatedBy;
	}

	public void setmUserUpdatedBy(M_User mUserUpdatedBy) {
		this.mUserUpdatedBy = mUserUpdatedBy;
	}

	public Integer getActive() {
		return active;
	}

	public void setActive(Integer active) {
		this.active = active;
	}

	public Set<Job_Posting_History> getJobPostingHistory() {
		return jobPostingHistory;
	}

	public void setJobPostingHistory(Set<Job_Posting_History> jobPostingHistory) {
		this.jobPostingHistory = jobPostingHistory;
	}

	@Transient private String actionForList;
	public String getActionForList() {
		return actionForList;
	}

	public void setActionForList(String actionForList) {
		this.actionForList = actionForList;
	}

	@Transient private Long entityTempId;
	@Transient private Long departmentIdTempId;
	@Transient private Long designationIdTempId;
	@Transient private Long levelTempId;
	@Transient private String educationTempIds;
	@Transient private String statusString;
	@Transient private String actionForItem;

	public Long getEntityTempId() {
		return entityTempId;
	}

	public void setEntityTempId(Long entityTempId) {
		this.entityTempId = entityTempId;
	}

	public Long getDepartmentIdTempId() {
		return departmentIdTempId;
	}

	public void setDepartmentIdTempId(Long departmentIdTempId) {
		this.departmentIdTempId = departmentIdTempId;
	}

	public Long getDesignationIdTempId() {
		return designationIdTempId;
	}

	public void setDesignationIdTempId(Long designationIdTempId) {
		this.designationIdTempId = designationIdTempId;
	}

	public Long getLevelTempId() {
		return levelTempId;
	}

	public void setLevelTempId(Long levelTempId) {
		this.levelTempId = levelTempId;
	}

	public String getEducationTempIds() {
		return educationTempIds;
	}

	public void setEducationTempIds(String educationTempIds) {
		this.educationTempIds = educationTempIds;
	}

	public String getStatusString() {
		return statusString;
	}

	public void setStatusString(String statusString) {
		this.statusString = statusString;
	}

	public String getActionForItem() {
		return actionForItem;
	}

	public void setActionForItem(String actionForItem) {
		this.actionForItem = actionForItem;
	}
}