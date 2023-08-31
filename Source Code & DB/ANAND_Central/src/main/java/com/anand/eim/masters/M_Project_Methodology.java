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
@Table(name = "eim_m_project_methodology")
public class M_Project_Methodology {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "project_methodology_id",unique = true, nullable = false)
    private Long projectMethodologyId;

	@Column(name = "project_methodology_name")
    private String projectMethodologyName;

	@Column(name = "project_methodology_active")
    private Integer projectMethodologyActive; //0-In-Active 1-Active

	@Column(name = "created_on")
    private Date createdOn;

	@OneToOne
    @JoinColumn(name = "m_user_id", nullable = true)
	private M_User mUserId;

	public Long getProjectMethodologyId() {
		return projectMethodologyId;
	}

	public void setProjectMethodologyId(Long projectMethodologyId) {
		this.projectMethodologyId = projectMethodologyId;
	}

	public String getProjectMethodologyName() {
		return projectMethodologyName;
	}

	public void setProjectMethodologyName(String projectMethodologyName) {
		this.projectMethodologyName = projectMethodologyName;
	}

	public Integer getProjectMethodologyActive() {
		return projectMethodologyActive;
	}

	public void setProjectMethodologyActive(Integer projectMethodologyActive) {
		this.projectMethodologyActive = projectMethodologyActive;
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