package com.anand.masters;

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

@Entity
@Table(name = "m_qualification")
public class M_Qualification implements Comparable<M_Qualification> {

	@Override
	public int compareTo(M_Qualification zone) {
		return Integer.parseInt(""+zone.getQualificationId()) - Integer.parseInt(""+this.qualificationId);
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "qualification_id",unique = true, nullable = false)
    private Long qualificationId;

	@Column(name = "qualification_name")
    private String qualificationName;

	@Column(name = "qualification_is_master")
    private Integer qualificationIsMaster;

	@OneToOne
    @JoinColumn(name = "qualification_created_by", nullable = true)
    private M_User qualificationCreatedBy;

	@Column(name = "qualification_created_on")
    private Date qualificationCreatedOn;

	@OneToOne
    @JoinColumn(name = "qualification_updated_by", nullable = true)
    private M_User qualificationUpdatedBy;

	@Column(name = "qualification_last_updated_on")
    private Date qualificationLastUpdatedOn;

	@Column(name = "active")
    private Integer active;

	public Long getQualificationId() {
		return qualificationId;
	}

	public void setQualificationId(Long qualificationId) {
		this.qualificationId = qualificationId;
	}

	public String getQualificationName() {
		return qualificationName;
	}

	public void setQualificationName(String qualificationName) {
		this.qualificationName = qualificationName;
	}

	public Integer getQualificationIsMaster() {
		return qualificationIsMaster;
	}

	public void setQualificationIsMaster(Integer qualificationIsMaster) {
		this.qualificationIsMaster = qualificationIsMaster;
	}

	public M_User getQualificationCreatedBy() {
		return qualificationCreatedBy;
	}

	public void setQualificationCreatedBy(M_User qualificationCreatedBy) {
		this.qualificationCreatedBy = qualificationCreatedBy;
	}

	public Date getQualificationCreatedOn() {
		return qualificationCreatedOn;
	}

	public void setQualificationCreatedOn(Date qualificationCreatedOn) {
		this.qualificationCreatedOn = qualificationCreatedOn;
	}

	public M_User getQualificationUpdatedBy() {
		return qualificationUpdatedBy;
	}

	public void setQualificationUpdatedBy(M_User qualificationUpdatedBy) {
		this.qualificationUpdatedBy = qualificationUpdatedBy;
	}

	public Date getQualificationLastUpdatedOn() {
		return qualificationLastUpdatedOn;
	}

	public void setQualificationLastUpdatedOn(Date qualificationLastUpdatedOn) {
		this.qualificationLastUpdatedOn = qualificationLastUpdatedOn;
	}

	public Integer getActive() {
		return active;
	}

	public void setActive(Integer active) {
		this.active = active;
	}

	@Transient private String actionForList;

	public String getActionForList() {
		return actionForList;
	}

	public void setActionForList(String actionForList) {
		this.actionForList = actionForList;
	}
}