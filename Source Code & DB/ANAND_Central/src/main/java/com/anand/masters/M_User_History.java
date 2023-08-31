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

import com.anand.masters.M_Department;
import com.anand.masters.M_Designation;
import com.anand.masters.M_Entity;

@Entity
@Table(name = "m_user_history")
public class M_User_History implements Comparable<M_User_History> {

	@Override
	public int compareTo(M_User_History userHistory) {
		return Integer.parseInt(""+userHistory.getmUserHistoryId()) - Integer.parseInt(""+this.mUserHistoryId);
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "m_user_history_id",unique = true, nullable = false)
    private Long mUserHistoryId;

	@OneToOne
    @JoinColumn(name = "m_user_id", nullable = true)
    private M_User mUserId;

	@Column(name = "user_login_id")
    private String userLoginId; //username - email id

	@Column(name = "user_password")
    private String userPassword; //BCryptPasswordEncoder password to be stored in this column

	@Column(name = "user_password_two")
    private String userPasswordTwo;

	@Column(name = "user_active")
    private Integer userActive; //0-In-Active 1-Active

	@Column(name = "user_first_name")
    private String userFirstName;

	@Column(name = "user_middle_name")
    private String userMiddleName;

	@Column(name = "user_last_name")
    private String userLastName;

	@Column(name = "user_phone_number")
    private String userPhoneNumber;

	@Column(name = "user_reporting_manager_mail")
    private String userReportingManagerMail;

	@Column(name = "user_reporting_manager_name")
    private String userReportingManagerName;

	@OneToOne
    @JoinColumn(name = "m_entity_id", nullable = true)
    private M_Entity mEntityId;

	@OneToOne
    @JoinColumn(name = "m_designation_id", nullable = true)
    private M_Designation mDesignationId;

	@OneToOne
    @JoinColumn(name = "m_department_id", nullable = true)
    private M_Department mDepartmentId;

	@Column(name = "user_created_on")
    private Date userCreatedOn;

	@OneToOne
    @JoinColumn(name = "user_created_by", nullable = true)
    private M_User userCreatedBy;

	public Long getmUserHistoryId() {
		return mUserHistoryId;
	}

	public void setmUserHistoryId(Long mUserHistoryId) {
		this.mUserHistoryId = mUserHistoryId;
	}

	public M_User getmUserId() {
		return mUserId;
	}

	public void setmUserId(M_User mUserId) {
		this.mUserId = mUserId;
	}

	public String getUserLoginId() {
		return userLoginId;
	}

	public void setUserLoginId(String userLoginId) {
		this.userLoginId = userLoginId;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserPasswordTwo() {
		return userPasswordTwo;
	}

	public void setUserPasswordTwo(String userPasswordTwo) {
		this.userPasswordTwo = userPasswordTwo;
	}

	public Integer getUserActive() {
		return userActive;
	}

	public void setUserActive(Integer userActive) {
		this.userActive = userActive;
	}

	public String getUserFirstName() {
		return userFirstName;
	}

	public void setUserFirstName(String userFirstName) {
		this.userFirstName = userFirstName;
	}

	public String getUserMiddleName() {
		return userMiddleName;
	}

	public void setUserMiddleName(String userMiddleName) {
		this.userMiddleName = userMiddleName;
	}

	public String getUserLastName() {
		return userLastName;
	}

	public void setUserLastName(String userLastName) {
		this.userLastName = userLastName;
	}

	public String getUserPhoneNumber() {
		return userPhoneNumber;
	}

	public void setUserPhoneNumber(String userPhoneNumber) {
		this.userPhoneNumber = userPhoneNumber;
	}

	public String getUserReportingManagerMail() {
		return userReportingManagerMail;
	}

	public void setUserReportingManagerMail(String userReportingManagerMail) {
		this.userReportingManagerMail = userReportingManagerMail;
	}

	public String getUserReportingManagerName() {
		return userReportingManagerName;
	}

	public void setUserReportingManagerName(String userReportingManagerName) {
		this.userReportingManagerName = userReportingManagerName;
	}

	public M_Entity getmEntityId() {
		return mEntityId;
	}

	public void setmEntityId(M_Entity mEntityId) {
		this.mEntityId = mEntityId;
	}

	public M_Designation getmDesignationId() {
		return mDesignationId;
	}

	public void setmDesignationId(M_Designation mDesignationId) {
		this.mDesignationId = mDesignationId;
	}

	public M_Department getmDepartmentId() {
		return mDepartmentId;
	}

	public void setmDepartmentId(M_Department mDepartmentId) {
		this.mDepartmentId = mDepartmentId;
	}

	public Date getUserCreatedOn() {
		return userCreatedOn;
	}

	public void setUserCreatedOn(Date userCreatedOn) {
		this.userCreatedOn = userCreatedOn;
	}

	public M_User getUserCreatedBy() {
		return userCreatedBy;
	}

	public void setUserCreatedBy(M_User userCreatedBy) {
		this.userCreatedBy = userCreatedBy;
	}
}