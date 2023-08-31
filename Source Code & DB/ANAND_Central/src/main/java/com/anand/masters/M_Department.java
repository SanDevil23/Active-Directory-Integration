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
@Table(name = "m_department")
public class M_Department implements Comparable<M_Department> {

	@Override
	public int compareTo(M_Department department) {
		return Integer.parseInt(""+department.getmDepartmentId()) - Integer.parseInt(""+this.mDepartmentId);
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "m_department_id",unique = true, nullable = false)
    private Long mDepartmentId;

	@Column(name = "department_name")
    private String departmentName;

	@Column(name = "department_description")
    private String departmentDescription;

	@Column(name = "department_active")
    private Integer departmentActive;

	@OneToOne
    @JoinColumn(name = "m_user_id", nullable = true)
    private M_User mUserId;

	@Column(name = "created_on")
    private Date createdOn;

	@OneToOne
    @JoinColumn(name = "m_user_id_update", nullable = true)
    private M_User mUserIdUpdate;

	@Column(name = "updated_on")
    private Date updatedOn;

	public Long getmDepartmentId() {
		return mDepartmentId;
	}

	public void setmDepartmentId(Long mDepartmentId) {
		this.mDepartmentId = mDepartmentId;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public String getDepartmentDescription() {
		return departmentDescription;
	}

	public void setDepartmentDescription(String departmentDescription) {
		this.departmentDescription = departmentDescription;
	}

	public Integer getDepartmentActive() {
		return departmentActive;
	}

	public void setDepartmentActive(Integer departmentActive) {
		this.departmentActive = departmentActive;
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

	public M_User getmUserIdUpdate() {
		return mUserIdUpdate;
	}

	public void setmUserIdUpdate(M_User mUserIdUpdate) {
		this.mUserIdUpdate = mUserIdUpdate;
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