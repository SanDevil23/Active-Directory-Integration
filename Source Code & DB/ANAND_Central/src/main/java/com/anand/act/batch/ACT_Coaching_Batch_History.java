package com.anand.act.batch;

import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.anand.masters.M_User;

@Entity
@Table(name = "act_coaching_batch_history")
public class ACT_Coaching_Batch_History implements Comparable<ACT_Coaching_Batch_History> {

	@Override
	public int compareTo(ACT_Coaching_Batch_History roleHistory) {
		return roleHistory.getActCoachingBatchHistoryId() - this.actCoachingBatchHistoryId;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "act_coaching_batch_history_id",unique = true, nullable = false)
    private Integer actCoachingBatchHistoryId;

	@OneToOne
    @JoinColumn(name = "act_coaching_batch_id", nullable = true)
    private ACT_Coaching_Batch actCoachingBatchId;

	@Column(name = "batch_name")
    private String batchName;

	@Column(name = "batch_description")
    private String batchDescription;

	@Column(name = "batch_start_date")
    private Date batchStartDate;

	@Column(name = "batch_end_date")
    private Date batchEndDate;

	@Column(name = "batch_active")
    private Integer batchActive;//0-In-Active 1-Active

	@OneToOne
    @JoinColumn(name = "m_user_id", nullable = true)
    private M_User mUserId;

	@Column(name = "created_on")
    private Date createdOn;

	public Integer getActCoachingBatchHistoryId() {
		return actCoachingBatchHistoryId;
	}

	public void setActCoachingBatchHistoryId(Integer actCoachingBatchHistoryId) {
		this.actCoachingBatchHistoryId = actCoachingBatchHistoryId;
	}

	public ACT_Coaching_Batch getActCoachingBatchId() {
		return actCoachingBatchId;
	}

	public void setActCoachingBatchId(ACT_Coaching_Batch actCoachingBatchId) {
		this.actCoachingBatchId = actCoachingBatchId;
	}

	public String getBatchName() {
		return batchName;
	}

	public void setBatchName(String batchName) {
		this.batchName = batchName;
	}

	public String getBatchDescription() {
		return batchDescription;
	}

	public void setBatchDescription(String batchDescription) {
		this.batchDescription = batchDescription;
	}

	public Date getBatchStartDate() {
		return batchStartDate;
	}

	public void setBatchStartDate(Date batchStartDate) {
		this.batchStartDate = batchStartDate;
	}

	public Date getBatchEndDate() {
		return batchEndDate;
	}

	public void setBatchEndDate(Date batchEndDate) {
		this.batchEndDate = batchEndDate;
	}

	public Integer getBatchActive() {
		return batchActive;
	}

	public void setBatchActive(Integer batchActive) {
		this.batchActive = batchActive;
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

	@OneToMany(mappedBy="coachCoacheeMappingHistorySet")
	private Set<ACT_Coach_Coachee_Map_History> coachCoacheeMappingHistorySet;

	public Set<ACT_Coach_Coachee_Map_History> getCoachCoacheeMappingHistorySet() {
		return coachCoacheeMappingHistorySet;
	}

	public void setCoachCoacheeMappingHistorySet(Set<ACT_Coach_Coachee_Map_History> coachCoacheeMappingHistorySet) {
		this.coachCoacheeMappingHistorySet = coachCoacheeMappingHistorySet;
	}
}