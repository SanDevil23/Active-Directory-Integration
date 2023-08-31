package com.anand.eim.charter;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.anand.eim.charter.T_Project_Charter;
import com.anand.masters.M_User;

@Entity
@Table(name = "eim_t_project_charter_control")
public class T_Project_Charter_Control implements Comparable<T_Project_Charter_Control> {
	
	@Override
	public int compareTo(T_Project_Charter_Control projectCharterControl) {
		return (int) (projectCharterControl.gettProjectCharterControlId() - this.tProjectCharterControlId);
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "t_project_charter_control_id",unique = true, nullable = false)
	private Long tProjectCharterControlId;
	
	@ManyToOne
	@JoinColumn(name = "t_project_charter_id", nullable = true)
	private T_Project_Charter projectCharterControl;
	
	@Column(name="control_action")
	private String controlAction;
	
	@Column(name="control_established_in_system")
	private String controlEstablishedInSystem;
	
	@Column(name = "control_established_date")
	private Date controlEstablishedDate;
	
	@Column(name="sustenance_presence_of_control")
	private Integer sustenancePresenceOfControl;	
	
	@Column(name="sustenance_audit_comments")
	private String sustenanceAuditComments;
	
	@OneToOne
	@JoinColumn(name = "control_created_by", nullable = true)
	private M_User controlCreatedBy;
	
	@Column(name = "control_created_on")
	private Date controlCreatedOn;
	
	@Column(name = "active")
	private Integer active;

	public Long gettProjectCharterControlId() {
		return tProjectCharterControlId;
	}

	public void settProjectCharterControlId(Long tProjectCharterControlId) {
		this.tProjectCharterControlId = tProjectCharterControlId;
	}

	public T_Project_Charter getProjectCharterControl() {
		return projectCharterControl;
	}
	
	public void setProjectCharterControl(T_Project_Charter projectCharterControl) {
		this.projectCharterControl = projectCharterControl;
	}
	
	public String getControlAction() {
		return controlAction;
	}

	public void setControlAction(String controlAction) {
		this.controlAction = controlAction;
	}

	public String getControlEstablishedInSystem() {
		return controlEstablishedInSystem;
	}
	
	public void setControlEstablishedInSystem(String controlEstablishedInSystem) {
		this.controlEstablishedInSystem = controlEstablishedInSystem;
	}
	
	public Date getControlEstablishedDate() {
		return controlEstablishedDate;
	}

	public void setControlEstablishedDate(Date controlEstablishedDate) {
		this.controlEstablishedDate = controlEstablishedDate;
	}
	
	public Integer getSustenancePresenceOfControl() {
		return sustenancePresenceOfControl;
	}

	public void setSustenancePresenceOfControl(Integer sustenancePresenceOfControl) {
		this.sustenancePresenceOfControl = sustenancePresenceOfControl;
	}
	
	public String getSustenanceAuditComments() {
		return sustenanceAuditComments;
	}

	public void setSustenanceAuditComments(String sustenanceAuditComments) {
		this.sustenanceAuditComments = sustenanceAuditComments;
	}
	
	public M_User getControlCreatedBy() {
		return controlCreatedBy;
	}

	public void setControlCreatedBy(M_User controlCreatedBy) {
		this.controlCreatedBy = controlCreatedBy;
	}

	public Date getControlCreatedOn() {
		return controlCreatedOn;
	}

	public void setControlCreatedOn(Date controlCreatedOn) {
		this.controlCreatedOn = controlCreatedOn;
	}

	public Integer getActive() {
		return active;
	}

	public void setActive(Integer active) {
		this.active = active;
	}

	@Transient private String controlEstablishedInSystemTemp;
	@Transient private String controlEstablishedDateTemp;
	@Transient private String controlActionTemp;
	@Transient private Integer sustenancePresenceOfControlTemp;
	@Transient private String sustenanceAuditCommentsTemp;
	@Transient private Long tProjectCharterControlIdTemp;
		
	public String getControlActionTemp() {
		return controlActionTemp;
	}

	public void setControlActionTemp(String controlActionTemp) {
		this.controlActionTemp = controlActionTemp;
	}

	public String getControlEstablishedInSystemTemp() {
		return controlEstablishedInSystemTemp;
	}

	public void setControlEstablishedInSystemTemp(String controlEstablishedInSystemTemp) {
		this.controlEstablishedInSystemTemp = controlEstablishedInSystemTemp;
	}

	public String getControlEstablishedDateTemp() {
		return controlEstablishedDateTemp;
	}

	public void setControlEstablishedDateTemp(String controlEstablishedDateTemp) {
		this.controlEstablishedDateTemp = controlEstablishedDateTemp;
	}
	
	public Integer getSustenancePresenceOfControlTemp() {
		return sustenancePresenceOfControlTemp;
	}

	public void setSustenancePresenceOfControlTemp(Integer sustenancePresenceOfControlTemp) {
		this.sustenancePresenceOfControlTemp = sustenancePresenceOfControlTemp;
	}
	
	public String getSustenanceAuditCommentsTemp() {
		return sustenanceAuditCommentsTemp;
	}

	public void setSustenanceAuditCommentsTemp(String sustenanceAuditCommentsTemp) {
		this.sustenanceAuditCommentsTemp = sustenanceAuditCommentsTemp;
	}
	
	public Long gettProjectCharterControlIdTemp() {
		return tProjectCharterControlIdTemp;
	}

	public void settProjectCharterControlIdTemp(Long tProjectCharterControlIdTemp) {
		this.tProjectCharterControlIdTemp = tProjectCharterControlIdTemp;
	}
	
	
}