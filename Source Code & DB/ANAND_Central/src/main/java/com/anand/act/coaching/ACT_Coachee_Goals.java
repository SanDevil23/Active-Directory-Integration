/**
 * *******************************************************************************************
 * Copyright © 2021 Anand Group India. All rights reserved.
 * No part of this product may be reproduced in any form by any means without prior
 * written authorization of Anand Automotive Private Limited and its licensors, if any.
 * *******************************************************************************************
 * Author - Anand Group India - R S Iyer
 */
package com.anand.act.coaching;

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

import com.anand.act.batch.ACT_Coach_Coachee_Map;
import com.anand.masters.M_User;

@Entity
@Table(name = "act_coachee_goals")
public class ACT_Coachee_Goals implements Comparable<ACT_Coachee_Goals> {

	@Override
	public int compareTo(ACT_Coachee_Goals coachCoacheeMapping) {
		return Integer.parseInt(""+coachCoacheeMapping.getActCoacheeGoalsId()) - Integer.parseInt(""+this.actCoacheeGoalsId);
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "act_coachee_goals_id",unique = true, nullable = false)
    private Long actCoacheeGoalsId;

	@ManyToOne
    @JoinColumn(name = "act_coach_coachee_map_id", nullable = true)
	private ACT_Coach_Coachee_Map coacheeGoalsSet;

	@Column(name = "coaching_goal")
    private String coachingGoal;

	@Column(name = "coaching_goal_description")
    private String coachingGoalDescription;

	@Column(name = "coaching_goal_active")
    private Integer coachingGoalActive;//0-In-Active 1-Active
	
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

	public Long getActCoacheeGoalsId() {
		return actCoacheeGoalsId;
	}

	public void setActCoacheeGoalsId(Long actCoacheeGoalsId) {
		this.actCoacheeGoalsId = actCoacheeGoalsId;
	}

	public ACT_Coach_Coachee_Map getCoacheeGoalsSet() {
		return coacheeGoalsSet;
	}

	public void setCoacheeGoalsSet(ACT_Coach_Coachee_Map coacheeGoalsSet) {
		this.coacheeGoalsSet = coacheeGoalsSet;
	}

	public String getCoachingGoal() {
		return coachingGoal;
	}

	public void setCoachingGoal(String coachingGoal) {
		this.coachingGoal = coachingGoal;
	}

	public String getCoachingGoalDescription() {
		return coachingGoalDescription;
	}

	public void setCoachingGoalDescription(String coachingGoalDescription) {
		this.coachingGoalDescription = coachingGoalDescription;
	}

	public Integer getCoachingGoalActive() {
		return coachingGoalActive;
	}

	public void setCoachingGoalActive(Integer coachingGoalActive) {
		this.coachingGoalActive = coachingGoalActive;
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

	@OneToMany(mappedBy="parentCoachingGoal")
	private Set<ACT_Coachee_Goals_History> parentCoachingGoal;

	public Set<ACT_Coachee_Goals_History> getParentCoachingGoal() {
		return parentCoachingGoal;
	}

	public void setParentCoachingGoal(Set<ACT_Coachee_Goals_History> parentCoachingGoal) {
		this.parentCoachingGoal = parentCoachingGoal;
	}

	@Transient private Long actCoachCoacheeMapId;

	public Long getActCoachCoacheeMapId() {
		return actCoachCoacheeMapId;
	}

	public void setActCoachCoacheeMapId(Long actCoachCoacheeMapId) {
		this.actCoachCoacheeMapId = actCoachCoacheeMapId;
	}

	@Transient private String actionForCoachingGoal;

	public String getActionForCoachingGoal() {
		return actionForCoachingGoal;
	}

	public void setActionForCoachingGoal(String actionForCoachingGoal) {
		this.actionForCoachingGoal = actionForCoachingGoal;
	}
}