package com.anand.eim.charter;

import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.anand.eim.hopper.T_Project_Hopper;
import com.anand.eim.masters.M_Project_Function;
import com.anand.eim.masters.M_Project_Methodology;
import com.anand.eim.masters.M_Project_Type;
import com.anand.masters.M_Entity;
import com.anand.masters.M_User;


@Entity
@Table(name = "eim_t_project_charter")
public class T_Project_Charter implements Comparable<T_Project_Charter> {

	@Override
	public int compareTo(T_Project_Charter projectCharter) {
		return (int) (projectCharter.gettProjectCharterId() - this.tProjectCharterId);
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "t_project_charter_id",unique = true, nullable = false)
	private Long tProjectCharterId;

	@OneToOne
	@JoinColumn(name = "t_project_hopper_id", nullable = true)
	private T_Project_Hopper tProjectHopperId;

	@Column(name = "project_charter_code")
	private String projectCharterCode;

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
	private Integer confidentiality;

	@Column(name = "project_name")
	private String projectName;

	@Column(name = "project_description")
	private String projectDescription;

	@OneToOne
	@JoinColumn(name = "sponsor", nullable = true)
	private M_User sponsor;

	@OneToOne
	@JoinColumn(name = "process_owner", nullable = true)
	private M_User processOwner;

	@OneToOne
	@JoinColumn(name = "finance_controller", nullable = true)
	private M_User financeController;

	@OneToOne
	@JoinColumn(name = "problem_solving_leader", nullable = true)
	private M_User problemSolvingLeader;

	@OneToOne
	@JoinColumn(name = "corporate_problem_solving_leader", nullable = true)
	private M_User corporateProblemSolvingLeader;

	@OneToOne
	@JoinColumn(name = "project_leader", nullable = true)
	private M_User projectLeader;

	@OneToOne
	@JoinColumn(name = "business_head", nullable = true)
	private M_User businessHead;

	@OneToOne
	@JoinColumn(name = "additional_reader", nullable = true)
	private M_User additionalReader;

	@OneToOne
	@JoinColumn(name = "additional_sponsor", nullable = true)
	private M_User additionalSponsor;

	@Column(name = "project_charter_status")
	private Integer projectCharterStatus;
	//0-Save, 1-Submit, 2-CharterApproved, 3-CharterRejected
	//4-ContractEdit, 5-Contract Submitted, 6-Contract Approved
	//7-Contract Rejected, 8-Closure Submitted, 9-Closure Approved
	//10-Closure Rejected, 11-Sustenance Audit Pending

	@Column(name = "charter_primary_driver")
	private Integer charterPrimaryDriver;

	@Column(name = "estimated_saving")
	private Float estimatedSaving;

	@OneToOne
	@JoinColumn(name = "charter_created_by", nullable = true)
	private M_User charterCreatedBy;

	@Column(name = "charter_created_on")
	private Date charterCreatedOn;

	@Column(name = "charter_active")
	private Integer charterActive;

	@OneToOne
	@JoinColumn(name = "charter_last_updated_by", nullable = true)
	private M_User charterLastUpdatedBy;

	@Column(name = "charter_last_updated_on")
	private Date charterLastUpdatedOn;

	@Column(name = "count_for_certification")
	private Integer countForCertification;

	@Column(name = "aligned_for_business_goal_tree")
	private Integer alignedForBusinessGoalTree;

	@Column(name = "falls_under_sponsor_functional_area")
	private Integer fallsUnderSponsorFunctionalArea;

	@Column(name = "estimated_start_date")
	private Date estimatedStartDate;

	@Column(name = "estimated_end_date")
	private Date estimatedEndDate;

	@Column(name = "estimated_throughput_days")
	private Integer estimatedThroughputDays;

	@Column(name = "launch_date")
	private Date launchDate;

	@Column(name = "actual_throughput_days")
	private Integer actualThroughputDays;

	@Column(name = "define_date")
	private Date defineDate;

	@Column(name = "measure_date")
	private Date measureDate;

	@Column(name = "analyze_date")
	private Date analyzeDate;

	@Column(name = "improve_days")
	private Date improveDays;

	@Column(name = "closure_date")
	private Date closureDate;

	@Column(name = "annual_cost_saving")
	private Integer annualCostSaving;

	@Column(name = "annual_tax_saving")
	private Integer annualTaxSaving;

	@Column(name = "net_annual_profit_improvement")
	private Integer netAnnualProfitImprovement;

	@Column(name = "completion_year_cost_saving")
	private Integer completionYearCostSaving;

	@Column(name = "one_time_cost_to_implement")
	private Integer oneTimeCostToImplement;

	@Column(name = "net_completion_year_profit_improvement")
	private Integer netCompletionYearProfitImprovement;

	@Column(name = "annual_avoidance_cost_saving")
	private Integer annualAvoidanceCostSaving;

	@Column(name = "annual_interest_saving")
	private Integer annualInterestSaving;

	@Column(name = "completion_year_avoidance_cost")
	private Integer completionYearAvoidanceCost;

	@Column(name = "external_customer_savings")
	private Integer externalCustomerSavings;

	@Column(name = "hopper_estimate_comment")
	private String hopperEstimateComment;

	@Column(name = "new_estimate_comment_during_contract")
	private String newEstimateCommentDuringContract;

	@Column(name = "project_status")
	private Integer projectStatus;

	@Column(name = "supply_chain_improvement_project")
	private Integer supplyChainImprovementProject;

	@Column(name = "supplier_focus_project")
	private Integer supplierFocusProject;

	@Column(name = "project_warranty_focus")
	private Integer projectWarrantyFocus;

	@Column(name = "warranty_focus_state")
	private Integer warrantyFocusState;

	@Column(name = "external_customer_focus_project")
	private Integer externalCustomerFocusProject;

	@Column(name = "name_of_customer")
	private String nameOfCustomer;

	@Column(name = "contact_person_name")
	private String contactPersonName;

	@Column(name = "inter_company_customer_focus_project")
	private Integer interCompanyCustomerFocusProject;

	@Column(name = "process_or_product_oppterrunity_exists")
	private String processOrProductOppterrunityExists;

	@Column(name = "quality_baseline")
	private Integer qualityBaseline;

	@Column(name = "quality_goal")
	private Integer qualityGoal;

	@Column(name = "quality_entitlement")
	private Integer qualityEntitlement;

	@Column(name = "quality_unit_of_measure")
	private Integer qualityUnitOfMeasure;

	@Column(name = "cost_baseline")
	private Integer costBaseline;

	@Column(name = "cost_goal")
	private Integer costGoal;

	@Column(name = "cost_entitlement")
	private Integer costEntitlement;

	@Column(name = "cost_unit_of_measure")
	private Integer costUnitOfMeasure;

	@Column(name = "saving_or_gains")
	private Integer savingOrGains;

	@Column(name = "project_team_member_internal")
	private String projectTeamMemberInternal;

	@Column(name = "project_team_member_external")
	private String projectTeamMemberExternal;

	@Column(name = "project_scope")
	private String projectScope;

	@Column(name = "impact_to_external_customer_or_other_intercompany_customer")
	private String impactToExternalCustomerOrOtherIntercompanyCustomer;

	@Column(name = "support_required")
	private String supportRequired;

	@Column(name = "cycle_count")
	private Integer cycleCount;

	@Column(name = "charter_attachment_name")
	private String charterAttachmentName;

	@Column(name = "charter_attachment_type")
	private String charterAttachmentType;

	@Column(name = "charter_attachment")
	@Lob
	private byte[] charterAttachment;
	
	@Column(name = "final_presentation_name")
	private String finalPresentationName;

	@Column(name = "final_presentation_type")
	private String finalPresentationType;

	@Column(name = "final_presentation")
	@Lob
	private byte[] finalPresentation;
	
	@Column(name = "final_closure_presentation_name")
	private String finalClosurePresentationName;

	@Column(name = "final_closure_presentation_type")
	private String finalClosurePresentationType;

	@Column(name = "final_closure_presentation")
	@Lob
	private byte[] finalClosurePresentation;
	
	@OneToMany(mappedBy="projectCharterReview")
    private Set<T_Project_Charter_Review> projectCharterReview;

    @OneToMany(mappedBy="projectCharterControl")
    private Set<T_Project_Charter_Control> projectCharterControl;
    
    @OneToOne
	@JoinColumn(name = "sustenance_problem_solving_leader", nullable = true)
	private M_User sustenanceProblemSolvingLeader;
    
    @Column(name = "sustenance_audit_target")
	private Date sustenanceAuditTarget;
    
    @Column(name = "sustenance_comments")
	private String sustenanceComments;
    
    @Column(name = "sustenance_score")
	private Integer sustenanceScore;

	public Long gettProjectCharterId() {
		return tProjectCharterId;
	}

	public void settProjectCharterId(Long tProjectCharterId) {
		this.tProjectCharterId = tProjectCharterId;
	}

	public T_Project_Hopper gettProjectHopperId() {
		return tProjectHopperId;
	}

	public void settProjectHopperId(T_Project_Hopper tProjectHopperId) {
		this.tProjectHopperId = tProjectHopperId;
	}

	public String getProjectCharterCode() {
		return projectCharterCode;
	}

	public void setProjectCharterCode(String projectCharterCode) {
		this.projectCharterCode = projectCharterCode;
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

	public M_User getProcessOwner() {
		return processOwner;
	}

	public void setProcessOwner(M_User processOwner) {
		this.processOwner = processOwner;
	}

	public M_User getFinanceController() {
		return financeController;
	}

	public void setFinanceController(M_User financeController) {
		this.financeController = financeController;
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

	public M_User getBusinessHead() {
		return businessHead;
	}

	public void setBusinessHead(M_User businessHead) {
		this.businessHead = businessHead;
	}

	public M_User getAdditionalReader() {
		return additionalReader;
	}

	public void setAdditionalReader(M_User additionalReader) {
		this.additionalReader = additionalReader;
	}

	public M_User getAdditionalSponsor() {
		return additionalSponsor;
	}

	public void setAdditionalSponsor(M_User additionalSponsor) {
		this.additionalSponsor = additionalSponsor;
	}

	public Integer getProjectCharterStatus() {
		return projectCharterStatus;
	}

	public void setProjectCharterStatus(Integer projectCharterStatus) {
		this.projectCharterStatus = projectCharterStatus;
	}

	public Integer getCharterPrimaryDriver() {
		return charterPrimaryDriver;
	}

	public void setCharterPrimaryDriver(Integer charterPrimaryDriver) {
		this.charterPrimaryDriver = charterPrimaryDriver;
	}

	public Float getEstimatedSaving() {
		return estimatedSaving;
	}

	public void setEstimatedSaving(Float estimatedSaving) {
		this.estimatedSaving = estimatedSaving;
	}

	public M_User getCharterCreatedBy() {
		return charterCreatedBy;
	}

	public void setCharterCreatedBy(M_User charterCreatedBy) {
		this.charterCreatedBy = charterCreatedBy;
	}

	public Date getCharterCreatedOn() {
		return charterCreatedOn;
	}

	public void setCharterCreatedOn(Date charterCreatedOn) {
		this.charterCreatedOn = charterCreatedOn;
	}

	public Integer getCharterActive() {
		return charterActive;
	}

	public void setCharterActive(Integer charterActive) {
		this.charterActive = charterActive;
	}

	public M_User getCharterLastUpdatedBy() {
		return charterLastUpdatedBy;
	}

	public void setCharterLastUpdatedBy(M_User charterLastUpdatedBy) {
		this.charterLastUpdatedBy = charterLastUpdatedBy;
	}

	public Date getCharterLastUpdatedOn() {
		return charterLastUpdatedOn;
	}

	public void setCharterLastUpdatedOn(Date charterLastUpdatedOn) {
		this.charterLastUpdatedOn = charterLastUpdatedOn;
	}

	public Integer getCountForCertification() {
		return countForCertification;
	}

	public void setCountForCertification(Integer countForCertification) {
		this.countForCertification = countForCertification;
	}

	public Integer getAlignedForBusinessGoalTree() {
		return alignedForBusinessGoalTree;
	}

	public void setAlignedForBusinessGoalTree(Integer alignedForBusinessGoalTree) {
		this.alignedForBusinessGoalTree = alignedForBusinessGoalTree;
	}

	public Integer getFallsUnderSponsorFunctionalArea() {
		return fallsUnderSponsorFunctionalArea;
	}

	public void setFallsUnderSponsorFunctionalArea(Integer fallsUnderSponsorFunctionalArea) {
		this.fallsUnderSponsorFunctionalArea = fallsUnderSponsorFunctionalArea;
	}

	public Date getEstimatedStartDate() {
		return estimatedStartDate;
	}

	public void setEstimatedStartDate(Date estimatedStartDate) {
		this.estimatedStartDate = estimatedStartDate;
	}

	public Date getEstimatedEndDate() {
		return estimatedEndDate;
	}

	public void setEstimatedEndDate(Date estimatedEndDate) {
		this.estimatedEndDate = estimatedEndDate;
	}

	public Integer getEstimatedThroughputDays() {
		return estimatedThroughputDays;
	}

	public void setEstimatedThroughputDays(Integer estimatedThroughputDays) {
		this.estimatedThroughputDays = estimatedThroughputDays;
	}

	public Date getLaunchDate() {
		return launchDate;
	}

	public void setLaunchDate(Date launchDate) {
		this.launchDate = launchDate;
	}

	public Integer getActualThroughputDays() {
		return actualThroughputDays;
	}

	public void setActualThroughputDays(Integer actualThroughputDays) {
		this.actualThroughputDays = actualThroughputDays;
	}

	public Date getDefineDate() {
		return defineDate;
	}

	public void setDefineDate(Date defineDate) {
		this.defineDate = defineDate;
	}

	public Date getMeasureDate() {
		return measureDate;
	}

	public void setMeasureDate(Date measureDate) {
		this.measureDate = measureDate;
	}

	public Date getAnalyzeDate() {
		return analyzeDate;
	}

	public void setAnalyzeDate(Date analyzeDate) {
		this.analyzeDate = analyzeDate;
	}

	public Date getImproveDays() {
		return improveDays;
	}

	public void setImproveDays(Date improveDays) {
		this.improveDays = improveDays;
	}

	public Date getClosureDate() {
		return closureDate;
	}

	public void setClosureDate(Date closureDate) {
		this.closureDate = closureDate;
	}

	public Integer getAnnualCostSaving() {
		return annualCostSaving;
	}

	public void setAnnualCostSaving(Integer annualCostSaving) {
		this.annualCostSaving = annualCostSaving;
	}

	public Integer getAnnualTaxSaving() {
		return annualTaxSaving;
	}

	public void setAnnualTaxSaving(Integer annualTaxSaving) {
		this.annualTaxSaving = annualTaxSaving;
	}

	public Integer getNetAnnualProfitImprovement() {
		return netAnnualProfitImprovement;
	}

	public void setNetAnnualProfitImprovement(Integer netAnnualProfitImprovement) {
		this.netAnnualProfitImprovement = netAnnualProfitImprovement;
	}

	public Integer getCompletionYearCostSaving() {
		return completionYearCostSaving;
	}

	public void setCompletionYearCostSaving(Integer completionYearCostSaving) {
		this.completionYearCostSaving = completionYearCostSaving;
	}

	public Integer getOneTimeCostToImplement() {
		return oneTimeCostToImplement;
	}

	public void setOneTimeCostToImplement(Integer oneTimeCostToImplement) {
		this.oneTimeCostToImplement = oneTimeCostToImplement;
	}

	public Integer getNetCompletionYearProfitImprovement() {
		return netCompletionYearProfitImprovement;
	}

	public void setNetCompletionYearProfitImprovement(Integer netCompletionYearProfitImprovement) {
		this.netCompletionYearProfitImprovement = netCompletionYearProfitImprovement;
	}

	public Integer getAnnualAvoidanceCostSaving() {
		return annualAvoidanceCostSaving;
	}

	public void setAnnualAvoidanceCostSaving(Integer annualAvoidanceCostSaving) {
		this.annualAvoidanceCostSaving = annualAvoidanceCostSaving;
	}

	public Integer getAnnualInterestSaving() {
		return annualInterestSaving;
	}

	public void setAnnualInterestSaving(Integer annualInterestSaving) {
		this.annualInterestSaving = annualInterestSaving;
	}

	public Integer getCompletionYearAvoidanceCost() {
		return completionYearAvoidanceCost;
	}

	public void setCompletionYearAvoidanceCost(Integer completionYearAvoidanceCost) {
		this.completionYearAvoidanceCost = completionYearAvoidanceCost;
	}

	public Integer getExternalCustomerSavings() {
		return externalCustomerSavings;
	}

	public void setExternalCustomerSavings(Integer externalCustomerSavings) {
		this.externalCustomerSavings = externalCustomerSavings;
	}

	public String getHopperEstimateComment() {
		return hopperEstimateComment;
	}

	public void setHopperEstimateComment(String hopperEstimateComment) {
		this.hopperEstimateComment = hopperEstimateComment;
	}

	public String getNewEstimateCommentDuringContract() {
		return newEstimateCommentDuringContract;
	}

	public void setNewEstimateCommentDuringContract(String newEstimateCommentDuringContract) {
		this.newEstimateCommentDuringContract = newEstimateCommentDuringContract;
	}

	public Integer getProjectStatus() {
		return projectStatus;
	}

	public void setProjectStatus(Integer projectStatus) {
		this.projectStatus = projectStatus;
	}

	public Integer getSupplyChainImprovementProject() {
		return supplyChainImprovementProject;
	}

	public void setSupplyChainImprovementProject(Integer supplyChainImprovementProject) {
		this.supplyChainImprovementProject = supplyChainImprovementProject;
	}

	public Integer getSupplierFocusProject() {
		return supplierFocusProject;
	}

	public void setSupplierFocusProject(Integer supplierFocusProject) {
		this.supplierFocusProject = supplierFocusProject;
	}

	public Integer getProjectWarrantyFocus() {
		return projectWarrantyFocus;
	}

	public void setProjectWarrantyFocus(Integer projectWarrantyFocus) {
		this.projectWarrantyFocus = projectWarrantyFocus;
	}

	public Integer getWarrantyFocusState() {
		return warrantyFocusState;
	}

	public void setWarrantyFocusState(Integer warrantyFocusState) {
		this.warrantyFocusState = warrantyFocusState;
	}

	public Integer getExternalCustomerFocusProject() {
		return externalCustomerFocusProject;
	}

	public void setExternalCustomerFocusProject(Integer externalCustomerFocusProject) {
		this.externalCustomerFocusProject = externalCustomerFocusProject;
	}

	public String getNameOfCustomer() {
		return nameOfCustomer;
	}

	public void setNameOfCustomer(String nameOfCustomer) {
		this.nameOfCustomer = nameOfCustomer;
	}

	public String getContactPersonName() {
		return contactPersonName;
	}

	public void setContactPersonName(String contactPersonName) {
		this.contactPersonName = contactPersonName;
	}

	public Integer getInterCompanyCustomerFocusProject() {
		return interCompanyCustomerFocusProject;
	}

	public void setInterCompanyCustomerFocusProject(Integer interCompanyCustomerFocusProject) {
		this.interCompanyCustomerFocusProject = interCompanyCustomerFocusProject;
	}

	public String getProcessOrProductOppterrunityExists() {
		return processOrProductOppterrunityExists;
	}

	public void setProcessOrProductOppterrunityExists(String processOrProductOppterrunityExists) {
		this.processOrProductOppterrunityExists = processOrProductOppterrunityExists;
	}

	public Integer getQualityBaseline() {
		return qualityBaseline;
	}

	public void setQualityBaseline(Integer qualityBaseline) {
		this.qualityBaseline = qualityBaseline;
	}

	public Integer getQualityGoal() {
		return qualityGoal;
	}

	public void setQualityGoal(Integer qualityGoal) {
		this.qualityGoal = qualityGoal;
	}

	public Integer getQualityEntitlement() {
		return qualityEntitlement;
	}

	public void setQualityEntitlement(Integer qualityEntitlement) {
		this.qualityEntitlement = qualityEntitlement;
	}

	public Integer getQualityUnitOfMeasure() {
		return qualityUnitOfMeasure;
	}

	public void setQualityUnitOfMeasure(Integer qualityUnitOfMeasure) {
		this.qualityUnitOfMeasure = qualityUnitOfMeasure;
	}

	public Integer getCostBaseline() {
		return costBaseline;
	}

	public void setCostBaseline(Integer costBaseline) {
		this.costBaseline = costBaseline;
	}

	public Integer getCostGoal() {
		return costGoal;
	}

	public void setCostGoal(Integer costGoal) {
		this.costGoal = costGoal;
	}

	public Integer getCostEntitlement() {
		return costEntitlement;
	}

	public void setCostEntitlement(Integer costEntitlement) {
		this.costEntitlement = costEntitlement;
	}

	public Integer getCostUnitOfMeasure() {
		return costUnitOfMeasure;
	}

	public void setCostUnitOfMeasure(Integer costUnitOfMeasure) {
		this.costUnitOfMeasure = costUnitOfMeasure;
	}

	public Integer getSavingOrGains() {
		return savingOrGains;
	}

	public void setSavingOrGains(Integer savingOrGains) {
		this.savingOrGains = savingOrGains;
	}

	public String getProjectTeamMemberInternal() {
		return projectTeamMemberInternal;
	}

	public void setProjectTeamMemberInternal(String projectTeamMemberInternal) {
		this.projectTeamMemberInternal = projectTeamMemberInternal;
	}

	public String getProjectTeamMemberExternal() {
		return projectTeamMemberExternal;
	}

	public void setProjectTeamMemberExternal(String projectTeamMemberExternal) {
		this.projectTeamMemberExternal = projectTeamMemberExternal;
	}

	public String getProjectScope() {
		return projectScope;
	}

	public void setProjectScope(String projectScope) {
		this.projectScope = projectScope;
	}

	public String getImpactToExternalCustomerOrOtherIntercompanyCustomer() {
		return impactToExternalCustomerOrOtherIntercompanyCustomer;
	}

	public void setImpactToExternalCustomerOrOtherIntercompanyCustomer(
			String impactToExternalCustomerOrOtherIntercompanyCustomer) {
		this.impactToExternalCustomerOrOtherIntercompanyCustomer = impactToExternalCustomerOrOtherIntercompanyCustomer;
	}

	public String getSupportRequired() {
		return supportRequired;
	}

	public void setSupportRequired(String supportRequired) {
		this.supportRequired = supportRequired;
	}

	public Integer getCycleCount() {
		return cycleCount;
	}

	public void setCycleCount(Integer cycleCount) {
		this.cycleCount = cycleCount;
	}

	public String getCharterAttachmentName() {
		return charterAttachmentName;
	}

	public void setCharterAttachmentName(String charterAttachmentName) {
		this.charterAttachmentName = charterAttachmentName;
	}

	public String getCharterAttachmentType() {
		return charterAttachmentType;
	}

	public void setCharterAttachmentType(String charterAttachmentType) {
		this.charterAttachmentType = charterAttachmentType;
	}

	public byte[] getCharterAttachment() {
		return charterAttachment;
	}

	public void setCharterAttachment(byte[] charterAttachment) {
		this.charterAttachment = charterAttachment;
	}
	
	public String getFinalPresentationName() {
		return finalPresentationName;
	}

	public void setFinalPresentationName(String finalPresentationName) {
		this.finalPresentationName = finalPresentationName;
	}

	public String getFinalPresentationType() {
		return finalPresentationType;
	}

	public void setFinalPresentationType(String finalPresentationType) {
		this.finalPresentationType = finalPresentationType;
	}

	public byte[] getFinalPresentation() {
		return finalPresentation;
	}

	public void setFinalPresentation(byte[] finalPresentation) {
		this.finalPresentation = finalPresentation;
	}
	
	public String getFinalClosurePresentationName() {
		return finalClosurePresentationName;
	}

	public void setFinalClosurePresentationName(String finalClosurePresentationName) {
		this.finalClosurePresentationName = finalClosurePresentationName;
	}

	public String getFinalClosurePresentationType() {
		return finalClosurePresentationType;
	}

	public void setFinalClosurePresentationType(String finalClosurePresentationType) {
		this.finalClosurePresentationType = finalClosurePresentationType;
	}

	public byte[] getFinalClosurePresentation() {
		return finalClosurePresentation;
	}

	public void setFinalClosurePresentation(byte[] finalClosurePresentation) {
		this.finalClosurePresentation = finalClosurePresentation;
	}

	@OneToMany(mappedBy="projectCharterHistory")
	private Set<T_Project_Charter_History> projectCharterHistory;

	public Set<T_Project_Charter_History> getProjectCharterHistory() {
		return projectCharterHistory;
	}

	public void setProjectCharterHistory(Set<T_Project_Charter_History> projectCharterHistory) {
		this.projectCharterHistory = projectCharterHistory;
	}
	
	@OneToMany(mappedBy="projectCharterApproval")
	private Set<T_Project_Charter_Approval> projectCharterApproval;

	public Set<T_Project_Charter_Approval> getProjectCharterApproval() {
		return projectCharterApproval;
	}

	public void setProjectCharterApproval(Set<T_Project_Charter_Approval> projectCharterApproval) {
		this.projectCharterApproval = projectCharterApproval;
	}
	
	@OneToMany(mappedBy="projectContractApproval")
	private Set<T_Project_Contract_Approval> projectContractApproval;

	public Set<T_Project_Contract_Approval> getProjectContractApproval() {
		return projectContractApproval;
	}

	public void setProjectContractApproval(Set<T_Project_Contract_Approval> projectContractApproval) {
		this.projectContractApproval = projectContractApproval;
	}
	
	@OneToMany(mappedBy="projectClosureApproval")
	private Set<T_Project_Closure_Approval> projectClosureApproval;

	public Set<T_Project_Closure_Approval> getProjectClosureApproval() {
		return projectClosureApproval;
	}

	public void setProjectClosureApproval(Set<T_Project_Closure_Approval> projectClosureApproval) {
		this.projectClosureApproval = projectClosureApproval;
	}

	public Set<T_Project_Charter_Review> getProjectCharterReview() {
		return projectCharterReview;
	}

	public void setProjectCharterReview(Set<T_Project_Charter_Review> projectCharterReview) {
		this.projectCharterReview = projectCharterReview;
	}
	
	public Set<T_Project_Charter_Control> getProjectCharterControl() {
		return projectCharterControl;
	}

	public void setProjectCharterControl(Set<T_Project_Charter_Control> projectCharterControl) {
		this.projectCharterControl = projectCharterControl;
	}
	
	public M_User getSustenanceProblemSolvingLeader() {
		return sustenanceProblemSolvingLeader;
	}

	public void setSustenanceProblemSolvingLeader(M_User sustenanceProblemSolvingLeader) {
		this.sustenanceProblemSolvingLeader = sustenanceProblemSolvingLeader;
	}
	
	public Date getSustenanceAuditTarget() {
		return sustenanceAuditTarget;
	}

	public void setSustenanceAuditTarget(Date sustenanceAuditTarget) {
		this.sustenanceAuditTarget = sustenanceAuditTarget;
	}
	
	public String getSustenanceComments() {
		return sustenanceComments;
	}

	public void setSustenanceComments(String sustenanceComments) {
		this.sustenanceComments = sustenanceComments;
	}
	
	public Integer getSustenanceScore() {
		return sustenanceScore;
	}

	public void setSustenanceScore(Integer sustenanceScore) {
		this.sustenanceScore = sustenanceScore;
	}
	
	@Transient private Integer saveOrSubmit;
	public Integer getSaveOrSubmit() {
		return saveOrSubmit;
	}

	public void setSaveOrSubmit(Integer saveOrSubmit) {
		this.saveOrSubmit = saveOrSubmit;
	}

	@Transient private Integer functionTemp;
	@Transient private Integer metheodologyTemp;
	@Transient private Integer typeTemp;
	@Transient private Integer companyTemp;
	@Transient private Integer locationTemp;
	@Transient private Integer sponsorTemp;
	@Transient private Integer financeControllerTemp;
	@Transient private Integer processOwnerTemp;
	@Transient private Integer problemSolvingLeaderTemp;
	@Transient private Integer corporateProblemSolvingLeaderTemp;
	@Transient private Integer projectLeaderTemp;
	@Transient private Integer businessHeadTemp;
	@Transient private Integer additionalProjectLeaderTemp;
	@Transient private Integer additionalSponsorTemp;
	@Transient private Integer sustenanceProblemSolvingLeaderTemp;
	
	@Transient private String estimatedStartDateTemp;
	@Transient private String estimatedEndDateTemp;
	@Transient private Integer estimatedThroughPutDaysTemp;
	@Transient private String launchDateTemp;
	@Transient private Integer actualThroughputDaysTemp;
	@Transient private String defineDateTemp;
	@Transient private String measureDateTemp;
	@Transient private String analyzeDateTemp;
	@Transient private String improveDaysTemp;
	@Transient private String closureDateTemp;
	@Transient private String approvalPendingWith;
	@Transient private String contractApprovalPendingWith;
	@Transient private String closureApprovalPendingWith;
	@Transient private String sustenanceAuditTargetTemp;
	@Transient private String sustenanceAuditPendingWith;

	@Transient private MultipartFile tempCharterAttachment;
	@Transient private MultipartFile tempFinalPresentation;
	@Transient private MultipartFile tempFinalClosurePresentation;
	@Transient private List<T_Project_Charter_Review> reviewListTemp;
	@Transient private List<T_Project_Charter_Control> controlListTemp;

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

	public Integer getCompanyTemp() {
		return companyTemp;
	}

	public void setCompanyTemp(Integer companyTemp) {
		this.companyTemp = companyTemp;
	}

	public Integer getLocationTemp() {
		return locationTemp;
	}

	public void setLocationTemp(Integer locationTemp) {
		this.locationTemp = locationTemp;
	}

	public Integer getSponsorTemp() {
		return sponsorTemp;
	}

	public void setSponsorTemp(Integer sponsorTemp) {
		this.sponsorTemp = sponsorTemp;
	}

	public Integer getFinanceControllerTemp() {
		return financeControllerTemp;
	}

	public void setFinanceControllerTemp(Integer financeControllerTemp) {
		this.financeControllerTemp = financeControllerTemp;
	}

	public Integer getProcessOwnerTemp() {
		return processOwnerTemp;
	}

	public void setProcessOwnerTemp(Integer processOwnerTemp) {
		this.processOwnerTemp = processOwnerTemp;
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

	public Integer getBusinessHeadTemp() {
		return businessHeadTemp;
	}

	public void setBusinessHeadTemp(Integer businessHeadTemp) {
		this.businessHeadTemp = businessHeadTemp;
	}

	public Integer getAdditionalProjectLeaderTemp() {
		return additionalProjectLeaderTemp;
	}

	public void setAdditionalProjectLeaderTemp(Integer additionalProjectLeaderTemp) {
		this.additionalProjectLeaderTemp = additionalProjectLeaderTemp;
	}

	public Integer getAdditionalSponsorTemp() {
		return additionalSponsorTemp;
	}

	public void setAdditionalSponsorTemp(Integer additionalSponsorTemp) {
		this.additionalSponsorTemp = additionalSponsorTemp;
	}

	public String getEstimatedStartDateTemp() {
		return estimatedStartDateTemp;
	}

	public void setEstimatedStartDateTemp(String estimatedStartDateTemp) {
		this.estimatedStartDateTemp = estimatedStartDateTemp;
	}

	public String getEstimatedEndDateTemp() {
		return estimatedEndDateTemp;
	}

	public void setEstimatedEndDateTemp(String estimatedEndDateTemp) {
		this.estimatedEndDateTemp = estimatedEndDateTemp;
	}

	public Integer getEstimatedThroughPutDaysTemp() {
		return estimatedThroughPutDaysTemp;
	}

	public void setEstimatedThroughPutDaysTemp(Integer estimatedThroughPutDaysTemp) {
		this.estimatedThroughPutDaysTemp = estimatedThroughPutDaysTemp;
	}

	public String getLaunchDateTemp() {
		return launchDateTemp;
	}

	public void setLaunchDateTemp(String launchDateTemp) {
		this.launchDateTemp = launchDateTemp;
	}

	public Integer getActualThroughputDaysTemp() {
		return actualThroughputDaysTemp;
	}

	public void setActualThroughputDaysTemp(Integer actualThroughputDaysTemp) {
		this.actualThroughputDaysTemp = actualThroughputDaysTemp;
	}

	public String getDefineDateTemp() {
		return defineDateTemp;
	}

	public void setDefineDateTemp(String defineDateTemp) {
		this.defineDateTemp = defineDateTemp;
	}

	public String getMeasureDateTemp() {
		return measureDateTemp;
	}

	public void setMeasureDateTemp(String measureDateTemp) {
		this.measureDateTemp = measureDateTemp;
	}

	public String getAnalyzeDateTemp() {
		return analyzeDateTemp;
	}

	public void setAnalyzeDateTemp(String analyzeDateTemp) {
		this.analyzeDateTemp = analyzeDateTemp;
	}

	public String getImproveDaysTemp() {
		return improveDaysTemp;
	}

	public void setImproveDaysTemp(String improveDaysTemp) {
		this.improveDaysTemp = improveDaysTemp;
	}

	public String getClosureDateTemp() {
		return closureDateTemp;
	}

	public void setClosureDateTemp(String closureDateTemp) {
		this.closureDateTemp = closureDateTemp;
	}

	public String getApprovalPendingWith() {
		return approvalPendingWith;
	}

	public void setApprovalPendingWith(String approvalPendingWith) {
		this.approvalPendingWith = approvalPendingWith;
	}

	public String getContractApprovalPendingWith() {
		return contractApprovalPendingWith;
	}

	public void setContractApprovalPendingWith(String contractApprovalPendingWith) {
		this.contractApprovalPendingWith = contractApprovalPendingWith;
	}
	
	public String getClosureApprovalPendingWith() {
		return closureApprovalPendingWith;
	}

	public void setClosureApprovalPendingWith(String closureApprovalPendingWith) {
		this.closureApprovalPendingWith = closureApprovalPendingWith;
	}

	public MultipartFile getTempCharterAttachment() {
		return tempCharterAttachment;
	}

	public void setTempCharterAttachment(MultipartFile tempCharterAttachment) {
		this.tempCharterAttachment = tempCharterAttachment;
	}
	
	public MultipartFile getTempFinalPresentation() {
		return tempFinalPresentation;
	}

	public void setTempFinalPresentation(MultipartFile tempFinalPresentation) {
		this.tempFinalPresentation = tempFinalPresentation;
	}
	
	public MultipartFile getTempFinalClosurePresentation() {
		return tempFinalClosurePresentation;
	}

	public void setTempFinalClosurePresentation(MultipartFile tempFinalClosurePresentation) {
		this.tempFinalClosurePresentation = tempFinalClosurePresentation;
	}
	
	public List<T_Project_Charter_Review> getReviewListTemp() {
		return reviewListTemp;
	}

	public void setReviewListTemp(List<T_Project_Charter_Review> reviewListTemp) {
		this.reviewListTemp = reviewListTemp;
	}
	
	public List<T_Project_Charter_Control> getControlListTemp() {
		return controlListTemp;
	}

	public void setControlListTemp(List<T_Project_Charter_Control> controlListTemp) {
		this.controlListTemp = controlListTemp;
	}
	
	public String getSustenanceAuditTargetTemp() {
		return sustenanceAuditTargetTemp;
	}
	
	public void setSustenanceAuditTargetTemp(String sustenanceAuditTargetTemp) {
		this.sustenanceAuditTargetTemp = sustenanceAuditTargetTemp;
	}
	
	public Integer getSustenanceProblemSolvingLeaderTemp() {
		return sustenanceProblemSolvingLeaderTemp;
	}

	public void setSustenanceProblemSolvingLeaderTemp(Integer sustenanceProblemSolvingLeaderTemp) {
		this.sustenanceProblemSolvingLeaderTemp = sustenanceProblemSolvingLeaderTemp;
	}
	
	public String getSustenanceAuditPendingWith() {
		return sustenanceAuditPendingWith;
	}

	public void setSustenanceAuditPendingWith(String sustenanceAuditPendingWith) {
		this.sustenanceAuditPendingWith = sustenanceAuditPendingWith;
	}

}