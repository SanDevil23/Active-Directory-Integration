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

import com.anand.masters.M_User;

@Entity
@Table(name = "ifc_m_process_history")
public class M_Process_History implements Comparable<M_Process_History> {

	@Override
	public int compareTo(M_Process_History processHistory) {
		return processHistory.getmProcessHistoryId() - this.mProcessHistoryId;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "m_process_history_id",unique = true, nullable = false)
    private Integer mProcessHistoryId;

	@OneToOne
    @JoinColumn(name = "m_process_id", nullable = true)
    private M_Process mProcessId;

	@Column(name = "process_name")
    private String processName;

	@Column(name = "process_active")
    private Integer processActive;

	@OneToOne
    @JoinColumn(name = "created_by", nullable = true)
    private M_User createdBy;

	@Column(name = "created_on")
    private Date createdOn;

	public Integer getmProcessHistoryId() {
		return mProcessHistoryId;
	}

	public void setmProcessHistoryId(Integer mProcessHistoryId) {
		this.mProcessHistoryId = mProcessHistoryId;
	}

	public M_Process getmProcessId() {
		return mProcessId;
	}

	public void setmProcessId(M_Process mProcessId) {
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
}