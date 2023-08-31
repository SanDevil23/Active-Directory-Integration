/**
 * *******************************************************************************************
 * Copyright © 2021 Anand Group India. All rights reserved.
 * No part of this product may be reproduced in any form by any means without prior
 * written authorization of Anand Automotive Private Limited and its licensors, if any.
 * *******************************************************************************************
 * Author - Anand Group India - R S Iyer
 */
package com.anand.ifc.masters;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.anand.masters.M_User;

@Entity
@Table(name = "ifc_m_process")
public class M_Process implements Comparable<M_Process> {

	@Override
	public int compareTo(M_Process role) {
		return Integer.parseInt(""+role.getmProcessId()) - Integer.parseInt(""+this.getmProcessId());
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "m_process_id",unique = true, nullable = false)
    private Long mProcessId;

	@Column(name = "process_name")
    private String processName;

	@Column(name = "process_active")
    private Integer processActive;//0-In-Active 1-Active

	@OneToOne
    @JoinColumn(name = "created_by", nullable = true)
	private M_User createdBy;

	@Column(name = "created_on")
    private Date createdOn;

	@OneToOne
    @JoinColumn(name = "updated_by", nullable = true)
	private M_User updatedBy;

	@Column(name = "updated_on")
    private Date updatedOn;

	public Long getmProcessId() {
		return mProcessId;
	}

	public void setmProcessId(Long mProcessId) {
		this.mProcessId = mProcessId;
	}

	public String getProcessName() {
		return processName;
	}

	public void setProcessName(String processName) {
		this.processName = processName;
	}

	public Integer getProcessActive() {
		return processActive;
	}

	public void setProcessActive(Integer processActive) {
		this.processActive = processActive;
	}

	public M_User getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(M_User createdBy) {
		this.createdBy = createdBy;
	}

	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}

	public M_User getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(M_User updatedBy) {
		this.updatedBy = updatedBy;
	}

	public Date getUpdatedOn() {
		return updatedOn;
	}

	public void setUpdatedOn(Date updatedOn) {
		this.updatedOn = updatedOn;
	}

	@Transient private String actionForList;

	public String getActionForList() {
		return actionForList;
	}

	public void setActionForList(String actionForList) {
		this.actionForList = actionForList;
	}
}