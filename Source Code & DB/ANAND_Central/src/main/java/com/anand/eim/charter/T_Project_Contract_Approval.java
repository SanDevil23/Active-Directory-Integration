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
@Table(name = "eim_t_project_contract_approval")
public class T_Project_Contract_Approval implements Comparable<T_Project_Contract_Approval> {

	@Override
	public int compareTo(T_Project_Contract_Approval projectContractApproval) {
		return this.tProjectContractApprovalId - projectContractApproval.gettProjectContractApprovalId();
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "t_project_contract_approval_id",unique = true, nullable = false)
	private Integer tProjectContractApprovalId;

	@ManyToOne
	@JoinColumn(name = "t_project_charter_id", nullable = true)
	private T_Project_Charter projectContractApproval;

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

	@Column(name = "active")
	private Integer active;

	public Integer gettProjectContractApprovalId() {
		return tProjectContractApprovalId;
	}

	public void settProjectContractApprovalId(Integer tProjectContractApprovalId) {
		this.tProjectContractApprovalId = tProjectContractApprovalId;
	}

	public T_Project_Charter getProjectContractApproval() {
		return projectContractApproval;
	}

	public void setProjectContractApproval(T_Project_Charter projectContractApproval) {
		this.projectContractApproval = projectContractApproval;
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