package com.anand.eim.charter;

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
import javax.persistence.Transient;

import com.anand.masters.M_User;

@Entity
@Table(name = "eim_t_project_closure_approval")
public class T_Project_Closure_Approval implements Comparable<T_Project_Closure_Approval> {

	@Override
	public int compareTo(T_Project_Closure_Approval projectClosureApproval) {
		return this.tProjectClosureApprovalId - projectClosureApproval.gettProjectClosureApprovalId();
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "t_project_closure_approval_id",unique = true, nullable = false)
	private Integer tProjectClosureApprovalId;

	@ManyToOne
	@JoinColumn(name = "t_project_charter_id", nullable = true)
	private T_Project_Charter projectClosureApproval;

	@Column(name = "approver_type")
	private Integer approverType;

	@OneToOne
	@JoinColumn(name = "approver_id", nullable = true)
	private M_User approverId;

	@Column(name = "approval_submission_date")
	private Date approvalSubmissionDate;

	@Column(name = "approval_date")
	private Date approvalDate;

	@Column(name = "approval_comments")
	private String approvalComments;

	@Column(name = "approval_status")
	private Integer approvalStatus;
	
	@Column(name = "first_criteria")
	private Integer firstCriteria;
	
	@Column(name = "second_criteria")
	private Integer secondCriteria;
	
	@Column(name = "third_criteria")
	private Integer thirdCriteria;
	
	@Column(name = "fourth_criteria")
	private Integer fourthCriteria;
	
	@Column(name = "fifth_criteria")
	private Integer fifthCriteria;
	
	@Column(name = "total_score")
	private Integer totalScore;
	
	@Column(name = "survey_comments")
	private String surveyComments;

	@Column(name = "active")
	private Integer active;

	public Integer gettProjectClosureApprovalId() {
		return tProjectClosureApprovalId;
	}

	public void settProjectClosureApprovalId(Integer tProjectClosureApprovalId) {
		this.tProjectClosureApprovalId = tProjectClosureApprovalId;
	}

	public T_Project_Charter getProjectClosureApproval() {
		return projectClosureApproval;
	}

	public void setProjectClosureApproval(T_Project_Charter projectClosureApproval) {
		this.projectClosureApproval = projectClosureApproval;
	}

	public Integer getApproverType() {
		return approverType;
	}

	public void setApproverType(Integer approverType) {
		this.approverType = approverType;
	}

	public M_User getApproverId() {
		return approverId;
	}

	public void setApproverId(M_User approverId) {
		this.approverId = approverId;
	}

	public Date getApprovalSubmissionDate() {
		return approvalSubmissionDate;
	}

	public void setApprovalSubmissionDate(Date approvalSubmissionDate) {
		this.approvalSubmissionDate = approvalSubmissionDate;
	}

	public Date getApprovalDate() {
		return approvalDate;
	}

	public void setApprovalDate(Date approvalDate) {
		this.approvalDate = approvalDate;
	}

	public String getApprovalComments() {
		return approvalComments;
	}

	public void setApprovalComments(String approvalComments) {
		this.approvalComments = approvalComments;
	}

	public Integer getApprovalStatus() {
		return approvalStatus;
	}

	public void setApprovalStatus(Integer approvalStatus) {
		this.approvalStatus = approvalStatus;
	}
	
	public Integer getFirstCriteria() {
		return firstCriteria;
	}

	public void setFirstCriteria(Integer firstCriteria) {
		this.firstCriteria = firstCriteria;
	}
	
	public Integer getSecondCriteria() {
		return secondCriteria;
	}

	public void setSecondCriteria(Integer secondCriteria) {
		this.secondCriteria = secondCriteria;
	}
	
	public Integer getThirdCriteria() {
		return thirdCriteria;
	}

	public void setThirdCriteria(Integer thirdCriteria) {
		this.thirdCriteria = thirdCriteria;
	}
	
	public Integer getFourthCriteria() {
		return fourthCriteria;
	}

	public void setFourthCriteria(Integer fourthCriteria) {
		this.fourthCriteria = fourthCriteria;
	}
	
	public Integer getFifthCriteria() {
		return fifthCriteria;
	}

	public void setFifthCriteria(Integer fifthCriteria) {
		this.fifthCriteria = fifthCriteria;
	}
	
	public Integer getTotalScore() {
		return totalScore;
	}

	public void setTotalScore(Integer totalScore) {
		this.totalScore = totalScore;
	}
	
	public String getSurveyComments() {
		return surveyComments;
	}

	public void setSurveyComments(String surveyComments) {
		this.surveyComments = surveyComments;
	}

	public Integer getActive() {
		return active;
	}

	public void setActive(Integer active) {
		this.active = active;
	}

	@Transient private Integer projectCharterId;

	public Integer getProjectCharterId() {
		return projectCharterId;
	}

	public void setProjectCharterId(Integer projectCharterId) {
		this.projectCharterId = projectCharterId;
	}
}