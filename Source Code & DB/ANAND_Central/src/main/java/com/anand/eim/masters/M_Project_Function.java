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
@Table(name = "eim_m_project_function")
public class M_Project_Function {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "project_function_id",unique = true, nullable = false)
    private Long projectFunctionId;

	@Column(name = "project_function_name")
    private String projectFunctionName;

	@Column(name = "project_function_active")
    private Integer projectFunctionActive; //0-In-Active 1-Active

	@Column(name = "created_on")
    private Date createdOn;

	@OneToOne
    @JoinColumn(name = "m_user_id", nullable = true)
	private M_User mUserId;

	public Long getProjectFunctionId() {
		return projectFunctionId;
	}

	public void setProjectFunctionId(Long projectFunctionId) {
		this.projectFunctionId = projectFunctionId;
	}

	public String getProjectFunctionName() {
		return projectFunctionName;
	}

	public void setProjectFunctionName(String projectFunctionName) {
		this.projectFunctionName = projectFunctionName;
	}

	public Integer getProjectFunctionActive() {
		return projectFunctionActive;
	}

	public void setProjectFunctionActive(Integer projectFunctionActive) {
		this.projectFunctionActive = projectFunctionActive;
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
