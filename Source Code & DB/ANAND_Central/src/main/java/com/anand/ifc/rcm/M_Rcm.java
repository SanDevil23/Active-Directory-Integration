package com.anand.ifc.rcm;

import java.util.Date;
import java.util.List;
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

import com.anand.ifc.masters.M_Process;
import com.anand.masters.M_Department;
import com.anand.masters.M_User;

@Entity
@Table(name = "ifc_rcm_master")
public class M_Rcm {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "rcm_id",unique = true, nullable = false)
    private Long rcmId;

	@Column(name = "cntrl_no")
    private String controlNo;

	@Column(name = "cntrl_freq")
    private Integer controlFrequency;

	@Column(name = "cntrl_start_date")
    private Date controlStartDate;

	@Column(name = "key_info")
    private Integer keyInfo;
	
	@Column(name = "sub_process")
    private String subProcess;
	
	@Column(name = "process_owner")
    private String processOwner;

	@Column(name = "cntrl_objective")
    private String controlObjective;

	@Column(name = "risk")
    private String risk;

	@Column(name = "entity_cntrl")
    private String entityControl;

	@Column(name = "self_certificate_check")
    private String selfCertificateCheck;

	@Column(name = "remarks")
    private String remarks;

	@OneToOne
    @JoinColumn(name = "process_cycle", nullable = true)
    private M_Process mProcessId;

	@OneToOne
    @JoinColumn(name = "department", nullable = true)
    private M_Department mDepartmentId;

	@Column(name = "risk_rating")
    private Integer riskRating;

	@Column(name = "upload_freq")
    private Integer uploadFrequency;

	@Column(name = "fraud_risk")
    private Integer fraudRisk;

	@Column(name = "unique_referred")
    private Integer uniqueReferred;

	@Column(name = "preventive_detective")
    private Integer preventiveDetective;

	@Column(name = "cntrl_type")
    private Integer controlType;

	@Column(name = "rcm_status")
    private Integer rcmStatus;

	@Column(name = "validity_date")
    private Date validityDate;
	
	@Column(name = "rcm_created_on")
    private Date rcmCreatedOn;
	
	@OneToOne
    @JoinColumn(name = "rcm_created_by", nullable = true)
    private M_User rcmCreatedBy;

	@OneToMany(mappedBy="plantForRcm")
    private Set<M_Plant> plantForRcm;
    
    @OneToMany(mappedBy="controlReference")
    private Set<M_Transaction> controlReference;

	public Long getRcmId() {
		return rcmId;
	}

	public void setRcmId(Long rcmId) {
		this.rcmId = rcmId;
	}

	public String getControlNo() {
		return controlNo;
	}

	public void setControlNo(String controlNo) {
		this.controlNo = controlNo;
	}

	public Integer getControlFrequency() {
		return controlFrequency;
	}

	public void setControlFrequency(Integer controlFrequency) {
		this.controlFrequency = controlFrequency;
	}

	public Date getControlStartDate() {
		return controlStartDate;
	}

	public void setControlStartDate(Date controlStartDate) {
		this.controlStartDate = controlStartDate;
	}

	public Integer getKeyInfo() {
		return keyInfo;
	}

	public void setKeyInfo(Integer keyInfo) {
		this.keyInfo = keyInfo;
	}

	public String getSubProcess() {
		return subProcess;
	}

	public void setSubProcess(String subProcess) {
		this.subProcess = subProcess;
	}

	public String getProcessOwner() {
		return processOwner;
	}

	public void setProcessOwner(String processOwner) {
		this.processOwner = processOwner;
	}

	public String getControlObjective() {
		return controlObjective;
	}

	public void setControlObjective(String controlObjective) {
		this.controlObjective = controlObjective;
	}

	public String getRisk() {
		return risk;
	}

	public void setRisk(String risk) {
		this.risk = risk;
	}

	public String getEntityControl() {
		return entityControl;
	}

	public void setEntityControl(String entityControl) {
		this.entityControl = entityControl;
	}

	public String getSelfCertificateCheck() {
		return selfCertificateCheck;
	}

	public void setSelfCertificateCheck(String selfCertificateCheck) {
		this.selfCertificateCheck = selfCertificateCheck;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public M_Process getmProcessId() {
		return mProcessId;
	}

	public void setmProcessId(M_Process mProcessId) {
		this.mProcessId = mProcessId;
	}

	public M_Department getmDepartmentId() {
		return mDepartmentId;
	}

	public void setmDepartmentId(M_Department mDepartmentId) {
		this.mDepartmentId = mDepartmentId;
	}

	public Integer getRiskRating() {
		return riskRating;
	}

	public void setRiskRating(Integer riskRating) {
		this.riskRating = riskRating;
	}

	public Integer getUploadFrequency() {
		return uploadFrequency;
	}

	public void setUploadFrequency(Integer uploadFrequency) {
		this.uploadFrequency = uploadFrequency;
	}

	public Integer getFraudRisk() {
		return fraudRisk;
	}

	public void setFraudRisk(Integer fraudRisk) {
		this.fraudRisk = fraudRisk;
	}

	public Integer getUniqueReferred() {
		return uniqueReferred;
	}

	public void setUniqueReferred(Integer uniqueReferred) {
		this.uniqueReferred = uniqueReferred;
	}

	public Integer getPreventiveDetective() {
		return preventiveDetective;
	}

	public void setPreventiveDetective(Integer preventiveDetective) {
		this.preventiveDetective = preventiveDetective;
	}

	public Integer getControlType() {
		return controlType;
	}

	public void setControlType(Integer controlType) {
		this.controlType = controlType;
	}

	public Integer getRcmStatus() {
		return rcmStatus;
	}

	public void setRcmStatus(Integer rcmStatus) {
		this.rcmStatus = rcmStatus;
	}

	public Date getValidityDate() {
		return validityDate;
	}

	public void setValidityDate(Date validityDate) {
		this.validityDate = validityDate;
	}

	public Date getRcmCreatedOn() {
		return rcmCreatedOn;
	}

	public void setRcmCreatedOn(Date rcmCreatedOn) {
		this.rcmCreatedOn = rcmCreatedOn;
	}

	public M_User getRcmCreatedBy() {
		return rcmCreatedBy;
	}

	public void setRcmCreatedBy(M_User rcmCreatedBy) {
		this.rcmCreatedBy = rcmCreatedBy;
	}

	public Set<M_Plant> getPlantForRcm() {
		return plantForRcm;
	}

	public void setPlantForRcm(Set<M_Plant> plantForRcm) {
		this.plantForRcm = plantForRcm;
	}

	public Set<M_Transaction> getControlReference() {
		return controlReference;
	}

	public void setControlReference(Set<M_Transaction> controlReference) {
		this.controlReference = controlReference;
	}

	@Transient private String controlStartDateTemp;
	@Transient private String validityDateTemp;
	@Transient private String actionForList;
	@Transient private List<M_Plant> plantListTemp;
	@Transient private Integer tempDepartmentId;
	@Transient private Integer tempProcessId;
	
	public String getControlStartDateTemp() {
		return controlStartDateTemp;
	}

	public void setControlStartDateTemp(String controlStartDateTemp) {
		this.controlStartDateTemp = controlStartDateTemp;
	}

	public String getValidityDateTemp() {
		return validityDateTemp;
	}

	public void setValidityDateTemp(String validityDateTemp) {
		this.validityDateTemp = validityDateTemp;
	}

	public String getActionForList() {
		return actionForList;
	}

	public void setActionForList(String actionForList) {
		this.actionForList = actionForList;
	}

	public List<M_Plant> getPlantListTemp() {
		return plantListTemp;
	}

	public void setPlantListTemp(List<M_Plant> plantListTemp) {
		this.plantListTemp = plantListTemp;
	}

	public Integer getTempDepartmentId() {
		return tempDepartmentId;
	}

	public void setTempDepartmentId(Integer tempDepartmentId) {
		this.tempDepartmentId = tempDepartmentId;
	}

	public Integer getTempProcessId() {
		return tempProcessId;
	}

	public void setTempProcessId(Integer tempProcessId) {
		this.tempProcessId = tempProcessId;
	}

	
}