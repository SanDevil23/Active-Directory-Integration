package com.anand.ifc.rcm;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "ifc_rcm_tracker")
public class M_Tracker{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "rcm_tracker_id",unique = true, nullable = false)
	private Long rcmTrackerId;
	
	@ManyToOne
    @JoinColumn(name="rcm_transaction_id", nullable=true)
    private M_Transaction transaction;

	@Column(name = "approved_rejected")
	private Integer approvedRejected;
	
	@Column(name = "approver_type")
	private Integer approverType;
	
	@Column(name = "comments")
	private String comments;
	
	@Column(name = "approval_timestamp")
	private Date approvalTimestamp;
	
	public Long getRcmTrackerId() {
		return rcmTrackerId;
	}

	public void setRcmTrackerId(Long rcmTrackerId) {
		this.rcmTrackerId = rcmTrackerId;
	}

	public M_Transaction getTransaction() {
		return transaction;
	}

	public void setTransaction(M_Transaction transaction) {
		this.transaction = transaction;
	}


	public Integer getApprovedRejected() {
		return approvedRejected;
	}

	public void setApprovedRejected(Integer approvedRejected) {
		this.approvedRejected = approvedRejected;
	}

	public Integer getApproverType() {
		return approverType;
	}

	public void setApproverType(Integer approverType) {
		this.approverType = approverType;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public Date getApprovalTimestamp() {
		return approvalTimestamp;
	}

	public void setApprovalTimestamp(Date approvalTimestamp) {
		this.approvalTimestamp = approvalTimestamp;
	}

	@Transient private String approvalTimestampTemp;
	

	public String getApprovalTimestampTemp() {
		return approvalTimestampTemp;
	}

	public void setApprovalTimestampTemp(String approvalTimestampTemp) {
		this.approvalTimestampTemp = approvalTimestampTemp;
	}

}