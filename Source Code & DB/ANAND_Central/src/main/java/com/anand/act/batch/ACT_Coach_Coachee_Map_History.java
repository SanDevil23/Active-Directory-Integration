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

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.anand.masters.M_User;

@Entity
@Table(name = "act_coach_coachee_map_history")
public class ACT_Coach_Coachee_Map_History implements Comparable<ACT_Coach_Coachee_Map_History> {

	@Override
	public int compareTo(ACT_Coach_Coachee_Map_History coachCoacheeMapping) {
		return Integer.parseInt(""+coachCoacheeMapping.getActCoachCoacheeMapHistoryId()) - Integer.parseInt(""+this.actCoachCoacheeMapHistoryId);
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "act_coach_coachee_map_history_id",unique = true, nullable = false)
    private Long actCoachCoacheeMapHistoryId;

	@ManyToOne	
    @JoinColumn(name = "act_coaching_batch_history_id", nullable = true)
	private ACT_Coaching_Batch_History coachCoacheeMappingHistorySet;

	@OneToOne
    @JoinColumn(name = "coach_user_id", nullable = true)
	private M_User coachUserId;

	@OneToOne
    @JoinColumn(name = "coachee_user_id", nullable = true)
	private M_User coacheeUserId;

	@OneToOne
    @JoinColumn(name = "supervisor_user_id", nullable = true)
	private M_User supervisorUserId;

	@Column(name = "act_coachee_program")
    private Integer actCoacheeProgram;//1-ANAND Mentee, 2-ANAND Talent, 3-ANAND Leader

	@Column(name = "act_coach_coachee_map_history_active")
    private Integer actCoachCoacheeMapHistoryActive;//0-In-Active 1-Active

	@OneToOne
    @JoinColumn(name = "act_coach_coachee_map_history_created_by", nullable = true)
	private M_User actCoachCoacheeMapHistoryCreatedBy;

	@Column(name = "created_on")
    private Date createdOn;

	public Long getActCoachCoacheeMapHistoryId() {
		return actCoachCoacheeMapHistoryId;
	}

	public void setActCoachCoacheeMapHistoryId(Long actCoachCoacheeMapHistoryId) {
		this.actCoachCoacheeMapHistoryId = actCoachCoacheeMapHistoryId;
	}

	public ACT_Coaching_Batch_History getCoachCoacheeMappingHistorySet() {
		return coachCoacheeMappingHistorySet;
	}

	public void setCoachCoacheeMappingHistorySet(ACT_Coaching_Batch_History coachCoacheeMappingHistorySet) {
		this.coachCoacheeMappingHistorySet = coachCoacheeMappingHistorySet;
	}

	public M_User getCoachUserId() {
		return coachUserId;
	}

	public void setCoachUserId(M_User coachUserId) {
		this.coachUserId = coachUserId;
	}

	public M_User getCoacheeUserId() {
		return coacheeUserId;
	}

	public void setCoacheeUserId(M_User coacheeUserId) {
		this.coacheeUserId = coacheeUserId;
	}

	public M_User getSupervisorUserId() {
		return supervisorUserId;
	}

	public void setSupervisorUserId(M_User supervisorUserId) {
		this.supervisorUserId = supervisorUserId;
	}

	public Integer getActCoacheeProgram() {
		return actCoacheeProgram;
	}

	public void setActCoacheeProgram(Integer actCoacheeProgram) {
		this.actCoacheeProgram = actCoacheeProgram;
	}

	public Integer getActCoachCoacheeMapHistoryActive() {
		return actCoachCoacheeMapHistoryActive;
	}

	public void setActCoachCoacheeMapHistoryActive(Integer actCoachCoacheeMapHistoryActive) {
		this.actCoachCoacheeMapHistoryActive = actCoachCoacheeMapHistoryActive;
	}

	public M_User getActCoachCoacheeMapHistoryCreatedBy() {
		return actCoachCoacheeMapHistoryCreatedBy;
	}

	public void setActCoachCoacheeMapHistoryCreatedBy(M_User actCoachCoacheeMapHistoryCreatedBy) {
		this.actCoachCoacheeMapHistoryCreatedBy = actCoachCoacheeMapHistoryCreatedBy;
	}

	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}
}