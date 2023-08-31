package com.anand.eim.masters;

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
@Table(name = "eim_m_project_type")
public class M_Project_Type {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "project_type_id",unique = true, nullable = false)
    private Long projectTypeId;

	@Column(name = "project_type_name")
    private String projectTypeName;

	@Column(name = "project_type_short_code")
    private String projectTypeShortCode;

	@Column(name = "project_type_description")
    private String projectTypeDescription;

	@Column(name = "project_type_active")
    private Integer projectTypeActive; //0-In-Active 1-Active

	@Column(name = "created_on")
    private Date createdOn;

	@OneToOne
    @JoinColumn(name = "m_user_id", nullable = true)
	private M_User mUserId;

	public Long getProjectTypeId() {
		return projectTypeId;
	}

	public void setProjectTypeId(Long projectTypeId) {
		this.projectTypeId = projectTypeId;
	}

	public String getProjectTypeName() {
		return projectTypeName;
	}

	public void setProjectTypeName(String projectTypeName) {
		this.projectTypeName = projectTypeName;
	}

	public String getProjectTypeShortCode() {
		return projectTypeShortCode;
	}

	public void setProjectTypeShortCode(String projectTypeShortCode) {
		this.projectTypeShortCode = projectTypeShortCode;
	}

	public String getProjectTypeDescription() {
		return projectTypeDescription;
	}

	public void setProjectTypeDescription(String projectTypeDescription) {
		this.projectTypeDescription = projectTypeDescription;
	}

	public Integer getProjectTypeActive() {
		return projectTypeActive;
	}

	public void setProjectTypeActive(Integer projectTypeActive) {
		this.projectTypeActive = projectTypeActive;
	}

	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}

	public M_User getmUserId() {
		return mUserId;
	}

	public void setmUserId(M_User mUserId) {
		this.mUserId = mUserId;
	}
}
