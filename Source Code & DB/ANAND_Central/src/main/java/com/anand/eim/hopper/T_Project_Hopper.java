package com.anand.eim.hopper;

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

import com.anand.eim.masters.M_Project_Function;
import com.anand.eim.masters.M_Project_Methodology;
import com.anand.eim.masters.M_Project_Type;
import com.anand.masters.M_Entity;
import com.anand.masters.M_User;

@Entity
@Table(name = "eim_t_project_hopper")
public class T_Project_Hopper implements Comparable<T_Project_Hopper> {

	@Override
	public int compareTo(T_Project_Hopper projectHopper) {
		return (int) (projectHopper.gettProjectHopperId() - this.tProjectHopperId);
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "t_project_hopper_id",unique = true, nullable = false)
	private Long tProjectHopperId;

	@OneToOne
	@JoinColumn(name = "project_function_id", nullable = true)
	private M_Project_Function projectFunctionId;

	@OneToOne
	@JoinColumn(name = "project_methodology_id", nullable = true)
	private M_Project_Methodology projectMethodologyId;

	@OneToOne
	@JoinColumn(name = "project_type_id", nullable = true)
	private M_Project_Type projectTypeId;

	@OneToOne
	@JoinColumn(name = "m_entity_id", nullable = true)
	private M_Entity mEntityId;

	@Column(name = "confidentiality")
	private Integer confidentiality; //1-Non Confidential\n2-Confidential

	@Column(name = "project_name")
	private String projectName;

	@Column(name = "project_description")
	private String projectDescription;

	@OneToOne
	@JoinColumn(name = "sponsor", nullable = true)
	private M_User sponsor;

	@OneToOne
	@JoinColumn(name = "problem_solving_leader", nullable = true)
	private M_User problemSolvingLeader;

	@OneToOne
	@JoinColumn(name = "corporate_problem_solving_leader", nullable = true)
	private M_User corporateProblemSolvingLeader;

	@OneToOne
	@JoinColumn(name = "project_leader", nullable = true)
	private M_User projectLeader;

	@Column(name = "hopper_primary_driver")
	private Integer hopperPrimaryDriver;

	@Column(name = "estimated_saving")
	private Float estimatedSaving;

	@OneToOne
	@JoinColumn(name = "hopper_created_by", nullable = true)
	private M_User hopperCreatedBy;

	@Column(name = "hopper_created_on")
	private Date hopperCreatedOn;

	@Column(name = "hopper_active")
	private Integer hopperActive;

	@OneToOne
	@JoinColumn(name = "hopper_last_updated_by", nullable = true)
	private M_User hopperLastUpdatedBy;

	@Column(name = "hopper_last_updated_on")
	private Date hopperLastUpdatedOn;

	public Long gettProjectHopperId() {
		return tProjectHopperId;
	}

	public void settProjectHopperId(Long tProjectHopperId) {
		this.tProjectHopperId = tProjectHopperId;
	}

	public M_Project_Function getProjectFunctionId() {
		return projectFunctionId;
	}

	public void setProjectFunctionId(M_Project_Function projectFunctionId) {
		this.projectFunctionId = projectFunctionId;
	}

	public M_Project_Methodology getProjectMethodologyId() {
		return projectMethodologyId;
	}

	public void setProjectMethodologyId(M_Project_Methodology projectMethodologyId) {
		this.projectMethodologyId = projectMethodologyId;
	}

	public M_Project_Type getProjectTypeId() {
		return projectTypeId;
	}

	public void setProjectTypeId(M_Project_Type projectTypeId) {
		this.projectTypeId = projectTypeId;
	}

	public M_Entity getmEntityId() {
		return mEntityId;
	}

	public void setmEntityId(M_Entity mEntityId) {
		this.mEntityId = mEntityId;
	}

	public Integer getConfidentiality() {
		return confidentiality;
	}

	public void setConfidentiality(Integer confidentiality) {
		this.confidentiality = confidentiality;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getProjectDescription() {
		return projectDescription;
	}

	public void setProjectDescription(String projectDescription) {
		this.projectDescription = projectDescription;
	}

	public M_User getSponsor() {
		return sponsor;
	}

	public void setSponsor(M_User sponsor) {
		this.sponsor = sponsor;
	}

	public M_User getProblemSolvingLeader() {
		return problemSolvingLeader;
	}

	public void setProblemSolvingLeader(M_User problemSolvingLeader) {
		this.problemSolvingLeader = problemSolvingLeader;
	}

	public M_User getCorporateProblemSolvingLeader() {
		return corporateProblemSolvingLeader;
	}

	public void setCorporateProblemSolvingLeader(M_User corporateProblemSolvingLeader) {
		this.corporateProblemSolvingLeader = corporateProblemSolvingLeader;
	}

	public M_User getProjectLeader() {
		return projectLeader;
	}

	public void setProjectLeader(M_User projectLeader) {
		this.projectLeader = projectLeader;
	}

	public Integer getHopperPrimaryDriver() {
		return hopperPrimaryDriver;
	}

	public void setHopperPrimaryDriver(Integer hopperPrimaryDriver) {
		this.hopperPrimaryDriver = hopperPrimaryDriver;
	}

	public Float getEstimatedSaving() {
		return estimatedSaving;
	}

	public void setEstimatedSaving(Float estimatedSaving) {
		this.estimatedSaving = estimatedSaving;
	}

	public M_User getHopperCreatedBy() {
		return hopperCreatedBy;
	}

	public void setHopperCreatedBy(M_User hopperCreatedBy) {
		this.hopperCreatedBy = hopperCreatedBy;
	}

	public Date getHopperCreatedOn() {
		return hopperCreatedOn;
	}

	public void setHopperCreatedOn(Date hopperCreatedOn) {
		this.hopperCreatedOn = hopperCreatedOn;
	}

	public Integer getHopperActive() {
		return hopperActive;
	}

	public void setHopperActive(Integer hopperActive) {
		this.hopperActive = hopperActive;
	}

	public M_User getHopperLastUpdatedBy() {
		return hopperLastUpdatedBy;
	}

	public void setHopperLastUpdatedBy(M_User hopperLastUpdatedBy) {
		this.hopperLastUpdatedBy = hopperLastUpdatedBy;
	}

	public Date getHopperLastUpdatedOn() {
		return hopperLastUpdatedOn;
	}

	public void setHopperLastUpdatedOn(Date hopperLastUpdatedOn) {
		this.hopperLastUpdatedOn = hopperLastUpdatedOn;
	}

	@OneToMany(mappedBy="projectHopperHistory")
	private Set<T_Project_Hopper_History> projectHopperHistory;

	public Set<T_Project_Hopper_History> getProjectHopperHistory() {
		return projectHopperHistory;
	}

	public void setProjectHopperHistory(Set<T_Project_Hopper_History> projectHopperHistory) {
		this.projectHopperHistory = projectHopperHistory;
	}

	@Transient private Integer functionTemp;
	@Transient private Integer metheodologyTemp;
	@Transient private Integer typeTemp;
	@Transient private Integer companyTemp;
	@Transient private Integer sponsorTemp;
	@Transient private Integer problemSolvingLeaderTemp;
	@Transient private Integer corporateProblemSolvingLeaderTemp;
	@Transient private Integer projectLeaderTemp;

	public Integer getFunctionTemp() {
		return functionTemp;
	}

	public void setFunctionTemp(Integer functionTemp) {
		this.functionTemp = functionTemp;
	}

	public Integer getMetheodologyTemp() {
		return metheodologyTemp;
	}

	public void setMetheodologyTemp(Integer metheodologyTemp) {
		this.metheodologyTemp = metheodologyTemp;
	}

	public Integer getTypeTemp() {
		return typeTemp;
	}

	public void setTypeTemp(Integer typeTemp) {
		this.typeTemp = typeTemp;
	}

	public Integer getSponsorTemp() {
		return sponsorTemp;
	}

	public void setSponsorTemp(Integer sponsorTemp) {
		this.sponsorTemp = sponsorTemp;
	}

	public Integer getCompanyTemp() {
		return companyTemp;
	}

	public void setCompanyTemp(Integer companyTemp) {
		this.companyTemp = companyTemp;
	}

	public Integer getProblemSolvingLeaderTemp() {
		return problemSolvingLeaderTemp;
	}

	public void setProblemSolvingLeaderTemp(Integer problemSolvingLeaderTemp) {
		this.problemSolvingLeaderTemp = problemSolvingLeaderTemp;
	}

	public Integer getCorporateProblemSolvingLeaderTemp() {
		return corporateProblemSolvingLeaderTemp;
	}

	public void setCorporateProblemSolvingLeaderTemp(Integer corporateProblemSolvingLeaderTemp) {
		this.corporateProblemSolvingLeaderTemp = corporateProblemSolvingLeaderTemp;
	}

	public Integer getProjectLeaderTemp() {
		return projectLeaderTemp;
	}

	public void setProjectLeaderTemp(Integer projectLeaderTemp) {
		this.projectLeaderTemp = projectLeaderTemp;
	}
}