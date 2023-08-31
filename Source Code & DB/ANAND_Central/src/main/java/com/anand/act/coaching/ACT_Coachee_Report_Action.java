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

import com.anand.act.batch.ACT_Coach_Coachee_Map;
import com.anand.masters.M_User;

@Entity
@Table(name = "act_coachee_report_action")
public class ACT_Coachee_Report_Action implements Comparable<ACT_Coachee_Report_Action> {

	@Override
	public int compareTo(ACT_Coachee_Report_Action coacheeReportAction) {
		return Integer.parseInt(""+coacheeReportAction.getActCoacheeReportActionId()) - Integer.parseInt(""+this.actCoacheeReportActionId);
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "act_coachee_report_action_id",unique = true, nullable = false)
    private Long actCoacheeReportActionId;

	@ManyToOne
    @JoinColumn(name = "act_coachee_report_id", nullable = true)
	private ACT_Coachee_Report coacheeReportActionList;

	@OneToOne
    @JoinColumn(name = "act_coach_caochee_map_id", nullable = true)
	private ACT_Coach_Coachee_Map actCoachCaocheeMapId;

	@OneToOne
    @JoinColumn(name = "act_coachee_goal_id", nullable = true)
	private ACT_Coachee_Goals actCoacheeGoalId;

	@Column(name = "goal_action")
    private String goalAction;

	@Column(name = "coachee_comment")
    private String coacheeComment;

	@Column(name = "coach_comment")
    private String coachComment;

	@Column(name = "report_action_status")
    private Integer reportActionStatus;

	@Column(name = "target_date")
    private Date targetDate;

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

	@Column(name = "report_action_active")
    private Integer reportActionActive;

	public Long getActCoacheeReportActionId() {
		return actCoacheeReportActionId;
	}

	public void setActCoacheeReportActionId(Long actCoacheeReportActionId) {
		this.actCoacheeReportActionId = actCoacheeReportActionId;
	}

	public ACT_Coachee_Report getCoacheeReportActionList() {
		return coacheeReportActionList;
	}

	public void setCoacheeReportActionList(ACT_Coachee_Report coacheeReportActionList) {
		this.coacheeReportActionList = coacheeReportActionList;
	}

	public ACT_Coach_Coachee_Map getActCoachCaocheeMapId() {
		return actCoachCaocheeMapId;
	}

	public void setActCoachCaocheeMapId(ACT_Coach_Coachee_Map actCoachCaocheeMapId) {
		this.actCoachCaocheeMapId = actCoachCaocheeMapId;
	}

	public ACT_Coachee_Goals getActCoacheeGoalId() {
		return actCoacheeGoalId;
	}

	public void setActCoacheeGoalId(ACT_Coachee_Goals actCoacheeGoalId) {
		this.actCoacheeGoalId = actCoacheeGoalId;
	}

	public String getGoalAction() {
		return goalAction;
	}

	public void setGoalAction(String goalAction) {
		this.goalAction = goalAction;
	}

	public String getCoacheeComment() {
		return coacheeComment;
	}

	public void setCoacheeComment(String coacheeComment) {
		this.coacheeComment = coacheeComment;
	}

	public String getCoachComment() {
		return coachComment;
	}

	public void setCoachComment(String coachComment) {
		this.coachComment = coachComment;
	}

	public Integer getReportActionStatus() {
		return reportActionStatus;
	}

	public void setReportActionStatus(Integer reportActionStatus) {
		this.reportActionStatus = reportActionStatus;
	}

	public Date getTargetDate() {
		return targetDate;
	}

	public void setTargetDate(Date targetDate) {
		this.targetDate = targetDate;
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

	public Integer getReportActionActive() {
		return reportActionActive;
	}

	public void setReportActionActive(Integer reportActionActive) {
		this.reportActionActive = reportActionActive;
	}
}