/**
 * *******************************************************************************************
 * Copyright © 2023 Anand Group India. All rights reserved.
 * No part of this product may be reproduced in any form by any means without prior
 * written authorization of Anand Automotive Private Limited and its licensors, if any.
 * *******************************************************************************************
 * Author - Anand Group India - Amit Srivastav
 */
package com.anand.ifc.rcm;

import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.anand.masters.M_User;

@Entity
@Table(name = "ifc_rcm_transaction")
public class M_Transaction implements Comparable<M_Transaction> {

	@Override
	public int compareTo(M_Transaction mTransaction) {
		return Integer.parseInt(""+mTransaction.getRcmTransactionId()) - Integer.parseInt(""+this.rcmTransactionId);
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "rcm_transaction_id",unique = true, nullable = false)
    private Long rcmTransactionId;
	
	@ManyToOne
    @JoinColumn(name="rcm_id", nullable=true)
    private M_Rcm controlReference;

	@ManyToOne
    @JoinColumn(name = "rcm_plant_id", nullable = true)
    private M_Plant plantReference;

	@OneToOne
    @JoinColumn(name = "soh_by", nullable = true)
    private M_User sohBy;

	@OneToOne
    @JoinColumn(name = "line_manager", nullable = true)
    private M_User lineManager;
	
	@OneToOne
    @JoinColumn(name = "praac", nullable = true)
    private M_User praac;

	@Column(name = "validity")
    private Date validity;

	@Column(name = "transaction_active")
    private Integer transactionActive;
	
	@Column(name = "compliance_flag")
	private Integer complianceFlag;
	
	@Column(name = "comments")
	private String comments;
	
	@Column(name = "proof_attachment_name")
	private String proofAttachmentName;

	@Column(name = "proof_attachment_type")
	private String proofAttachmentType;

	@Column(name = "proof_attachment")
	@Lob
	private byte[] proofAttachment;
	
	@Column(name = "approval_status")
	private Integer approvalStatus;
	//null - waiting for upload by SOH person
	//0 - Waiting for approval by Line Manager
	//1 - All Approval Done
	//2 - Waiting for approval by PRAAC
	//3 - Rejected by Line Manager
	//4 - Rejected by PRAAC

	@Column(name = "created_on")
	private Date createdOn;
	
	@Column(name = "score")
	private Integer score;
	
	@OneToMany(mappedBy="transaction")
    private Set<M_Tracker> transaction;
	
	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}

	public Long getRcmTransactionId() {
		return rcmTransactionId;
	}

	public void setRcmTransactionId(Long rcmTransactionId) {
		this.rcmTransactionId = rcmTransactionId;
	}

	public M_Rcm getControlReference() {
		return controlReference;
	}

	public void setControlReference(M_Rcm controlReference) {
		this.controlReference = controlReference;
	}

	public M_Plant getPlantReference() {
		return plantReference;
	}

	public void setPlantReference(M_Plant plantReference) {
		this.plantReference = plantReference;
	}

	public M_User getSohBy() {
		return sohBy;
	}

	public void setSohBy(M_User sohBy) {
		this.sohBy = sohBy;
	}

	public M_User getLineManager() {
		return lineManager;
	}

	public void setLineManager(M_User lineManager) {
		this.lineManager = lineManager;
	}

	public M_User getPraac() {
		return praac;
	}

	public void setPraac(M_User praac) {
		this.praac = praac;
	}

	public Date getValidity() {
		return validity;
	}

	public void setValidity(Date validity) {
		this.validity = validity;
	}

	public Integer getTransactionActive() {
		return transactionActive;
	}

	public void setTransactionActive(Integer transactionActive) {
		this.transactionActive = transactionActive;
	}

	public Integer getComplianceFlag() {
		return complianceFlag;
	}

	public void setComplianceFlag(Integer complianceFlag) {
		this.complianceFlag = complianceFlag;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getProofAttachmentName() {
		return proofAttachmentName;
	}

	public void setProofAttachmentName(String proofAttachmentName) {
		this.proofAttachmentName = proofAttachmentName;
	}

	public String getProofAttachmentType() {
		return proofAttachmentType;
	}

	public void setProofAttachmentType(String proofAttachmentType) {
		this.proofAttachmentType = proofAttachmentType;
	}

	public byte[] getProofAttachment() {
		return proofAttachment;
	}

	public void setProofAttachment(byte[] proofAttachment) {
		this.proofAttachment = proofAttachment;
	}

	public Integer getApprovalStatus() {
		return approvalStatus;
	}

	public void setApprovalStatus(Integer approvalStatus) {
		this.approvalStatus = approvalStatus;
	}

	public Set<M_Tracker> getTransaction() {
		return transaction;
	}

	public void setTransaction(Set<M_Tracker> transaction) {
		this.transaction = transaction;
	}
	
	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	@Transient private String actionForList;
	@Transient private MultipartFile tempProofAttachment;
	
	public String getActionForList() {
		return actionForList;
	}

	public void setActionForList(String actionForList) {
		this.actionForList = actionForList;
	}

	public MultipartFile getTempProofAttachment() {
		return tempProofAttachment;
	}

	public void setTempProofAttachment(MultipartFile tempProofAttachment) {
		this.tempProofAttachment = tempProofAttachment;
	}

}