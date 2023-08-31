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
import java.util.List;
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
@Table(name = "act_coachee_report")
public class ACT_Coachee_Report implements Comparable<ACT_Coachee_Report> {

	@Override
	public int compareTo(ACT_Coachee_Report coacheeReport) {
		return Integer.parseInt(""+coacheeReport.getActCoacheeReportId()) - Integer.parseInt(""+this.actCoacheeReportId);
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "act_coachee_report_id",unique = true, nullable = false)
    private Long actCoacheeReportId;

	@ManyToOne
    @JoinColumn(name = "act_coach_coachee_map_id", nullable = true)
	private ACT_Coach_Coachee_Map coacheeReportSet;

	@Column(name = "session_date")
    private Date sessionDate;

	@Column(name = "meeting_conducted_status")
    private Integer meetingConductedStatus; //1-Conducted, 2-Not-Conducted

	@Column(name = "report_status")
    private Integer reportStatus;//1-Submitted, 2-Draft

	@Column(name = "reason_for_not_conducting")
    private String reasonForNotConducting;

	@Column(name = "discussion_and_inputs_from_coach")
    private String discussionAndInputsFromCoach;

	@Column(name = "coachee_additional_comments")
    private String coacheeAdditionalComments;

	@Column(name = "coach_additional_comments")
    private String coachAdditionalComments;

	@Column(name = "any_concern_or_observation")
    private String anyConcernOrObservation;

	@Column(name = "coach_reason_for_not_conducting")
    private String coachReasonForNotConducting;

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

	@Column(name = "report_active")
    private Integer reportActive;//0-In-Active 1-Active

	public String getCoachReasonForNotConducting() {
		return coachReasonForNotConducting;
	}

	public void setCoachReasonForNotConducting(String coachReasonForNotConducting) {
		this.coachReasonForNotConducting = coachReasonForNotConducting;
	}

	public String getAnyConcernOrObservation() {
		return anyConcernOrObservation;
	}

	public void setAnyConcernOrObservation(String anyConcernOrObservation) {
		this.anyConcernOrObservation = anyConcernOrObservation;
	}

	public Long getActCoacheeReportId() {
		return actCoacheeReportId;
	}

	public void setActCoacheeReportId(Long actCoacheeReportId) {
		this.actCoacheeReportId = actCoacheeReportId;
	}

	public ACT_Coach_Coachee_Map getCoacheeReportSet() {
		return coacheeReportSet;
	}

	public void setCoacheeReportSet(ACT_Coach_Coachee_Map coacheeReportSet) {
		this.coacheeReportSet = coacheeReportSet;
	}

	public Date getSessionDate() {
		return sessionDate;
	}

	public void setSessionDate(Date sessionDate) {
		this.sessionDate = sessionDate;
	}

	public Integer getMeetingConductedStatus() {
		return meetingConductedStatus;
	}

	public void setMeetingConductedStatus(Integer meetingConductedStatus) {
		this.meetingConductedStatus = meetingConductedStatus;
	}

	public Integer getReportStatus() {
		return reportStatus;
	}

	public void setReportStatus(Integer reportStatus) {
		this.reportStatus = reportStatus;
	}

	public String getReasonForNotConducting() {
		return reasonForNotConducting;
	}

	public void setReasonForNotConducting(String reasonForNotConducting) {
		this.reasonForNotConducting = reasonForNotConducting;
	}

	public String getDiscussionAndInputsFromCoach() {
		return discussionAndInputsFromCoach;
	}

	public void setDiscussionAndInputsFromCoach(String discussionAndInputsFromCoach) {
		this.discussionAndInputsFromCoach = discussionAndInputsFromCoach;
	}

	public String getCoacheeAdditionalComments() {
		return coacheeAdditionalComments;
	}

	public void setCoacheeAdditionalComments(String coacheeAdditionalComments) {
		this.coacheeAdditionalComments = coacheeAdditionalComments;
	}

	public String getCoachAdditionalComments() {
		return coachAdditionalComments;
	}

	public void setCoachAdditionalComments(String coachAdditionalComments) {
		this.coachAdditionalComments = coachAdditionalComments;
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

	public Integer getReportActive() {
		return reportActive;
	}

	public void setReportActive(Integer reportActive) {
		this.reportActive = reportActive;
	}

	@OneToMany(mappedBy="coacheeReportActionList")
	private Set<ACT_Coachee_Report_Action> coacheeReportActionList;

	public Set<ACT_Coachee_Report_Action> getCoacheeReportActionList() {
		return coacheeReportActionList;
	}

	public void setCoacheeReportActionList(Set<ACT_Coachee_Report_Action> coacheeReportActionList) {
		this.coacheeReportActionList = coacheeReportActionList;
	}

	@Transient private Long actCoachCoacheeMapId;

	public Long getActCoachCoacheeMapId() {
		return actCoachCoacheeMapId;
	}

	public void setActCoachCoacheeMapId(Long actCoachCoacheeMapId) {
		this.actCoachCoacheeMapId = actCoachCoacheeMapId;
	}

	@Transient private String sessionDateString;

	public String getSessionDateString() {
		return sessionDateString;
	}

	public void setSessionDateString(String sessionDateString) {
		this.sessionDateString = sessionDateString;
	}

	@Transient private String actionForCoachingReport;

	public String getActionForCoachingReport() {
		return actionForCoachingReport;
	}

	public void setActionForCoachingReport(String actionForCoachingReport) {
		this.actionForCoachingReport = actionForCoachingReport;
	}

	@Transient private List<ACT_Coachee_Report_Action> coacheeReportActionTempList;

	public List<ACT_Coachee_Report_Action> getCoacheeReportActionTempList() {
		return coacheeReportActionTempList;
	}

	public void setCoacheeReportActionTempList(List<ACT_Coachee_Report_Action> coacheeReportActionTempList) {
		this.coacheeReportActionTempList = coacheeReportActionTempList;
	}
}