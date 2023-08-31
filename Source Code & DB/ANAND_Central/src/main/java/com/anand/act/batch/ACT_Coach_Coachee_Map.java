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
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.anand.act.coaching.ACT_Coachee_Goals;
import com.anand.act.coaching.ACT_Coachee_Report;
import com.anand.masters.M_User;

@Entity
@Table(name = "act_coach_coachee_map")
public class ACT_Coach_Coachee_Map implements Comparable<ACT_Coach_Coachee_Map> {

	@Override
	public int compareTo(ACT_Coach_Coachee_Map coachCoacheeMapping) {
		return Integer.parseInt(""+coachCoacheeMapping.getActCoachCoacheeMapId()) - Integer.parseInt(""+this.actCoachCoacheeMapId);
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "act_coach_coachee_map_id",unique = true, nullable = false)
    private Long actCoachCoacheeMapId;

	@ManyToOne
    @JoinColumn(name = "act_coaching_batch_id", nullable = true)
	private ACT_Coaching_Batch coachCoacheeMappingSet;

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

	@Column(name = "act_coach_coachee_map_active")
    private Integer actCoachCoacheeMapActive;//0-In-Active 1-Active

	@OneToOne
    @JoinColumn(name = "act_coach_coachee_map_created_by", nullable = true)
	private M_User actCoachCoacheeMapCreatedBy;

	@Column(name = "created_on")
    private Date createdOn;

	@OneToOne
    @JoinColumn(name = "act_coach_coachee_map_updated_by", nullable = true)
	private M_User actCoachCoacheeMapUpdatedBy;

	@Column(name = "updated_on")
    private Date updatedOn;

	public Long getActCoachCoacheeMapId() {
		return actCoachCoacheeMapId;
	}

	public void setActCoachCoacheeMapId(Long actCoachCoacheeMapId) {
		this.actCoachCoacheeMapId = actCoachCoacheeMapId;
	}

	public ACT_Coaching_Batch getCoachCoacheeMappingSet() {
		return coachCoacheeMappingSet;
	}

	public void setCoachCoacheeMappingSet(ACT_Coaching_Batch coachCoacheeMappingSet) {
		this.coachCoacheeMappingSet = coachCoacheeMappingSet;
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

	public Integer getActCoachCoacheeMapActive() {
		return actCoachCoacheeMapActive;
	}

	public void setActCoachCoacheeMapActive(Integer actCoachCoacheeMapActive) {
		this.actCoachCoacheeMapActive = actCoachCoacheeMapActive;
	}

	public M_User getActCoachCoacheeMapCreatedBy() {
		return actCoachCoacheeMapCreatedBy;
	}

	public void setActCoachCoacheeMapCreatedBy(M_User actCoachCoacheeMapCreatedBy) {
		this.actCoachCoacheeMapCreatedBy = actCoachCoacheeMapCreatedBy;
	}

	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}

	public M_User getActCoachCoacheeMapUpdatedBy() {
		return actCoachCoacheeMapUpdatedBy;
	}

	public void setActCoachCoacheeMapUpdatedBy(M_User actCoachCoacheeMapUpdatedBy) {
		this.actCoachCoacheeMapUpdatedBy = actCoachCoacheeMapUpdatedBy;
	}

	public Date getUpdatedOn() {
		return updatedOn;
	}

	public void setUpdatedOn(Date updatedOn) {
		this.updatedOn = updatedOn;
	}

	@OneToMany(mappedBy="coacheeGoalsSet")
	private Set<ACT_Coachee_Goals> coacheeGoalsSet;

	public Set<ACT_Coachee_Goals> getCoacheeGoalsSet() {
		return coacheeGoalsSet;
	}

	public void setCoacheeGoalsSet(Set<ACT_Coachee_Goals> coacheeGoalsSet) {
		this.coacheeGoalsSet = coacheeGoalsSet;
	}

	@OneToMany(mappedBy="coacheeReportSet")
	private Set<ACT_Coachee_Report> coacheeReportSet;

	public Set<ACT_Coachee_Report> getCoacheeReportSet() {
		return coacheeReportSet;
	}

	public void setCoacheeReportSet(Set<ACT_Coachee_Report> coacheeReportSet) {
		this.coacheeReportSet = coacheeReportSet;
	}

	@Transient private Long coachIdTemp;
	@Transient private Long coacheeIdTemp;
	@Transient private Long supervisorIdTemp;
	@Transient private ACT_Coachee_Report coacheeReportTemp;

	public Long getCoachIdTemp() {
		return coachIdTemp;
	}

	public void setCoachIdTemp(Long coachIdTemp) {
		this.coachIdTemp = coachIdTemp;
	}

	public Long getCoacheeIdTemp() {
		return coacheeIdTemp;
	}

	public void setCoacheeIdTemp(Long coacheeIdTemp) {
		this.coacheeIdTemp = coacheeIdTemp;
	}

	public Long getSupervisorIdTemp() {
		return supervisorIdTemp;
	}

	public void setSupervisorIdTemp(Long supervisorIdTemp) {
		this.supervisorIdTemp = supervisorIdTemp;
	}

	public ACT_Coachee_Report getCoacheeReportTemp() {
		return coacheeReportTemp;
	}

	public void setCoacheeReportTemp(ACT_Coachee_Report coacheeReportTemp) {
		this.coacheeReportTemp = coacheeReportTemp;
	}
}