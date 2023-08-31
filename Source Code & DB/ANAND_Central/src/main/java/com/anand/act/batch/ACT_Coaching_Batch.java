/**
 * *******************************************************************************************
 * Copyright © 2021 Anand Group India. All rights reserved.
 * No part of this product may be reproduced in any form by any means without prior
 * written authorization of Anand Automotive Private Limited and its licensors, if any.
 * *******************************************************************************************
 * Author - Anand Group India - R S Iyer
 */
package com.anand.act.batch;

import java.util.Date;
import java.util.List;
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

import com.anand.masters.M_User;

@Entity
@Table(name = "act_coaching_batch")
public class ACT_Coaching_Batch implements Comparable<ACT_Coaching_Batch> {

	@Override
	public int compareTo(ACT_Coaching_Batch role) {
		return Integer.parseInt(""+role.getActCoachingBatchId()) - Integer.parseInt(""+this.actCoachingBatchId);
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "act_coaching_batch_id",unique = true, nullable = false)
    private Long actCoachingBatchId;

	@Column(name = "batch_name")
    private String batchName;

	@Column(name = "batch_description")
    private String batchDescription;

	@Column(name = "batch_start_date")
    private Date batchStartDate;

	@Column(name = "batch_end_date")
    private Date batchEndDate;

	@Column(name = "batch_active")
    private Integer batchActive;//0-In-Active 1-Active

	@OneToOne
    @JoinColumn(name = "m_user_id", nullable = true)
	private M_User mUserId;

	@Column(name = "created_on")
    private Date createdOn;

	@OneToOne
    @JoinColumn(name = "m_user_id_updated", nullable = true)
	private M_User mUserIdUpdated;

	@Column(name = "updated_on")
    private Date updatedOn;

	public Long getActCoachingBatchId() {
		return actCoachingBatchId;
	}

	public void setActCoachingBatchId(Long actCoachingBatchId) {
		this.actCoachingBatchId = actCoachingBatchId;
	}

	public String getBatchName() {
		return batchName;
	}

	public void setBatchName(String batchName) {
		this.batchName = batchName;
	}

	public String getBatchDescription() {
		return batchDescription;
	}

	public void setBatchDescription(String batchDescription) {
		this.batchDescription = batchDescription;
	}

	public Date getBatchStartDate() {
		return batchStartDate;
	}

	public void setBatchStartDate(Date batchStartDate) {
		this.batchStartDate = batchStartDate;
	}

	public Date getBatchEndDate() {
		return batchEndDate;
	}

	public void setBatchEndDate(Date batchEndDate) {
		this.batchEndDate = batchEndDate;
	}

	public Integer getBatchActive() {
		return batchActive;
	}

	public void setBatchActive(Integer batchActive) {
		this.batchActive = batchActive;
	}

	public M_User getmUserId() {
		return mUserId;
	}

	public void setmUserId(M_User mUserId) {
		this.mUserId = mUserId;
	}

	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}

	public M_User getmUserIdUpdated() {
		return mUserIdUpdated;
	}

	public void setmUserIdUpdated(M_User mUserIdUpdated) {
		this.mUserIdUpdated = mUserIdUpdated;
	}

	public Date getUpdatedOn() {
		return updatedOn;
	}

	public void setUpdatedOn(Date updatedOn) {
		this.updatedOn = updatedOn;
	}

	@OneToMany(mappedBy="coachCoacheeMappingSet")
	private Set<ACT_Coach_Coachee_Map> coachCoacheeMappingSet;

	public Set<ACT_Coach_Coachee_Map> getCoachCoacheeMappingSet() {
		return coachCoacheeMappingSet;
	}

	public void setCoachCoacheeMappingSet(Set<ACT_Coach_Coachee_Map> coachCoacheeMappingSet) {
		this.coachCoacheeMappingSet = coachCoacheeMappingSet;
	}

	@Transient private String actionForList;

	public String getActionForList() {
		return actionForList;
	}

	public void setActionForList(String actionForList) {
		this.actionForList = actionForList;
	}

	@Transient private String startDateTemp;
	@Transient private String endDateTemp;
	@Transient private List<ACT_Coach_Coachee_Map> coachCoacheeMappingList;
	@Transient private Integer totalParticipants;
	@Transient private Integer anandMenteeCount;
	@Transient private Integer anandTalentCount;
	@Transient private Integer anandLeaderCount;

	public String getStartDateTemp() {
		return startDateTemp;
	}

	public void setStartDateTemp(String startDateTemp) {
		this.startDateTemp = startDateTemp;
	}

	public String getEndDateTemp() {
		return endDateTemp;
	}

	public void setEndDateTemp(String endDateTemp) {
		this.endDateTemp = endDateTemp;
	}

	public List<ACT_Coach_Coachee_Map> getCoachCoacheeMappingList() {
		return coachCoacheeMappingList;
	}

	public void setCoachCoacheeMappingList(List<ACT_Coach_Coachee_Map> coachCoacheeMappingList) {
		this.coachCoacheeMappingList = coachCoacheeMappingList;
	}

	public Integer getTotalParticipants() {
		return totalParticipants;
	}

	public void setTotalParticipants(Integer totalParticipants) {
		this.totalParticipants = totalParticipants;
	}

	public Integer getAnandMenteeCount() {
		return anandMenteeCount;
	}

	public void setAnandMenteeCount(Integer anandMenteeCount) {
		this.anandMenteeCount = anandMenteeCount;
	}

	public Integer getAnandTalentCount() {
		return anandTalentCount;
	}

	public void setAnandTalentCount(Integer anandTalentCount) {
		this.anandTalentCount = anandTalentCount;
	}

	public Integer getAnandLeaderCount() {
		return anandLeaderCount;
	}

	public void setAnandLeaderCount(Integer anandLeaderCount) {
		this.anandLeaderCount = anandLeaderCount;
	}
}