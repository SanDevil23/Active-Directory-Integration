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
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.anand.act.batch.ACT_Coach_Coachee_Map;
import com.anand.masters.M_User;

@Entity
@Table(name = "act_coachee_report_history")
public class ACT_Coachee_Report_History implements Comparable<ACT_Coachee_Report_History> {

	@Override
	public int compareTo(ACT_Coachee_Report_History coacheeReport) {
		return Integer.parseInt(""+coacheeReport.getActCoacheeReportHistoryId()) - Integer.parseInt(""+this.actCoacheeReportHistoryId);
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "act_coachee_report_history_id",unique = true, nullable = false)
    private Long actCoacheeReportHistoryId;

	@OneToOne
    @JoinColumn(name = "act_coachee_report_id", nullable = true)
	private ACT_Coachee_Report actCoacheeReport;

	@OneToOne
    @JoinColumn(name = "act_coach_coachee_map_id", nullable = true)
	private ACT_Coach_Coachee_Map coacheeReportSet;

	@Column(name = "session_date")
    private Date sessionDate;

	@Column(name = "meeting_conducted_status")
    private Integer meetingConductedStatus; //1-Conducted, 2-Not-Conducted

	@Column(name = "report_status")
    private Integer reportStatus;//0-In-Active 1-Active

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

	@Column(name = "report_active")
    private Integer reportActive;

	public String getAnyConcernOrObservation() {
		return anyConcernOrObservation;
	}

	public void setAnyConcernOrObservation(String anyConcernOrObservation) {
		this.anyConcernOrObservation = anyConcernOrObservation;
	}

	public String getCoachReasonForNotConducting() {
		return coachReasonForNotConducting;
	}

	public void setCoachReasonForNotConducting(String coachReasonForNotConducting) {
		this.coachReasonForNotConducting = coachReasonForNotConducting;
	}

	public Long getActCoacheeReportHistoryId() {
		return actCoacheeReportHistoryId;
	}

	public void setActCoacheeReportHistoryId(Long actCoacheeReportHistoryId) {
		this.actCoacheeReportHistoryId = actCoacheeReportHistoryId;
	}

	public ACT_Coachee_Report getActCoacheeReport() {
		return actCoacheeReport;
	}

	public void setActCoacheeReport(ACT_Coachee_Report actCoacheeReport) {
		this.actCoacheeReport = actCoacheeReport;
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

	public Integer getReportActive() {
		return reportActive;
	}

	public void setReportActive(Integer reportActive) {
		this.reportActive = reportActive;
	}
}