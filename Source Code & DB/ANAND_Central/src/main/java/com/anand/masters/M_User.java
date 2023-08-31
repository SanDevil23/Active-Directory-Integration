package com.anand.masters;

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
import javax.persistence.Transient;

import com.anand.masters.M_Department;
import com.anand.masters.M_Designation;
import com.anand.masters.M_Entity;

@Entity
@Table(name = "m_user")
public class M_User implements Comparable<M_User> {

	@Override
	public int compareTo(M_User user) {
		return Integer.parseInt(""+user.getmUserId()) - Integer.parseInt(""+this.mUserId);
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "m_user_id",unique = true, nullable = false)
    private Long mUserId;

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

	@Column(name = "user_code")
    private String userCode;

	@Column(name = "user_phone_number")
    private String userPhoneNumber;

	@Column(name = "user_reporting_manager_mail")
    private String userReportingManagerMail;

	@Column(name = "user_reporting_manager_name")
    private String userReportingManagerName;

	@Column(name = "user_email_verify_token")
    private String userEmailVerifyToken;

	@Column(name = "user_forgot_password_token")
    private String userForgotPasswordToken;

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

	@Column(name = "user_approved")
    private Integer userApproved;

	@Column(name = "user_approved_on")
    private Date userApprovedOn;

	@OneToOne
    @JoinColumn(name = "user_approved_by", nullable = true)
    private M_User userApprovedBy;

	@OneToMany(mappedBy="userInfoForRole")
    private Set<M_User_Role_Map> userInfoForRole;
   
    @OneToMany(mappedBy="userInfoForApp")
    private Set<M_User_App_Map> userInfoForApp;

	public Long getmUserId() {
		return mUserId;
	}

	public void setmUserId(Long mUserId) {
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

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
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

	public String getUserEmailVerifyToken() {
		return userEmailVerifyToken;
	}

	public void setUserEmailVerifyToken(String userEmailVerifyToken) {
		this.userEmailVerifyToken = userEmailVerifyToken;
	}

	public String getUserForgotPasswordToken() {
		return userForgotPasswordToken;
	}

	public void setUserForgotPasswordToken(String userForgotPasswordToken) {
		this.userForgotPasswordToken = userForgotPasswordToken;
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

	public Integer getUserApproved() {
		return userApproved;
	}

	public void setUserApproved(Integer userApproved) {
		this.userApproved = userApproved;
	}

	public Date getUserApprovedOn() {
		return userApprovedOn;
	}

	public void setUserApprovedOn(Date userApprovedOn) {
		this.userApprovedOn = userApprovedOn;
	}

	public M_User getUserApprovedBy() {
		return userApprovedBy;
	}

	public void setUserApprovedBy(M_User userApprovedBy) {
		this.userApprovedBy = userApprovedBy;
	}

	public Set<M_User_Role_Map> getUserInfoForRole() {
		return userInfoForRole;
	}

	public void setUserInfoForRole(Set<M_User_Role_Map> userInfoForRole) {
		this.userInfoForRole = userInfoForRole;
	}

	public Set<M_User_App_Map> getUserInfoForApp() {
		return userInfoForApp;
	}

	public void setUserInfoForApp(Set<M_User_App_Map> userInfoForApp) {
		this.userInfoForApp = userInfoForApp;
	}

	@Transient private Integer tempEntityId;
	@Transient private Integer tempDepartmentId;
	@Transient private Integer tempDesignationId;
	@Transient private String action;
	@Transient private String rolesAvailable;
	@Transient private String userRolesTemp;
	@Transient private String userAppsTemp;

	public String getUserAppsTemp() {
		return userAppsTemp;
	}

	public void setUserAppsTemp(String userAppsTemp) {
		this.userAppsTemp = userAppsTemp;
	}

	public String getUserRolesTemp() {
		return userRolesTemp;
	}

	public void setUserRolesTemp(String userRolesTemp) {
		this.userRolesTemp = userRolesTemp;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getRolesAvailable() {
		return rolesAvailable;
	}

	public void setRolesAvailable(String rolesAvailable) {
		this.rolesAvailable = rolesAvailable;
	}

	public Integer getTempEntityId() {
		return tempEntityId;
	}

	public void setTempEntityId(Integer tempEntityId) {
		this.tempEntityId = tempEntityId;
	}

	public Integer getTempDepartmentId() {
		return tempDepartmentId;
	}

	public void setTempDepartmentId(Integer tempDepartmentId) {
		this.tempDepartmentId = tempDepartmentId;
	}

	public Integer getTempDesignationId() {
		return tempDesignationId;
	}

	public void setTempDesignationId(Integer tempDesignationId) {
		this.tempDesignationId = tempDesignationId;
	}
}