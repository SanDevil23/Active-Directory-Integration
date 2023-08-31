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
@Table(name = "act_coachee_goals_history")
public class ACT_Coachee_Goals_History implements Comparable<ACT_Coachee_Goals_History> {

	@Override
	public int compareTo(ACT_Coachee_Goals_History coachCoacheeMapping) {
		return Integer.parseInt(""+coachCoacheeMapping.getActCoacheeGoalsHistoryId()) - Integer.parseInt(""+this.actCoacheeGoalsHistoryId);
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "act_coachee_goals_history_id",unique = true, nullable = false)
    private Long actCoacheeGoalsHistoryId;

	@ManyToOne
    @JoinColumn(name = "act_coachee_goals_id", nullable = true)
	private ACT_Coachee_Goals parentCoachingGoal;

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

	public Long getActCoacheeGoalsHistoryId() {
		return actCoacheeGoalsHistoryId;
	}

	public void setActCoacheeGoalsHistoryId(Long actCoacheeGoalsHistoryId) {
		this.actCoacheeGoalsHistoryId = actCoacheeGoalsHistoryId;
	}

	public ACT_Coachee_Goals getParentCoachingGoal() {
		return parentCoachingGoal;
	}

	public void setParentCoachingGoal(ACT_Coachee_Goals parentCoachingGoal) {
		this.parentCoachingGoal = parentCoachingGoal;
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
}