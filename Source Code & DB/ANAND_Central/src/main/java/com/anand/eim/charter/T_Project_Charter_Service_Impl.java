package com.anand.eim.charter;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.Year;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.anand.common.Common_Constants;
import com.anand.common.EncryptionDecryptionFunction;
import com.anand.common.MailService;
import com.anand.eim.masters.M_Project_Function_Dao;
import com.anand.eim.masters.M_Project_Methodology_Dao;
import com.anand.eim.masters.M_Project_Type_Dao;
import com.anand.masters.M_Entity_Dao;
import com.anand.masters.M_User;
import com.anand.masters.M_User_Dao;
import com.google.gson.Gson;

@Service
public class T_Project_Charter_Service_Impl implements T_Project_Charter_Service {

	private static final SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");

	@Autowired private T_Project_Charter_Dao projectCharterDao;
	@Autowired private T_Project_Charter_Review_Dao projectCharterReviewDao;
	@Autowired private T_Project_Charter_Control_Dao projectCharterControlDao;
	@Autowired private T_Project_Charter_Approval_Dao projectCharterApprovalDao;
	@Autowired private T_Project_Charter_Request_Terminate_Approval_Dao projectCharterRequestTerminateApprovalDao;
	@Autowired private T_Project_Contract_Approval_Dao projectContractApprovalDao;
	@Autowired private T_Project_Closure_Approval_Dao projectClosureApprovalDao;

	@Autowired private T_Project_Charter_History_Dao projectCharterHistoryDao;
	@Autowired private M_Project_Function_Dao mProjectFunctionDao;
	@Autowired private M_Project_Methodology_Dao mProjectMethodologyDao;
	@Autowired private M_Project_Type_Dao mProjectTypeDao;
	@Autowired private M_Entity_Dao mEntityDao;
	@Autowired private M_User_Dao mUserDao;
	@Autowired private MailService mailService;

	@Override
	public T_Project_Charter getCharterProjectDetail(HttpServletRequest request) {
		T_Project_Charter projectCharter = projectCharterDao.findById(Long.parseLong(""+request.getParameter("id"))).get();
		try {
			if(projectCharter.getSponsor() != null) {
				projectCharter.setSponsorTemp(Integer.parseInt(""+projectCharter.getSponsor().getmUserId()));
			}
			if(projectCharter.getProcessOwner() != null) {
				projectCharter.setProcessOwnerTemp(Integer.parseInt(""+projectCharter.getProcessOwner().getmUserId()));
			}
			if(projectCharter.getProblemSolvingLeader() != null) {
				projectCharter.setProblemSolvingLeaderTemp(Integer.parseInt(""+projectCharter.getProblemSolvingLeader().getmUserId()));
			}
			if(projectCharter.getCorporateProblemSolvingLeader() != null) {
				projectCharter.setCorporateProblemSolvingLeaderTemp(Integer.parseInt(""+projectCharter.getCorporateProblemSolvingLeader().getmUserId()));
			}
			if(projectCharter.getProjectLeader() != null) {
				projectCharter.setProjectLeaderTemp(Integer.parseInt(""+projectCharter.getProjectLeader().getmUserId()));
			}
			if(projectCharter.getProjectFunctionId() != null) {
				projectCharter.setFunctionTemp(Integer.parseInt(""+projectCharter.getProjectFunctionId().getProjectFunctionId()));
			}
			if(projectCharter.getProjectMethodologyId() != null) {
				projectCharter.setMetheodologyTemp(Integer.parseInt(""+projectCharter.getProjectMethodologyId().getProjectMethodologyId()));
			}
			if(projectCharter.getProjectTypeId() != null) {
				projectCharter.setTypeTemp(Integer.parseInt(""+projectCharter.getProjectTypeId().getProjectTypeId()));
			}
			if(projectCharter.getmEntityId() != null) {
				projectCharter.setCompanyTemp(Integer.parseInt(""+projectCharter.getmEntityId().getmEntityId()));
			}
			projectCharter.setProjectName(EncryptionDecryptionFunction.getDecryptedData(projectCharter.getProjectName()));
			if(projectCharter.getBusinessHead() != null) {
				projectCharter.setBusinessHeadTemp(Integer.parseInt(""+projectCharter.getBusinessHead().getmUserId()));
			}
			if(projectCharter.getAdditionalReader() != null) {
				projectCharter.setAdditionalProjectLeaderTemp(Integer.parseInt(""+projectCharter.getAdditionalReader().getmUserId()));
			}
			if(projectCharter.getAdditionalSponsor() != null) {
				projectCharter.setAdditionalSponsorTemp(Integer.parseInt(""+projectCharter.getAdditionalSponsor().getmUserId()));
			}
			if(projectCharter.getFinanceController() != null) {
				projectCharter.setFinanceControllerTemp(Integer.parseInt(""+projectCharter.getFinanceController().getmUserId()));
			}
			if(projectCharter.getProjectDescription() != null && !projectCharter.getProjectDescription().isEmpty()) {
				projectCharter.setProjectDescription(EncryptionDecryptionFunction.getDecryptedData(projectCharter.getProjectDescription()));
			}
			if(projectCharter.getEstimatedStartDate() != null) {
				projectCharter.setEstimatedStartDateTemp(dateFormat.format(projectCharter.getEstimatedStartDate()));
			}
			if(projectCharter.getEstimatedEndDate() != null) {
				projectCharter.setEstimatedEndDateTemp(dateFormat.format(projectCharter.getEstimatedEndDate()));
			}
			if(projectCharter.getEstimatedThroughputDays() != null) {
				projectCharter.setEstimatedThroughPutDaysTemp(projectCharter.getEstimatedThroughputDays());
			}
			if(projectCharter.getLaunchDate() != null) {
				projectCharter.setLaunchDateTemp(dateFormat.format(projectCharter.getLaunchDate()));
			}
			if(projectCharter.getActualThroughputDays() != null) {
				projectCharter.setActualThroughputDaysTemp(projectCharter.getActualThroughputDays());
			}
			if(projectCharter.getDefineDate() != null) {
				projectCharter.setDefineDateTemp(dateFormat.format(projectCharter.getDefineDate()));
			}
			if(projectCharter.getMeasureDate() != null) {
				projectCharter.setMeasureDateTemp(dateFormat.format(projectCharter.getMeasureDate()));
			}
			if(projectCharter.getAnalyzeDate() != null) {
				projectCharter.setAnalyzeDateTemp(dateFormat.format(projectCharter.getAnalyzeDate()));
			}
			if(projectCharter.getImproveDays() != null) {
				projectCharter.setImproveDaysTemp(dateFormat.format(projectCharter.getImproveDays()));
			}
			if(projectCharter.getClosureDate() != null) {
				projectCharter.setClosureDateTemp(dateFormat.format(projectCharter.getClosureDate()));
			}
			if(projectCharter.getHopperEstimateComment() != null && !projectCharter.getHopperEstimateComment().isEmpty()) {
				projectCharter.setHopperEstimateComment(EncryptionDecryptionFunction.getDecryptedData(projectCharter.getHopperEstimateComment()));
			}
			if(projectCharter.getNewEstimateCommentDuringContract() != null && !projectCharter.getNewEstimateCommentDuringContract().isEmpty()) {
				projectCharter.setNewEstimateCommentDuringContract(EncryptionDecryptionFunction.getDecryptedData(projectCharter.getNewEstimateCommentDuringContract()));
			}
			List<T_Project_Charter_Approval> charterApproval = new ArrayList<T_Project_Charter_Approval>();
			charterApproval.addAll(projectCharter.getProjectCharterApproval());
			Collections.sort(charterApproval);
			Set<T_Project_Charter_Approval> charterApprovalRefinedList = new LinkedHashSet<T_Project_Charter_Approval>();
			for(T_Project_Charter_Approval currCharterApproval : charterApproval) {
				charterApprovalRefinedList.add(currCharterApproval);
			}
			charterApproval.clear(); charterApproval = null;
			projectCharter.setProjectCharterApproval(charterApprovalRefinedList);
			charterApprovalRefinedList = null;
			
			List<T_Project_Contract_Approval> contractApproval = new ArrayList<T_Project_Contract_Approval>();
			contractApproval.addAll(projectCharter.getProjectContractApproval());
			Collections.sort(contractApproval);
			Set<T_Project_Contract_Approval> contractApprovalRefinedList = new LinkedHashSet<T_Project_Contract_Approval>();
			for(T_Project_Contract_Approval currCharterApproval : contractApproval) {
				contractApprovalRefinedList.add(currCharterApproval);
			}
			contractApproval.clear(); contractApproval = null;
			projectCharter.setProjectContractApproval(contractApprovalRefinedList);
			contractApprovalRefinedList = null;
			
			List<T_Project_Closure_Approval> closureApproval = new ArrayList<T_Project_Closure_Approval>();
			closureApproval.addAll(projectCharter.getProjectClosureApproval());
			Collections.sort(closureApproval);
			Set<T_Project_Closure_Approval> closureApprovalRefinedList = new LinkedHashSet<T_Project_Closure_Approval>();
			for(T_Project_Closure_Approval currCharterApproval : closureApproval) {
				closureApprovalRefinedList.add(currCharterApproval);
			}
			closureApproval.clear(); closureApproval = null;
			projectCharter.setProjectClosureApproval(closureApprovalRefinedList);
			closureApprovalRefinedList = null;
			
			List<T_Project_Charter_Review> charterReview = new ArrayList<T_Project_Charter_Review>();
			charterReview.addAll(projectCharter.getProjectCharterReview());
			Collections.sort(charterReview);
			Collections.reverse(charterReview);
			Set<T_Project_Charter_Review> charterReviewRefinedList = new LinkedHashSet<T_Project_Charter_Review>();
			for(T_Project_Charter_Review currCharterReview : charterReview) {
				if(currCharterReview.getReviewMom()==null&&currCharterReview.getReviewComments()==null)
				{
					continue;
				}
				charterReviewRefinedList.add(currCharterReview);
			}
			charterReview.clear(); charterReview = null;
			projectCharter.setProjectCharterReview(charterReviewRefinedList);
			charterReviewRefinedList = null;
			
			List<T_Project_Charter_Control> charterControl = new ArrayList<T_Project_Charter_Control>();
			charterControl.addAll(projectCharter.getProjectCharterControl());
			Collections.sort(charterControl);
			Collections.reverse(charterControl);
			Set<T_Project_Charter_Control> charterControlRefinedList = new LinkedHashSet<T_Project_Charter_Control>();
			for(T_Project_Charter_Control currCharterControl : charterControl) {
				if(currCharterControl.getControlAction()==null&&currCharterControl.getControlEstablishedInSystem()==null)
				{
					continue;
				}
				charterControlRefinedList.add(currCharterControl);
			}
			charterControl.clear(); charterControl = null;
			projectCharter.setProjectCharterControl(charterControlRefinedList);
			charterControlRefinedList = null;
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return projectCharter;
	}

	@Override
	public T_Project_Charter_Review getCharterProjectReviewDetail(HttpServletRequest request) {
		return projectCharterReviewDao.findById(Long.parseLong(""+request.getParameter("id"))).get();
	}

	@Override
	@Transactional
	public String saveCharterProjectDetails(T_Project_Charter projectCharter, HttpServletRequest request) throws Exception {
		StringBuilder response = new StringBuilder();
		Date currDate = new Date();
		M_User user = mUserDao.findByUserLoginId(SecurityContextHolder.getContext().getAuthentication().getName());
		if(projectCharter.gettProjectCharterId() != null) {
			T_Project_Charter currProjectCharter = projectCharterDao.findById(projectCharter.gettProjectCharterId()).get();
			/* *********************************************************** */
			/* Save Current Data to History Table and then proceed editing */
			T_Project_Charter_History projectCharterHistory = new T_Project_Charter_History();
			projectCharterHistory.setProjectCharterHistory(currProjectCharter);
			if(currProjectCharter.getProjectCharterCode() != null && !currProjectCharter.getProjectCharterCode().isEmpty()) {
				projectCharterHistory.setProjectCharterCode(currProjectCharter.getProjectCharterCode());
			}
			projectCharterHistory.setProjectCharterStatus(currProjectCharter.getProjectCharterStatus());
			projectCharterHistory.setProjectName(currProjectCharter.getProjectName());
			if(currProjectCharter.getProjectFunctionId() != null) {
				projectCharterHistory.setProjectFunctionId(currProjectCharter.getProjectFunctionId());
			}
			if(currProjectCharter.getProjectMethodologyId() != null) {
				projectCharterHistory.setProjectMethodologyId(currProjectCharter.getProjectMethodologyId());
			}
			if(currProjectCharter.getProjectTypeId() != null) {
				projectCharterHistory.setProjectTypeId(currProjectCharter.getProjectTypeId());
			}
			if(currProjectCharter.getmEntityId() != null) {
				projectCharterHistory.setmEntityId(currProjectCharter.getmEntityId());
			}
			if(currProjectCharter.getConfidentiality() != null) {
				projectCharterHistory.setConfidentiality(currProjectCharter.getConfidentiality());
			}
			if(currProjectCharter.getProjectDescription() != null) {
				projectCharterHistory.setProjectDescription(currProjectCharter.getProjectDescription());
			}
			if(currProjectCharter.getSponsor() != null) {
				projectCharterHistory.setSponsor(currProjectCharter.getSponsor());
			}
			if(currProjectCharter.getProcessOwner() != null) {
				projectCharterHistory.setProcessOwner(currProjectCharter.getProcessOwner());
			}
			if(currProjectCharter.getFinanceController() != null) {
				projectCharterHistory.setFinanceController(currProjectCharter.getFinanceController());
			}
			if(currProjectCharter.getProblemSolvingLeader() != null) {
				projectCharterHistory.setProblemSolvingLeader(currProjectCharter.getProblemSolvingLeader());
			}
			if(currProjectCharter.getCorporateProblemSolvingLeader() != null) {
				projectCharterHistory.setCorporateProblemSolvingLeader(currProjectCharter.getCorporateProblemSolvingLeader());
			}
			if(currProjectCharter.getProjectLeader() != null) {
				projectCharterHistory.setProjectLeader(currProjectCharter.getProjectLeader());
			}
			if(currProjectCharter.getCharterPrimaryDriver() != null) {
				projectCharterHistory.setCharterPrimaryDriver(currProjectCharter.getCharterPrimaryDriver());
			}
			if(currProjectCharter.getEstimatedSaving() != null) {
				projectCharterHistory.setEstimatedSaving(currProjectCharter.getEstimatedSaving());
			}
			if(currProjectCharter.getBusinessHead() != null) {
				projectCharterHistory.setBusinessHead(currProjectCharter.getBusinessHead());
			}
			if(currProjectCharter.getAdditionalReader() != null) {
				projectCharterHistory.setAdditionalReader(currProjectCharter.getAdditionalReader());
			}
			if(currProjectCharter.getAdditionalSponsor() != null) {
				projectCharterHistory.setAdditionalSponsor(currProjectCharter.getAdditionalSponsor());
			}
			projectCharterHistory.setCountForCertification(currProjectCharter.getCountForCertification());
			projectCharterHistory.setAlignedForBusinessGoalTree(currProjectCharter.getAlignedForBusinessGoalTree());
			projectCharterHistory.setFallsUnderSponsorFunctionalArea(currProjectCharter.getFallsUnderSponsorFunctionalArea());
			
			/* ********** Project Plan Dates ********** */
			if(currProjectCharter.getEstimatedStartDate() != null) {
				projectCharterHistory.setEstimatedStartDate(currProjectCharter.getEstimatedStartDate());
			}
			if(currProjectCharter.getEstimatedEndDate() != null) {
				projectCharterHistory.setEstimatedEndDate(currProjectCharter.getEstimatedEndDate());
			}
			if(currProjectCharter.getEstimatedThroughputDays() != null) {
				projectCharterHistory.setEstimatedThroughputDays(currProjectCharter.getEstimatedThroughputDays());
			}
			if(currProjectCharter.getLaunchDate() != null) {
				projectCharterHistory.setLaunchDate(currProjectCharter.getLaunchDate());
			}
			if(currProjectCharter.getActualThroughputDays() != null) {
				projectCharterHistory.setActualThroughputDays(currProjectCharter.getActualThroughputDays());
			}
			if(currProjectCharter.getDefineDate() != null) {
				projectCharterHistory.setDefineDate(currProjectCharter.getDefineDate());
			}
			if(currProjectCharter.getMeasureDate() != null) {
				projectCharterHistory.setMeasureDate(currProjectCharter.getMeasureDate());
			}
			if(currProjectCharter.getAnalyzeDate() != null) {
				projectCharterHistory.setAnalyzeDate(currProjectCharter.getAnalyzeDate());
			}
			if(currProjectCharter.getImproveDays() != null) {
				projectCharterHistory.setImproveDays(currProjectCharter.getImproveDays());
			}
			if(currProjectCharter.getClosureDate() != null) {
				projectCharterHistory.setClosureDate(currProjectCharter.getClosureDate());
			}
			
			/* ********** Project Saving ********** */
			if(currProjectCharter.getAnnualCostSaving() != null) {
				projectCharterHistory.setAnnualCostSaving(currProjectCharter.getAnnualCostSaving());
			}
			if(currProjectCharter.getAnnualTaxSaving() != null) {
				projectCharterHistory.setAnnualTaxSaving(currProjectCharter.getAnnualTaxSaving());
			}
			if(currProjectCharter.getNetAnnualProfitImprovement() != null) {
				projectCharterHistory.setNetAnnualProfitImprovement(currProjectCharter.getNetAnnualProfitImprovement());
			}
			if(currProjectCharter.getCompletionYearCostSaving() != null) {
				projectCharterHistory.setCompletionYearCostSaving(currProjectCharter.getCompletionYearCostSaving());
			}
			if(currProjectCharter.getOneTimeCostToImplement() != null) {
				projectCharterHistory.setOneTimeCostToImplement(currProjectCharter.getOneTimeCostToImplement());
			}
			if(currProjectCharter.getNetCompletionYearProfitImprovement() != null) {
				projectCharterHistory.setNetCompletionYearProfitImprovement(currProjectCharter.getNetCompletionYearProfitImprovement());
			}
			if(currProjectCharter.getAnnualAvoidanceCostSaving() != null) {
				projectCharterHistory.setAnnualAvoidanceCostSaving(currProjectCharter.getAnnualAvoidanceCostSaving());
			}
			if(currProjectCharter.getAnnualInterestSaving() != null) {
				projectCharterHistory.setAnnualInterestSaving(currProjectCharter.getAnnualInterestSaving());
			}
			if(currProjectCharter.getCompletionYearAvoidanceCost() != null) {
				projectCharterHistory.setCompletionYearAvoidanceCost(currProjectCharter.getCompletionYearAvoidanceCost());
			}
			if(currProjectCharter.getExternalCustomerSavings() != null) {
				projectCharterHistory.setExternalCustomerSavings(currProjectCharter.getExternalCustomerSavings());
			}
			if(currProjectCharter.getHopperEstimateComment() != null && !currProjectCharter.getHopperEstimateComment().isEmpty()) {
				projectCharterHistory.setHopperEstimateComment(currProjectCharter.getHopperEstimateComment());
			}
			if(currProjectCharter.getNewEstimateCommentDuringContract() != null && !currProjectCharter.getNewEstimateCommentDuringContract().isEmpty()) {
				projectCharterHistory.setNewEstimateCommentDuringContract(currProjectCharter.getNewEstimateCommentDuringContract());
			}
			/** Other Details */
			projectCharterHistory.setCharterPrimaryDriver(currProjectCharter.getCharterPrimaryDriver());
			projectCharterHistory.setProjectStatus(currProjectCharter.getProjectStatus());
			projectCharterHistory.setSupplyChainImprovementProject(currProjectCharter.getSupplyChainImprovementProject());
			projectCharterHistory.setSupplierFocusProject(currProjectCharter.getSupplierFocusProject());
			projectCharterHistory.setProjectWarrantyFocus(currProjectCharter.getProjectWarrantyFocus());
			projectCharterHistory.setWarrantyFocusState(currProjectCharter.getWarrantyFocusState());
			projectCharterHistory.setExternalCustomerFocusProject(currProjectCharter.getExternalCustomerFocusProject());
			projectCharterHistory.setNameOfCustomer(currProjectCharter.getNameOfCustomer());
			projectCharterHistory.setContactPersonName(currProjectCharter.getContactPersonName());
			projectCharterHistory.setInterCompanyCustomerFocusProject(currProjectCharter.getInterCompanyCustomerFocusProject());
			projectCharterHistory.setProcessOrProductOppterrunityExists(currProjectCharter.getProcessOrProductOppterrunityExists());
			
			
			if(currProjectCharter.getQualityBaseline() != null) {
				projectCharterHistory.setQualityBaseline(currProjectCharter.getQualityBaseline());
			} else {
				projectCharterHistory.setQualityBaseline(null);
			}
			if(currProjectCharter.getQualityGoal() != null) {
				projectCharterHistory.setQualityGoal(currProjectCharter.getQualityGoal());
			} else {
				projectCharterHistory.setQualityGoal(null);
			}
			if(currProjectCharter.getQualityEntitlement() != null) {
				projectCharterHistory.setQualityEntitlement(currProjectCharter.getQualityEntitlement());
			} else {
				projectCharterHistory.setQualityEntitlement(null);
			}
			if(currProjectCharter.getQualityUnitOfMeasure() != null && currProjectCharter.getQualityUnitOfMeasure() != -1) {
				projectCharterHistory.setQualityUnitOfMeasure(currProjectCharter.getQualityUnitOfMeasure());
			} else {
				projectCharterHistory.setQualityUnitOfMeasure(null);
			}
			if(currProjectCharter.getCostBaseline() != null) {
				projectCharterHistory.setCostBaseline(currProjectCharter.getCostBaseline());
			} else {
				projectCharterHistory.setCostBaseline(null);
			}
			if(currProjectCharter.getCostGoal() != null) {
				projectCharterHistory.setCostGoal(currProjectCharter.getCostGoal());
			} else {
				projectCharterHistory.setCostGoal(null);
			}
			if(currProjectCharter.getCostEntitlement() != null) {
				projectCharterHistory.setCostEntitlement(currProjectCharter.getCostEntitlement());
			} else {
				projectCharterHistory.setCostEntitlement(null);
			}
			if(currProjectCharter.getCostUnitOfMeasure() != null && currProjectCharter.getCostUnitOfMeasure() != -1) {
				projectCharterHistory.setCostUnitOfMeasure(currProjectCharter.getCostUnitOfMeasure());
			} else {
				projectCharterHistory.setCostUnitOfMeasure(null);
			}
			if(currProjectCharter.getSavingOrGains() != null) {
				projectCharterHistory.setSavingOrGains(currProjectCharter.getSavingOrGains());
			} else {
				projectCharterHistory.setSavingOrGains(null);
			}
			if(currProjectCharter.getProjectTeamMemberInternal() != null) {
				projectCharterHistory.setProjectTeamMemberInternal(currProjectCharter.getProjectTeamMemberInternal());
			} else {
				projectCharterHistory.setProjectTeamMemberInternal(null);
			}
			if(currProjectCharter.getProjectTeamMemberExternal() != null) {
				projectCharterHistory.setProjectTeamMemberExternal(currProjectCharter.getProjectTeamMemberExternal());
			} else {
				projectCharterHistory.setProjectTeamMemberExternal(null);
			}
			if(currProjectCharter.getProjectScope() != null) {
				projectCharterHistory.setProjectScope(currProjectCharter.getProjectScope());
			} else {
				projectCharterHistory.setProjectScope(null);
			}
			if(currProjectCharter.getImpactToExternalCustomerOrOtherIntercompanyCustomer() != null) {
				projectCharterHistory.setImpactToExternalCustomerOrOtherIntercompanyCustomer(currProjectCharter.getImpactToExternalCustomerOrOtherIntercompanyCustomer());
			} else {
				projectCharterHistory.setImpactToExternalCustomerOrOtherIntercompanyCustomer(null);
			}
			if(currProjectCharter.getSupportRequired() != null) {
				projectCharterHistory.setSupportRequired(currProjectCharter.getSupportRequired());
			} else {
				projectCharterHistory.setSupportRequired(null);
			}
			if(currProjectCharter.getCycleCount() != null) {
				projectCharterHistory.setCycleCount(currProjectCharter.getCycleCount());
			} else {
				projectCharterHistory.setCycleCount(null);
			}
			if(currProjectCharter.getCharterAttachmentName() != null && !currProjectCharter.getCharterAttachmentName().isEmpty()) {
				System.out.println("name : "+currProjectCharter.getCharterAttachmentName());
				projectCharterHistory.setCharterAttachment(currProjectCharter.getCharterAttachment());
				projectCharterHistory.setCharterAttachmentName(currProjectCharter.getCharterAttachmentName());
				projectCharterHistory.setCharterAttachmentType(currProjectCharter.getCharterAttachmentType());
			} else {
				projectCharterHistory.setCharterAttachment(null);
				projectCharterHistory.setCharterAttachmentName(null);
				projectCharterHistory.setCharterAttachmentType(null);
			}
			projectCharterHistoryDao.save(projectCharterHistory);
			projectCharterHistory = null;
			
			/* *********************************************************** */
			currProjectCharter.setProjectName(EncryptionDecryptionFunction.getEncryptedData(projectCharter.getProjectName().trim().replaceAll("\\s+", " ")));
			if(projectCharter.getFunctionTemp().compareTo(-1) != 0) {
				currProjectCharter.setProjectFunctionId(mProjectFunctionDao.findById(Long.parseLong(""+projectCharter.getFunctionTemp())).get());
			}
			if(projectCharter.getMetheodologyTemp().compareTo(-1) != 0) {
				currProjectCharter.setProjectMethodologyId(mProjectMethodologyDao.findById(Long.parseLong(""+projectCharter.getMetheodologyTemp())).get());
			}
			if(projectCharter.getTypeTemp().compareTo(-1) != 0) {
				currProjectCharter.setProjectTypeId(mProjectTypeDao.findById(Long.parseLong(""+projectCharter.getTypeTemp())).get());
			}
			if(projectCharter.getCompanyTemp().compareTo(-1) != 0) {
				currProjectCharter.setmEntityId(mEntityDao.findById(Long.parseLong(""+projectCharter.getCompanyTemp())).get());
			}
			if(projectCharter.getConfidentiality().compareTo(-1) != 0) {
				currProjectCharter.setConfidentiality(projectCharter.getConfidentiality());
			}
			if(projectCharter.getProjectDescription() != null && !projectCharter.getProjectDescription().isEmpty()) {
				currProjectCharter.setProjectDescription(EncryptionDecryptionFunction.getEncryptedData(projectCharter.getProjectDescription().trim().replaceAll("\\s+", " ")));
			}
			if(projectCharter.getSponsorTemp().compareTo(-1) != 0) {
				currProjectCharter.setSponsor(mUserDao.findById(Long.parseLong(""+projectCharter.getSponsorTemp())).get());
			}
			if(projectCharter.getProcessOwnerTemp().compareTo(-1) != 0) {
				/*currProjectCharter.setProcessOwner(mUserDao.findById(Long.parseLong(""+projectCharter.getProcessOwnerTemp()));*/
				currProjectCharter.setProcessOwner(mUserDao.findById(Long.parseLong(""+projectCharter.getProcessOwnerTemp())).get());
			}
			if(projectCharter.getFinanceControllerTemp().compareTo(-1) != 0) {
				/*currProjectCharter.setFinanceController(mUserDao.findById(Long.parseLong(""+projectCharter.getFinanceControllerTemp()));*/
				currProjectCharter.setFinanceController(mUserDao.findById(Long.parseLong(""+projectCharter.getFinanceControllerTemp())).get());
			}
			if(projectCharter.getProblemSolvingLeaderTemp().compareTo(-1) != 0) {
				/*currProjectCharter.setProblemSolvingLeader(mUserDao.findById(Long.parseLong(""+projectCharter.getProblemSolvingLeaderTemp()));*/
				currProjectCharter.setProblemSolvingLeader(mUserDao.findById(Long.parseLong(""+projectCharter.getProblemSolvingLeaderTemp())).get());
			}
			if(projectCharter.getCorporateProblemSolvingLeaderTemp().compareTo(-1) != 0) {
				/*currProjectCharter.setCorporateProblemSolvingLeader(mUserDao.findById(Long.parseLong(""+projectCharter.getCorporateProblemSolvingLeaderTemp()));*/
				currProjectCharter.setCorporateProblemSolvingLeader(mUserDao.findById(Long.parseLong(""+projectCharter.getCorporateProblemSolvingLeaderTemp())).get());
			}
			if(projectCharter.getProjectLeaderTemp().compareTo(-1) != 0) {
				/*currProjectCharter.setProjectLeader(mUserDao.findById(Long.parseLong(""+projectCharter.getProjectLeaderTemp()));*/
				currProjectCharter.setProjectLeader(mUserDao.findById(Long.parseLong(""+projectCharter.getProjectLeaderTemp())).get());
			}
			if(projectCharter.getCharterPrimaryDriver().compareTo(-1) != 0) {
				currProjectCharter.setCharterPrimaryDriver(projectCharter.getCharterPrimaryDriver());
			}
			if(projectCharter.getEstimatedSaving() != null) {
				currProjectCharter.setEstimatedSaving(projectCharter.getEstimatedSaving());
			}
			if(projectCharter.getBusinessHeadTemp().compareTo(-1) != 0) {
				/*currProjectCharter.setBusinessHead(mUserDao.findById(Long.parseLong(""+projectCharter.getBusinessHeadTemp()));*/
				currProjectCharter.setBusinessHead(mUserDao.findById(Long.parseLong(""+projectCharter.getBusinessHeadTemp())).get());
			}
			currProjectCharter.setAdditionalReader(null);
			if(projectCharter.getAdditionalProjectLeaderTemp().compareTo(-1) != 0) {
				/*currProjectCharter.setAdditionalReader(mUserDao.findById(Long.parseLong(""+projectCharter.getAdditionalProjectLeaderTemp()));*/
				currProjectCharter.setAdditionalReader(mUserDao.findById(Long.parseLong(""+projectCharter.getAdditionalProjectLeaderTemp())).get());
			}
			currProjectCharter.setAdditionalSponsor(null);
			if(projectCharter.getAdditionalSponsorTemp().compareTo(-1) != 0) {
				/*currProjectCharter.setAdditionalSponsor(mUserDao.findById(Long.parseLong(""+projectCharter.getAdditionalSponsorTemp()));*/
				currProjectCharter.setAdditionalSponsor(mUserDao.findById(Long.parseLong(""+projectCharter.getAdditionalSponsorTemp())).get());
			}
			currProjectCharter.setCountForCertification(projectCharter.getCountForCertification());
			currProjectCharter.setAlignedForBusinessGoalTree(projectCharter.getAlignedForBusinessGoalTree());
			currProjectCharter.setFallsUnderSponsorFunctionalArea(projectCharter.getFallsUnderSponsorFunctionalArea());
			/* ********** Project Plan Dates ********** */
			if(projectCharter.getEstimatedStartDateTemp() != null && !projectCharter.getEstimatedStartDateTemp().isEmpty()) {
				currProjectCharter.setEstimatedStartDate(dateFormat.parse(projectCharter.getEstimatedStartDateTemp()));
			}
			if(projectCharter.getEstimatedEndDateTemp() != null && !projectCharter.getEstimatedEndDateTemp().isEmpty()) {
				currProjectCharter.setEstimatedEndDate(dateFormat.parse(projectCharter.getEstimatedEndDateTemp()));
			}
			if(projectCharter.getEstimatedThroughPutDaysTemp() != null) {
				currProjectCharter.setEstimatedThroughputDays(projectCharter.getEstimatedThroughPutDaysTemp());
			}
			if(projectCharter.getLaunchDateTemp() != null && !projectCharter.getLaunchDateTemp().isEmpty()) {
				currProjectCharter.setLaunchDate(dateFormat.parse(projectCharter.getLaunchDateTemp()));
			}
			if(projectCharter.getActualThroughputDaysTemp() != null) {
				currProjectCharter.setActualThroughputDays(projectCharter.getActualThroughputDaysTemp());
			}
			if(projectCharter.getDefineDateTemp() != null && !projectCharter.getDefineDateTemp().isEmpty()) {
				currProjectCharter.setDefineDate(dateFormat.parse(projectCharter.getDefineDateTemp()));
			}
			if(projectCharter.getMeasureDateTemp() != null && !projectCharter.getMeasureDateTemp().isEmpty()) {
				currProjectCharter.setMeasureDate(dateFormat.parse(projectCharter.getMeasureDateTemp()));
			}
			if(projectCharter.getAnalyzeDateTemp() != null && !projectCharter.getAnalyzeDateTemp().isEmpty()) {
				currProjectCharter.setAnalyzeDate(dateFormat.parse(projectCharter.getAnalyzeDateTemp()));
			}
			if(projectCharter.getImproveDaysTemp() != null && !projectCharter.getImproveDaysTemp().isEmpty()) {
				currProjectCharter.setImproveDays(dateFormat.parse(projectCharter.getImproveDaysTemp()));
			}
			if(projectCharter.getClosureDateTemp() != null && !projectCharter.getClosureDateTemp().isEmpty()) {
				currProjectCharter.setClosureDate(dateFormat.parse(projectCharter.getClosureDateTemp()));
			}
			
			/* ********** Project Saving ********** */
			if(projectCharter.getAnnualCostSaving() != null) {
				currProjectCharter.setAnnualCostSaving(projectCharter.getAnnualCostSaving());
			} else {
				currProjectCharter.setAnnualCostSaving(null);
			}
			if(projectCharter.getAnnualTaxSaving() != null) {
				currProjectCharter.setAnnualTaxSaving(projectCharter.getAnnualTaxSaving());
			} else {
				currProjectCharter.setAnnualTaxSaving(null);
			}
			if(projectCharter.getNetAnnualProfitImprovement() != null) {
				currProjectCharter.setNetAnnualProfitImprovement(projectCharter.getNetAnnualProfitImprovement());
			} else {
				currProjectCharter.setNetAnnualProfitImprovement(null);
			}
			if(projectCharter.getCompletionYearCostSaving() != null) {
				currProjectCharter.setCompletionYearCostSaving(projectCharter.getCompletionYearCostSaving());
			} else {
				currProjectCharter.setCompletionYearCostSaving(null);
			}
			if(projectCharter.getOneTimeCostToImplement() != null) {
				currProjectCharter.setOneTimeCostToImplement(projectCharter.getOneTimeCostToImplement());
			} else {
				currProjectCharter.setOneTimeCostToImplement(null);
			}
			if(projectCharter.getNetCompletionYearProfitImprovement() != null) {
				currProjectCharter.setNetCompletionYearProfitImprovement(projectCharter.getNetCompletionYearProfitImprovement());
			} else {
				currProjectCharter.setNetCompletionYearProfitImprovement(null);
			}
			if(projectCharter.getAnnualAvoidanceCostSaving() != null) {
				currProjectCharter.setAnnualAvoidanceCostSaving(projectCharter.getAnnualAvoidanceCostSaving());
			} else {
				currProjectCharter.setAnnualAvoidanceCostSaving(null);
			}
			if(projectCharter.getAnnualInterestSaving() != null) {
				currProjectCharter.setAnnualInterestSaving(projectCharter.getAnnualInterestSaving());
			} else {
				currProjectCharter.setAnnualInterestSaving(null);
			}
			if(projectCharter.getCompletionYearAvoidanceCost() != null) {
				currProjectCharter.setCompletionYearAvoidanceCost(projectCharter.getCompletionYearAvoidanceCost());
			} else {
				currProjectCharter.setCompletionYearAvoidanceCost(null);
			}
			if(projectCharter.getExternalCustomerSavings() != null) {
				currProjectCharter.setExternalCustomerSavings(projectCharter.getExternalCustomerSavings());
			} else {
				currProjectCharter.setExternalCustomerSavings(null);
			}
			if(projectCharter.getHopperEstimateComment() != null && !projectCharter.getHopperEstimateComment().isEmpty()) {
				currProjectCharter.setHopperEstimateComment(EncryptionDecryptionFunction.getEncryptedData(projectCharter.getHopperEstimateComment().trim().replaceAll("\\s+", " ")));
			} else {
				currProjectCharter.setHopperEstimateComment(null);
			}
			if(projectCharter.getNewEstimateCommentDuringContract() != null && !projectCharter.getNewEstimateCommentDuringContract().isEmpty()) {
				currProjectCharter.setNewEstimateCommentDuringContract(EncryptionDecryptionFunction.getEncryptedData(projectCharter.getNewEstimateCommentDuringContract().trim().replaceAll("\\s+", " ")));
			} else {
				currProjectCharter.setNewEstimateCommentDuringContract(null);
			}

			/** ********** Other Details ********** */
			if(projectCharter.getCharterPrimaryDriver().compareTo(-1) != 0) {
				currProjectCharter.setCharterPrimaryDriver(projectCharter.getCharterPrimaryDriver());
			} else {
				currProjectCharter.setCharterPrimaryDriver(null);
			}
			if(projectCharter.getProjectStatus().compareTo(-1) != 0) {
				currProjectCharter.setProjectStatus(projectCharter.getProjectStatus());
			} else {
				currProjectCharter.setProjectStatus(null);
			}
			currProjectCharter.setSupplyChainImprovementProject(projectCharter.getSupplyChainImprovementProject());
			currProjectCharter.setSupplierFocusProject(projectCharter.getSupplierFocusProject());
			currProjectCharter.setProjectWarrantyFocus(projectCharter.getProjectWarrantyFocus());
			currProjectCharter.setWarrantyFocusState(projectCharter.getWarrantyFocusState());
			currProjectCharter.setExternalCustomerFocusProject(projectCharter.getExternalCustomerFocusProject());
			if(projectCharter.getNameOfCustomer() != null && !projectCharter.getNameOfCustomer().isEmpty()) {
				currProjectCharter.setNameOfCustomer(projectCharter.getNameOfCustomer());
			} else {
				currProjectCharter.setNameOfCustomer(null);
			}
			if(projectCharter.getContactPersonName() != null && !projectCharter.getContactPersonName().isEmpty()) {
				currProjectCharter.setContactPersonName(projectCharter.getContactPersonName());
			} else {
				currProjectCharter.setContactPersonName(null);
			}
			currProjectCharter.setInterCompanyCustomerFocusProject(projectCharter.getInterCompanyCustomerFocusProject());
			if(projectCharter.getProcessOrProductOppterrunityExists() != null && !projectCharter.getProcessOrProductOppterrunityExists().isEmpty()) {
				currProjectCharter.setProcessOrProductOppterrunityExists(projectCharter.getProcessOrProductOppterrunityExists());
			} else {
				currProjectCharter.setProcessOrProductOppterrunityExists(null);
			}
			if(projectCharter.getQualityBaseline() != null) {
				currProjectCharter.setQualityBaseline(projectCharter.getQualityBaseline());
			} else {
				currProjectCharter.setQualityBaseline(null);
			}
			if(projectCharter.getQualityGoal() != null) {
				currProjectCharter.setQualityGoal(projectCharter.getQualityGoal());
			} else {
				currProjectCharter.setQualityGoal(null);
			}
			if(projectCharter.getQualityEntitlement() != null) {
				currProjectCharter.setQualityEntitlement(projectCharter.getQualityEntitlement());
			} else {
				currProjectCharter.setQualityEntitlement(null);
			}
			if(projectCharter.getQualityUnitOfMeasure() != null && projectCharter.getQualityUnitOfMeasure() != -1) {
				currProjectCharter.setQualityUnitOfMeasure(projectCharter.getQualityUnitOfMeasure());
			} else {
				currProjectCharter.setQualityUnitOfMeasure(null);
			}
			if(projectCharter.getCostBaseline() != null) {
				currProjectCharter.setCostBaseline(projectCharter.getCostBaseline());
			} else {
				currProjectCharter.setCostBaseline(null);
			}
			if(projectCharter.getCostGoal() != null) {
				currProjectCharter.setCostGoal(projectCharter.getCostGoal());
			} else {
				currProjectCharter.setCostGoal(null);
			}
			if(projectCharter.getCostEntitlement() != null) {
				currProjectCharter.setCostEntitlement(projectCharter.getCostEntitlement());
			} else {
				currProjectCharter.setCostEntitlement(null);
			}
			if(projectCharter.getCostUnitOfMeasure() != null && projectCharter.getCostUnitOfMeasure() != -1) {
				currProjectCharter.setCostUnitOfMeasure(projectCharter.getCostUnitOfMeasure());
			} else {
				currProjectCharter.setCostUnitOfMeasure(null);
			}
			if(projectCharter.getSavingOrGains() != null) {
				currProjectCharter.setSavingOrGains(projectCharter.getSavingOrGains());
			} else {
				currProjectCharter.setSavingOrGains(null);
			}
			if(projectCharter.getProjectTeamMemberInternal() != null) {
				currProjectCharter.setProjectTeamMemberInternal(projectCharter.getProjectTeamMemberInternal());
			} else {
				currProjectCharter.setProjectTeamMemberInternal(null);
			}
			if(projectCharter.getProjectTeamMemberExternal() != null) {
				currProjectCharter.setProjectTeamMemberExternal(projectCharter.getProjectTeamMemberExternal());
			} else {
				currProjectCharter.setProjectTeamMemberExternal(null);
			}
			if(projectCharter.getProjectScope() != null) {
				currProjectCharter.setProjectScope(projectCharter.getProjectScope());
			} else {
				currProjectCharter.setProjectScope(null);
			}
			if(projectCharter.getImpactToExternalCustomerOrOtherIntercompanyCustomer() != null) {
				currProjectCharter.setImpactToExternalCustomerOrOtherIntercompanyCustomer(projectCharter.getImpactToExternalCustomerOrOtherIntercompanyCustomer());
			} else {
				currProjectCharter.setImpactToExternalCustomerOrOtherIntercompanyCustomer(null);
			}
			if(projectCharter.getSupportRequired() != null) {
				currProjectCharter.setSupportRequired(projectCharter.getSupportRequired());
			} else {
				currProjectCharter.setSupportRequired(null);
			}
			if(projectCharter.getCycleCount() != null) {
				currProjectCharter.setCycleCount(projectCharter.getCycleCount());
			} else {
				currProjectCharter.setCycleCount(null);
			}
			if(projectCharter.getTempCharterAttachment() != null && !projectCharter.getTempCharterAttachment().isEmpty()) {
				currProjectCharter.setCharterAttachment(projectCharter.getTempCharterAttachment().getBytes());
				currProjectCharter.setCharterAttachmentName(StringUtils.cleanPath(projectCharter.getTempCharterAttachment().getOriginalFilename()));
				currProjectCharter.setCharterAttachmentType(projectCharter.getTempCharterAttachment().getContentType());
			}

			currProjectCharter.setCharterLastUpdatedBy(user);
			currProjectCharter.setCharterLastUpdatedOn(currDate);
			currProjectCharter.setCharterActive(projectCharter.getCharterActive());

			if(projectCharter.getSaveOrSubmit().compareTo(1) == 0) {
				StringBuilder projectId = new StringBuilder();
				projectId.append(currProjectCharter.getProjectTypeId().getProjectTypeShortCode());
				projectId.append("-"+currProjectCharter.getmEntityId().getEntityAcronym());
				projectId.append("-"+currProjectCharter.getmEntityId().getLocationId().getLocationName().toUpperCase());
				LocalDateTime now = LocalDateTime.now();
				projectId.append("-"+now.getDayOfMonth()+""+now.getMonth()+""+now.getYear());
				now = null;
				currProjectCharter.setProjectCharterCode(projectId.toString());
				projectId.setLength(0); projectId = null;
				currProjectCharter.setProjectCharterStatus(1);
			} else if(projectCharter.getSaveOrSubmit().compareTo(4) == 0) {
				currProjectCharter.setProjectCharterStatus(4);
				currProjectCharter.setLaunchDate(currDate);
			} else {
				currProjectCharter.setProjectCharterStatus(0);
			}
			projectCharterDao.save(currProjectCharter);


			if(projectCharter.getSaveOrSubmit().compareTo(1) == 0) {
				T_Project_Charter_Approval projectCharterApproval = new T_Project_Charter_Approval();
				projectCharterApproval.setProjectCharterApproval(currProjectCharter);
				projectCharterApproval.setApproverType(1);
				projectCharterApproval.setApproverId(currProjectCharter.getSponsor());
				projectCharterApproval.setApprovalSubmissionDate(currDate);
				projectCharterApproval.setApprovalStatus(0);
				projectCharterApproval.setActive(1);
				projectCharterApprovalDao.save(projectCharterApproval);
				projectCharterApproval = null;
			}

			
			currProjectCharter = null;
			response.append("edit");
		} else {
			/* ********** Project Information ********** */
			projectCharter.setProjectName(EncryptionDecryptionFunction.getEncryptedData(projectCharter.getProjectName().trim().replaceAll("\\s+", " ")));
			if(projectCharter.getFunctionTemp().compareTo(-1) != 0) {
				projectCharter.setProjectFunctionId(mProjectFunctionDao.findById(Long.parseLong(""+projectCharter.getFunctionTemp())).get());
			}
			if(projectCharter.getMetheodologyTemp().compareTo(-1) != 0) {
				projectCharter.setProjectMethodologyId(mProjectMethodologyDao.findById(Long.parseLong(""+projectCharter.getMetheodologyTemp())).get());
			}
			if(projectCharter.getTypeTemp().compareTo(-1) != 0) {
				projectCharter.setProjectTypeId(mProjectTypeDao.findById(Long.parseLong(""+projectCharter.getTypeTemp())).get());
			}
			if(projectCharter.getCompanyTemp().compareTo(-1) != 0) {
				projectCharter.setmEntityId(mEntityDao.findById(Long.parseLong(""+projectCharter.getCompanyTemp())).get());
			}
			if(projectCharter.getConfidentiality().compareTo(-1) == 0) {
				projectCharter.setConfidentiality(null);
			}
			System.out.println("-"+projectCharter.getProjectDescription()+"-");
			if(projectCharter.getProjectDescription() != null && !projectCharter.getProjectDescription().trim().isEmpty()) {
				projectCharter.setProjectDescription(EncryptionDecryptionFunction.getEncryptedData(projectCharter.getProjectDescription().trim().replaceAll("\\s+", " ")));
			} else {
				projectCharter.setProjectDescription(null);
			}
			if(projectCharter.getSponsorTemp().compareTo(-1) != 0) {
				projectCharter.setSponsor(mUserDao.findById(Long.parseLong(""+projectCharter.getSponsorTemp())).get());
			}
			if(projectCharter.getProcessOwnerTemp().compareTo(-1) != 0) {
				projectCharter.setProcessOwner(mUserDao.findById(Long.parseLong(""+projectCharter.getProcessOwnerTemp())).get());
			}
			if(projectCharter.getFinanceControllerTemp().compareTo(-1) != 0) {
				projectCharter.setFinanceController(mUserDao.findById(Long.parseLong(""+projectCharter.getFinanceControllerTemp())).get());
			}
			if(projectCharter.getProblemSolvingLeaderTemp().compareTo(-1) != 0) {
				projectCharter.setProblemSolvingLeader(mUserDao.findById(Long.parseLong(""+projectCharter.getProblemSolvingLeaderTemp())).get());
			}
			if(projectCharter.getCorporateProblemSolvingLeaderTemp().compareTo(-1) != 0) {
				projectCharter.setCorporateProblemSolvingLeader(mUserDao.findById(Long.parseLong(""+projectCharter.getCorporateProblemSolvingLeaderTemp())).get());
			}
			if(projectCharter.getProjectLeaderTemp().compareTo(-1) != 0) {
				projectCharter.setProjectLeader(mUserDao.findById(Long.parseLong(""+projectCharter.getProjectLeaderTemp())).get());
			}
			if(projectCharter.getCharterPrimaryDriver().compareTo(-1) == 0) {
				projectCharter.setCharterPrimaryDriver(null);
			}
			if(projectCharter.getEstimatedSaving() != null) {
				projectCharter.setEstimatedSaving(projectCharter.getEstimatedSaving());
			}
			if(projectCharter.getBusinessHeadTemp().compareTo(-1) != 0) {
				projectCharter.setBusinessHead(mUserDao.findById(Long.parseLong(""+projectCharter.getBusinessHeadTemp())).get());
			}
			if(projectCharter.getAdditionalProjectLeaderTemp().compareTo(-1) != 0) {
				projectCharter.setAdditionalReader(mUserDao.findById(Long.parseLong(""+projectCharter.getAdditionalProjectLeaderTemp())).get());
			}
			if(projectCharter.getAdditionalSponsorTemp().compareTo(-1) != 0) {
				projectCharter.setAdditionalSponsor(mUserDao.findById(Long.parseLong(""+projectCharter.getAdditionalSponsorTemp())).get());
			}
			projectCharter.setCountForCertification(projectCharter.getCountForCertification());
			projectCharter.setAlignedForBusinessGoalTree(projectCharter.getAlignedForBusinessGoalTree());
			projectCharter.setFallsUnderSponsorFunctionalArea(projectCharter.getFallsUnderSponsorFunctionalArea());
			/* ********** Project Plan Dates ********** */
			if(projectCharter.getEstimatedStartDateTemp() != null && !projectCharter.getEstimatedStartDateTemp().isEmpty()) {
				projectCharter.setEstimatedStartDate(dateFormat.parse(projectCharter.getEstimatedStartDateTemp()));
			}
			if(projectCharter.getEstimatedEndDateTemp() != null && !projectCharter.getEstimatedEndDateTemp().isEmpty()) {
				projectCharter.setEstimatedEndDate(dateFormat.parse(projectCharter.getEstimatedEndDateTemp()));
			}
			if(projectCharter.getEstimatedThroughPutDaysTemp() != null) {
				projectCharter.setEstimatedThroughputDays(projectCharter.getEstimatedThroughPutDaysTemp());
			}
			if(projectCharter.getLaunchDateTemp() != null && !projectCharter.getLaunchDateTemp().isEmpty()) {
				projectCharter.setLaunchDate(dateFormat.parse(projectCharter.getLaunchDateTemp()));
			}
			if(projectCharter.getActualThroughputDaysTemp() != null) {
				projectCharter.setActualThroughputDays(projectCharter.getActualThroughputDaysTemp());
			}
			if(projectCharter.getDefineDateTemp() != null && !projectCharter.getDefineDateTemp().isEmpty()) {
				projectCharter.setDefineDate(dateFormat.parse(projectCharter.getDefineDateTemp()));
			}
			if(projectCharter.getMeasureDateTemp() != null && !projectCharter.getMeasureDateTemp().isEmpty()) {
				projectCharter.setMeasureDate(dateFormat.parse(projectCharter.getMeasureDateTemp()));
			}
			if(projectCharter.getAnalyzeDateTemp() != null && !projectCharter.getAnalyzeDateTemp().isEmpty()) {
				projectCharter.setAnalyzeDate(dateFormat.parse(projectCharter.getAnalyzeDateTemp()));
			}
			if(projectCharter.getImproveDaysTemp() != null && !projectCharter.getImproveDaysTemp().isEmpty()) {
				projectCharter.setImproveDays(dateFormat.parse(projectCharter.getImproveDaysTemp()));
			}
			if(projectCharter.getClosureDateTemp() != null && !projectCharter.getClosureDateTemp().isEmpty()) {
				projectCharter.setClosureDate(dateFormat.parse(projectCharter.getClosureDateTemp()));
			}
			
			/* ********** Project Saving ********** */
			if(projectCharter.getAnnualCostSaving() != null) {
				projectCharter.setAnnualCostSaving(projectCharter.getAnnualCostSaving());
			}
			if(projectCharter.getAnnualTaxSaving() != null) {
				projectCharter.setAnnualTaxSaving(projectCharter.getAnnualTaxSaving());
			}
			if(projectCharter.getNetAnnualProfitImprovement() != null) {
				projectCharter.setNetAnnualProfitImprovement(projectCharter.getNetAnnualProfitImprovement());
			}
			if(projectCharter.getCompletionYearCostSaving() != null) {
				projectCharter.setCompletionYearCostSaving(projectCharter.getCompletionYearCostSaving());
			}
			if(projectCharter.getOneTimeCostToImplement() != null) {
				projectCharter.setOneTimeCostToImplement(projectCharter.getOneTimeCostToImplement());
			}
			if(projectCharter.getNetCompletionYearProfitImprovement() != null) {
				projectCharter.setNetCompletionYearProfitImprovement(projectCharter.getNetCompletionYearProfitImprovement());
			}
			if(projectCharter.getAnnualAvoidanceCostSaving() != null) {
				projectCharter.setAnnualAvoidanceCostSaving(projectCharter.getAnnualAvoidanceCostSaving());
			}
			if(projectCharter.getAnnualInterestSaving() != null) {
				projectCharter.setAnnualInterestSaving(projectCharter.getAnnualInterestSaving());
			}
			if(projectCharter.getCompletionYearAvoidanceCost() != null) {
				projectCharter.setCompletionYearAvoidanceCost(projectCharter.getCompletionYearAvoidanceCost());
			}
			if(projectCharter.getExternalCustomerSavings() != null) {
				projectCharter.setExternalCustomerSavings(projectCharter.getExternalCustomerSavings());
			}
			if(projectCharter.getHopperEstimateComment() != null && !projectCharter.getHopperEstimateComment().isEmpty()) {
				projectCharter.setHopperEstimateComment(EncryptionDecryptionFunction.getEncryptedData(projectCharter.getHopperEstimateComment().trim().replaceAll("\\s+", " ")));
			}
			if(projectCharter.getNewEstimateCommentDuringContract() != null && !projectCharter.getNewEstimateCommentDuringContract().isEmpty()) {
				projectCharter.setNewEstimateCommentDuringContract(EncryptionDecryptionFunction.getEncryptedData(projectCharter.getNewEstimateCommentDuringContract().trim().replaceAll("\\s+", " ")));
			}

			/** ********** Other Details ********** */
			if(projectCharter.getCharterPrimaryDriver() != null && projectCharter.getCharterPrimaryDriver().compareTo(-1) != 0) {
				projectCharter.setCharterPrimaryDriver(projectCharter.getCharterPrimaryDriver());
			} else {
				projectCharter.setCharterPrimaryDriver(null);
			}
			if(projectCharter.getProjectStatus().compareTo(-1) != 0) {
				projectCharter.setProjectStatus(projectCharter.getProjectStatus());
			} else {
				projectCharter.setProjectStatus(null);
			}
			projectCharter.setSupplyChainImprovementProject(projectCharter.getSupplyChainImprovementProject());
			projectCharter.setSupplierFocusProject(projectCharter.getSupplierFocusProject());
			projectCharter.setProjectWarrantyFocus(projectCharter.getProjectWarrantyFocus());
			projectCharter.setWarrantyFocusState(projectCharter.getWarrantyFocusState());
			projectCharter.setExternalCustomerFocusProject(projectCharter.getExternalCustomerFocusProject());
			if(projectCharter.getNameOfCustomer() != null && !projectCharter.getNameOfCustomer().isEmpty()) {
				projectCharter.setNameOfCustomer(projectCharter.getNameOfCustomer());
			} else {
				projectCharter.setNameOfCustomer(null);
			}
			if(projectCharter.getContactPersonName() != null && !projectCharter.getContactPersonName().isEmpty()) {
				projectCharter.setContactPersonName(projectCharter.getContactPersonName());
			} else {
				projectCharter.setContactPersonName(null);
			}
			projectCharter.setInterCompanyCustomerFocusProject(projectCharter.getInterCompanyCustomerFocusProject());
			if(projectCharter.getProcessOrProductOppterrunityExists() != null && !projectCharter.getProcessOrProductOppterrunityExists().isEmpty()) {
				projectCharter.setProcessOrProductOppterrunityExists(projectCharter.getProcessOrProductOppterrunityExists());
			} else {
				projectCharter.setProcessOrProductOppterrunityExists(null);
			}
			
			if(projectCharter.getQualityBaseline() != null) {
				projectCharter.setQualityBaseline(projectCharter.getQualityBaseline());
			} else {
				projectCharter.setQualityBaseline(null);
			}
			if(projectCharter.getQualityGoal() != null) {
				projectCharter.setQualityGoal(projectCharter.getQualityGoal());
			} else {
				projectCharter.setQualityGoal(null);
			}
			if(projectCharter.getQualityEntitlement() != null) {
				projectCharter.setQualityEntitlement(projectCharter.getQualityEntitlement());
			} else {
				projectCharter.setQualityEntitlement(null);
			}
			if(projectCharter.getQualityUnitOfMeasure() != null && projectCharter.getQualityUnitOfMeasure() != -1) {
				projectCharter.setQualityUnitOfMeasure(projectCharter.getQualityUnitOfMeasure());
			} else {
				projectCharter.setQualityUnitOfMeasure(null);
			}
			if(projectCharter.getCostBaseline() != null) {
				projectCharter.setCostBaseline(projectCharter.getCostBaseline());
			} else {
				projectCharter.setCostBaseline(null);
			}
			if(projectCharter.getCostGoal() != null) {
				projectCharter.setCostGoal(projectCharter.getCostGoal());
			} else {
				projectCharter.setCostGoal(null);
			}
			if(projectCharter.getCostEntitlement() != null) {
				projectCharter.setCostEntitlement(projectCharter.getCostEntitlement());
			} else {
				projectCharter.setCostEntitlement(null);
			}
			if(projectCharter.getCostUnitOfMeasure() != null && projectCharter.getCostUnitOfMeasure() != -1) {
				projectCharter.setCostUnitOfMeasure(projectCharter.getCostUnitOfMeasure());
			} else {
				projectCharter.setCostUnitOfMeasure(null);
			}
			if(projectCharter.getSavingOrGains() != null) {
				projectCharter.setSavingOrGains(projectCharter.getSavingOrGains());
			} else {
				projectCharter.setSavingOrGains(null);
			}
			if(projectCharter.getProjectTeamMemberInternal() != null) {
				projectCharter.setProjectTeamMemberInternal(projectCharter.getProjectTeamMemberInternal());
			} else {
				projectCharter.setProjectTeamMemberInternal(null);
			}
			if(projectCharter.getProjectTeamMemberExternal() != null) {
				projectCharter.setProjectTeamMemberExternal(projectCharter.getProjectTeamMemberExternal());
			} else {
				projectCharter.setProjectTeamMemberExternal(null);
			}
			if(projectCharter.getProjectScope() != null) {
				projectCharter.setProjectScope(projectCharter.getProjectScope());
			} else {
				projectCharter.setProjectScope(null);
			}
			if(projectCharter.getImpactToExternalCustomerOrOtherIntercompanyCustomer() != null) {
				projectCharter.setImpactToExternalCustomerOrOtherIntercompanyCustomer(projectCharter.getImpactToExternalCustomerOrOtherIntercompanyCustomer());
			} else {
				projectCharter.setImpactToExternalCustomerOrOtherIntercompanyCustomer(null);
			}
			if(projectCharter.getSupportRequired() != null) {
				projectCharter.setSupportRequired(projectCharter.getSupportRequired());
			} else {
				projectCharter.setSupportRequired(null);
			}
			if(projectCharter.getCycleCount() != null) {
				projectCharter.setCycleCount(projectCharter.getCycleCount());
			} else {
				projectCharter.setCycleCount(null);
			}
			if(projectCharter.getTempCharterAttachment() != null && !projectCharter.getTempCharterAttachment().isEmpty()) {
				projectCharter.setCharterAttachment(projectCharter.getTempCharterAttachment().getBytes());
				projectCharter.setCharterAttachmentName(StringUtils.cleanPath(projectCharter.getTempCharterAttachment().getOriginalFilename()));
				projectCharter.setCharterAttachmentType(projectCharter.getTempCharterAttachment().getContentType());
			} else {
				projectCharter.setCharterAttachment(null);
				projectCharter.setCharterAttachmentName(null);
				projectCharter.setCharterAttachmentType(null);
			}
			

			projectCharter.setCharterCreatedBy(user);
			projectCharter.setCharterCreatedOn(currDate);
			projectCharter.setCharterActive(projectCharter.getCharterActive());
			projectCharterDao.save(projectCharter);
			response.append("add");
		}
		currDate = null; user = null;
		response.append("done");
		return response.toString();
	}
	
	@Override
	@Transactional
	public String saveCharterContractProjectDetails(T_Project_Charter projectCharter, HttpServletRequest request) throws Exception {
		StringBuilder response = new StringBuilder();
		Date currDate = new Date();
		M_User user = mUserDao.findByUserLoginId(SecurityContextHolder.getContext().getAuthentication().getName());
		if(projectCharter.gettProjectCharterId() != null) {
			T_Project_Charter currProjectCharter = projectCharterDao.findById(projectCharter.gettProjectCharterId()).get();
			/* *********************************************************** */
			/* Save Current Data to History Table and then proceed editing */
			T_Project_Charter_History projectCharterHistory = new T_Project_Charter_History();
			projectCharterHistory.setProjectCharterHistory(currProjectCharter);
			if(currProjectCharter.getProjectCharterCode() != null && !currProjectCharter.getProjectCharterCode().isEmpty()) {
				projectCharterHistory.setProjectCharterCode(currProjectCharter.getProjectCharterCode());
			}
			projectCharterHistory.setProjectCharterStatus(currProjectCharter.getProjectCharterStatus());
			projectCharterHistory.setProjectName(currProjectCharter.getProjectName());
			if(currProjectCharter.getProjectFunctionId() != null) {
				projectCharterHistory.setProjectFunctionId(currProjectCharter.getProjectFunctionId());
			}
			if(currProjectCharter.getProjectMethodologyId() != null) {
				projectCharterHistory.setProjectMethodologyId(currProjectCharter.getProjectMethodologyId());
			}
			if(currProjectCharter.getProjectTypeId() != null) {
				projectCharterHistory.setProjectTypeId(currProjectCharter.getProjectTypeId());
			}
			if(currProjectCharter.getmEntityId() != null) {
				projectCharterHistory.setmEntityId(currProjectCharter.getmEntityId());
			}
			if(currProjectCharter.getConfidentiality() != null) {
				projectCharterHistory.setConfidentiality(currProjectCharter.getConfidentiality());
			}
			if(currProjectCharter.getProjectDescription() != null) {
				projectCharterHistory.setProjectDescription(currProjectCharter.getProjectDescription());
			}
			if(currProjectCharter.getSponsor() != null) {
				projectCharterHistory.setSponsor(currProjectCharter.getSponsor());
			}
			if(currProjectCharter.getProcessOwner() != null) {
				projectCharterHistory.setProcessOwner(currProjectCharter.getProcessOwner());
			}
			if(currProjectCharter.getFinanceController() != null) {
				projectCharterHistory.setFinanceController(currProjectCharter.getFinanceController());
			}
			if(currProjectCharter.getProblemSolvingLeader() != null) {
				projectCharterHistory.setProblemSolvingLeader(currProjectCharter.getProblemSolvingLeader());
			}
			if(currProjectCharter.getCorporateProblemSolvingLeader() != null) {
				projectCharterHistory.setCorporateProblemSolvingLeader(currProjectCharter.getCorporateProblemSolvingLeader());
			}
			if(currProjectCharter.getProjectLeader() != null) {
				projectCharterHistory.setProjectLeader(currProjectCharter.getProjectLeader());
			}
			if(currProjectCharter.getCharterPrimaryDriver() != null) {
				projectCharterHistory.setCharterPrimaryDriver(currProjectCharter.getCharterPrimaryDriver());
			}
			if(currProjectCharter.getEstimatedSaving() != null) {
				projectCharterHistory.setEstimatedSaving(currProjectCharter.getEstimatedSaving());
			}
			if(currProjectCharter.getBusinessHead() != null) {
				projectCharterHistory.setBusinessHead(currProjectCharter.getBusinessHead());
			}
			if(currProjectCharter.getAdditionalReader() != null) {
				projectCharterHistory.setAdditionalReader(currProjectCharter.getAdditionalReader());
			}
			if(currProjectCharter.getAdditionalSponsor() != null) {
				projectCharterHistory.setAdditionalSponsor(currProjectCharter.getAdditionalSponsor());
			}
			projectCharterHistory.setCountForCertification(currProjectCharter.getCountForCertification());
			projectCharterHistory.setAlignedForBusinessGoalTree(currProjectCharter.getAlignedForBusinessGoalTree());
			projectCharterHistory.setFallsUnderSponsorFunctionalArea(currProjectCharter.getFallsUnderSponsorFunctionalArea());
			
			/* ********** Project Plan Dates ********** */
			if(currProjectCharter.getEstimatedStartDate() != null) {
				projectCharterHistory.setEstimatedStartDate(currProjectCharter.getEstimatedStartDate());
			}
			if(currProjectCharter.getEstimatedEndDate() != null) {
				projectCharterHistory.setEstimatedEndDate(currProjectCharter.getEstimatedEndDate());
			}
			if(currProjectCharter.getEstimatedThroughputDays() != null) {
				projectCharterHistory.setEstimatedThroughputDays(currProjectCharter.getEstimatedThroughputDays());
			}
			if(currProjectCharter.getLaunchDate() != null) {
				projectCharterHistory.setLaunchDate(currProjectCharter.getLaunchDate());
			}
			if(currProjectCharter.getActualThroughputDays() != null) {
				projectCharterHistory.setActualThroughputDays(currProjectCharter.getActualThroughputDays());
			}
			if(currProjectCharter.getDefineDate() != null) {
				projectCharterHistory.setDefineDate(currProjectCharter.getDefineDate());
			}
			if(currProjectCharter.getMeasureDate() != null) {
				projectCharterHistory.setMeasureDate(currProjectCharter.getMeasureDate());
			}
			if(currProjectCharter.getAnalyzeDate() != null) {
				projectCharterHistory.setAnalyzeDate(currProjectCharter.getAnalyzeDate());
			}
			if(currProjectCharter.getImproveDays() != null) {
				projectCharterHistory.setImproveDays(currProjectCharter.getImproveDays());
			}
			if(currProjectCharter.getClosureDate() != null) {
				projectCharterHistory.setClosureDate(currProjectCharter.getClosureDate());
			}
			
			/* ********** Project Saving ********** */
			if(currProjectCharter.getAnnualCostSaving() != null) {
				projectCharterHistory.setAnnualCostSaving(currProjectCharter.getAnnualCostSaving());
			}
			if(currProjectCharter.getAnnualTaxSaving() != null) {
				projectCharterHistory.setAnnualTaxSaving(currProjectCharter.getAnnualTaxSaving());
			}
			if(currProjectCharter.getNetAnnualProfitImprovement() != null) {
				projectCharterHistory.setNetAnnualProfitImprovement(currProjectCharter.getNetAnnualProfitImprovement());
			}
			if(currProjectCharter.getCompletionYearCostSaving() != null) {
				projectCharterHistory.setCompletionYearCostSaving(currProjectCharter.getCompletionYearCostSaving());
			}
			if(currProjectCharter.getOneTimeCostToImplement() != null) {
				projectCharterHistory.setOneTimeCostToImplement(currProjectCharter.getOneTimeCostToImplement());
			}
			if(currProjectCharter.getNetCompletionYearProfitImprovement() != null) {
				projectCharterHistory.setNetCompletionYearProfitImprovement(currProjectCharter.getNetCompletionYearProfitImprovement());
			}
			if(currProjectCharter.getAnnualAvoidanceCostSaving() != null) {
				projectCharterHistory.setAnnualAvoidanceCostSaving(currProjectCharter.getAnnualAvoidanceCostSaving());
			}
			if(currProjectCharter.getAnnualInterestSaving() != null) {
				projectCharterHistory.setAnnualInterestSaving(currProjectCharter.getAnnualInterestSaving());
			}
			if(currProjectCharter.getCompletionYearAvoidanceCost() != null) {
				projectCharterHistory.setCompletionYearAvoidanceCost(currProjectCharter.getCompletionYearAvoidanceCost());
			}
			if(currProjectCharter.getExternalCustomerSavings() != null) {
				projectCharterHistory.setExternalCustomerSavings(currProjectCharter.getExternalCustomerSavings());
			}
			if(currProjectCharter.getHopperEstimateComment() != null && !currProjectCharter.getHopperEstimateComment().isEmpty()) {
				projectCharterHistory.setHopperEstimateComment(currProjectCharter.getHopperEstimateComment());
			}
			if(currProjectCharter.getNewEstimateCommentDuringContract() != null && !currProjectCharter.getNewEstimateCommentDuringContract().isEmpty()) {
				projectCharterHistory.setNewEstimateCommentDuringContract(currProjectCharter.getNewEstimateCommentDuringContract());
			}
			/** Other Details */
			projectCharterHistory.setCharterPrimaryDriver(currProjectCharter.getCharterPrimaryDriver());
			projectCharterHistory.setProjectStatus(currProjectCharter.getProjectStatus());
			projectCharterHistory.setSupplyChainImprovementProject(currProjectCharter.getSupplyChainImprovementProject());
			projectCharterHistory.setSupplierFocusProject(currProjectCharter.getSupplierFocusProject());
			projectCharterHistory.setProjectWarrantyFocus(currProjectCharter.getProjectWarrantyFocus());
			projectCharterHistory.setWarrantyFocusState(currProjectCharter.getWarrantyFocusState());
			projectCharterHistory.setExternalCustomerFocusProject(currProjectCharter.getExternalCustomerFocusProject());
			projectCharterHistory.setNameOfCustomer(currProjectCharter.getNameOfCustomer());
			projectCharterHistory.setContactPersonName(currProjectCharter.getContactPersonName());
			projectCharterHistory.setInterCompanyCustomerFocusProject(currProjectCharter.getInterCompanyCustomerFocusProject());
			projectCharterHistory.setProcessOrProductOppterrunityExists(currProjectCharter.getProcessOrProductOppterrunityExists());
			
			
			if(currProjectCharter.getQualityBaseline() != null) {
				projectCharterHistory.setQualityBaseline(currProjectCharter.getQualityBaseline());
			} else {
				projectCharterHistory.setQualityBaseline(null);
			}
			if(currProjectCharter.getQualityGoal() != null) {
				projectCharterHistory.setQualityGoal(currProjectCharter.getQualityGoal());
			} else {
				projectCharterHistory.setQualityGoal(null);
			}
			if(currProjectCharter.getQualityEntitlement() != null) {
				projectCharterHistory.setQualityEntitlement(currProjectCharter.getQualityEntitlement());
			} else {
				projectCharterHistory.setQualityEntitlement(null);
			}
			if(currProjectCharter.getQualityUnitOfMeasure() != null && currProjectCharter.getQualityUnitOfMeasure() != -1) {
				projectCharterHistory.setQualityUnitOfMeasure(currProjectCharter.getQualityUnitOfMeasure());
			} else {
				projectCharterHistory.setQualityUnitOfMeasure(null);
			}
			if(currProjectCharter.getCostBaseline() != null) {
				projectCharterHistory.setCostBaseline(currProjectCharter.getCostBaseline());
			} else {
				projectCharterHistory.setCostBaseline(null);
			}
			if(currProjectCharter.getCostGoal() != null) {
				projectCharterHistory.setCostGoal(currProjectCharter.getCostGoal());
			} else {
				projectCharterHistory.setCostGoal(null);
			}
			if(currProjectCharter.getCostEntitlement() != null) {
				projectCharterHistory.setCostEntitlement(currProjectCharter.getCostEntitlement());
			} else {
				projectCharterHistory.setCostEntitlement(null);
			}
			if(currProjectCharter.getCostUnitOfMeasure() != null && currProjectCharter.getCostUnitOfMeasure() != -1) {
				projectCharterHistory.setCostUnitOfMeasure(currProjectCharter.getCostUnitOfMeasure());
			} else {
				projectCharterHistory.setCostUnitOfMeasure(null);
			}
			if(currProjectCharter.getSavingOrGains() != null) {
				projectCharterHistory.setSavingOrGains(currProjectCharter.getSavingOrGains());
			} else {
				projectCharterHistory.setSavingOrGains(null);
			}
			if(currProjectCharter.getProjectTeamMemberInternal() != null) {
				projectCharterHistory.setProjectTeamMemberInternal(currProjectCharter.getProjectTeamMemberInternal());
			} else {
				projectCharterHistory.setProjectTeamMemberInternal(null);
			}
			if(currProjectCharter.getProjectTeamMemberExternal() != null) {
				projectCharterHistory.setProjectTeamMemberExternal(currProjectCharter.getProjectTeamMemberExternal());
			} else {
				projectCharterHistory.setProjectTeamMemberExternal(null);
			}
			if(currProjectCharter.getProjectScope() != null) {
				projectCharterHistory.setProjectScope(currProjectCharter.getProjectScope());
			} else {
				projectCharterHistory.setProjectScope(null);
			}
			if(currProjectCharter.getImpactToExternalCustomerOrOtherIntercompanyCustomer() != null) {
				projectCharterHistory.setImpactToExternalCustomerOrOtherIntercompanyCustomer(currProjectCharter.getImpactToExternalCustomerOrOtherIntercompanyCustomer());
			} else {
				projectCharterHistory.setImpactToExternalCustomerOrOtherIntercompanyCustomer(null);
			}
			if(currProjectCharter.getSupportRequired() != null) {
				projectCharterHistory.setSupportRequired(currProjectCharter.getSupportRequired());
			} else {
				projectCharterHistory.setSupportRequired(null);
			}
			if(currProjectCharter.getCycleCount() != null) {
				projectCharterHistory.setCycleCount(currProjectCharter.getCycleCount());
			} else {
				projectCharterHistory.setCycleCount(null);
			}
			if(currProjectCharter.getCharterAttachmentName() != null && !currProjectCharter.getCharterAttachmentName().isEmpty()) {
				System.out.println("name : "+currProjectCharter.getCharterAttachmentName());
				projectCharterHistory.setCharterAttachment(currProjectCharter.getCharterAttachment());
				projectCharterHistory.setCharterAttachmentName(currProjectCharter.getCharterAttachmentName());
				projectCharterHistory.setCharterAttachmentType(currProjectCharter.getCharterAttachmentType());
			} else {
				projectCharterHistory.setCharterAttachment(null);
				projectCharterHistory.setCharterAttachmentName(null);
				projectCharterHistory.setCharterAttachmentType(null);
			}
			if(currProjectCharter.getFinalPresentationName() != null && !currProjectCharter.getFinalPresentationName().isEmpty()) {
				System.out.println("name : "+currProjectCharter.getFinalPresentationName());
				projectCharterHistory.setFinalPresentation(currProjectCharter.getFinalPresentation());
				projectCharterHistory.setFinalPresentationName(currProjectCharter.getFinalPresentationName());
				projectCharterHistory.setFinalPresentationType(currProjectCharter.getFinalPresentationType());
			} else {
				projectCharterHistory.setFinalPresentation(null);
				projectCharterHistory.setFinalPresentationName(null);
				projectCharterHistory.setFinalPresentationType(null);
			}
			projectCharterHistoryDao.save(projectCharterHistory);
			projectCharterHistory = null;
			
			/* *********************************************************** */
			if(projectCharter.getProjectDescription() != null && !projectCharter.getProjectDescription().isEmpty()) {
				currProjectCharter.setProjectDescription(EncryptionDecryptionFunction.getEncryptedData(projectCharter.getProjectDescription().trim().replaceAll("\\s+", " ")));
			}
			currProjectCharter.setAdditionalReader(null);
			if(projectCharter.getAdditionalProjectLeaderTemp().compareTo(-1) != 0) {
				/*currProjectCharter.setAdditionalReader(mUserDao.findById(Long.parseLong(""+projectCharter.getAdditionalProjectLeaderTemp()));*/
				currProjectCharter.setAdditionalReader(mUserDao.findById(Long.parseLong(""+projectCharter.getAdditionalProjectLeaderTemp())).get());
			}
			/* ********** Project Plan Dates ********** */
			
			/* ********** Project Saving ********** */
			if(projectCharter.getAnnualCostSaving() != null) {
				currProjectCharter.setAnnualCostSaving(projectCharter.getAnnualCostSaving());
			} else {
				currProjectCharter.setAnnualCostSaving(null);
			}
			if(projectCharter.getAnnualTaxSaving() != null) {
				currProjectCharter.setAnnualTaxSaving(projectCharter.getAnnualTaxSaving());
			} else {
				currProjectCharter.setAnnualTaxSaving(null);
			}
			if(projectCharter.getNetAnnualProfitImprovement() != null) {
				currProjectCharter.setNetAnnualProfitImprovement(projectCharter.getNetAnnualProfitImprovement());
			} else {
				currProjectCharter.setNetAnnualProfitImprovement(null);
			}
			if(projectCharter.getCompletionYearCostSaving() != null) {
				currProjectCharter.setCompletionYearCostSaving(projectCharter.getCompletionYearCostSaving());
			} else {
				currProjectCharter.setCompletionYearCostSaving(null);
			}
			if(projectCharter.getOneTimeCostToImplement() != null) {
				currProjectCharter.setOneTimeCostToImplement(projectCharter.getOneTimeCostToImplement());
			} else {
				currProjectCharter.setOneTimeCostToImplement(null);
			}
			if(projectCharter.getNetCompletionYearProfitImprovement() != null) {
				currProjectCharter.setNetCompletionYearProfitImprovement(projectCharter.getNetCompletionYearProfitImprovement());
			} else {
				currProjectCharter.setNetCompletionYearProfitImprovement(null);
			}
			if(projectCharter.getAnnualAvoidanceCostSaving() != null) {
				currProjectCharter.setAnnualAvoidanceCostSaving(projectCharter.getAnnualAvoidanceCostSaving());
			} else {
				currProjectCharter.setAnnualAvoidanceCostSaving(null);
			}
			if(projectCharter.getAnnualInterestSaving() != null) {
				currProjectCharter.setAnnualInterestSaving(projectCharter.getAnnualInterestSaving());
			} else {
				currProjectCharter.setAnnualInterestSaving(null);
			}
			if(projectCharter.getCompletionYearAvoidanceCost() != null) {
				currProjectCharter.setCompletionYearAvoidanceCost(projectCharter.getCompletionYearAvoidanceCost());
			} else {
				currProjectCharter.setCompletionYearAvoidanceCost(null);
			}
			if(projectCharter.getExternalCustomerSavings() != null) {
				currProjectCharter.setExternalCustomerSavings(projectCharter.getExternalCustomerSavings());
			} else {
				currProjectCharter.setExternalCustomerSavings(null);
			}

			/** ********** Other Details ********** */
			
			if(projectCharter.getProjectStatus().compareTo(-1) != 0) {
				currProjectCharter.setProjectStatus(projectCharter.getProjectStatus());
			} else {
				currProjectCharter.setProjectStatus(null);
			}
			
			if(projectCharter.getQualityBaseline() != null) {
				currProjectCharter.setQualityBaseline(projectCharter.getQualityBaseline());
			} else {
				currProjectCharter.setQualityBaseline(null);
			}
			
			if(projectCharter.getCostBaseline() != null) {
				currProjectCharter.setCostBaseline(projectCharter.getCostBaseline());
			} else {
				currProjectCharter.setCostBaseline(null);
			}
			
			if(projectCharter.getSavingOrGains() != null) {
				currProjectCharter.setSavingOrGains(projectCharter.getSavingOrGains());
			} else {
				currProjectCharter.setSavingOrGains(null);
			}
			
			if(projectCharter.getProjectScope() != null) {
				currProjectCharter.setProjectScope(projectCharter.getProjectScope());
			} else {
				currProjectCharter.setProjectScope(null);
			}
			if(projectCharter.getSupportRequired() != null) {
				currProjectCharter.setSupportRequired(projectCharter.getSupportRequired());
			} else {
				currProjectCharter.setSupportRequired(null);
			}
			if(projectCharter.getTempFinalPresentation() != null && !projectCharter.getTempFinalPresentation().isEmpty()) {
				System.out.print("name : "+projectCharter.getTempFinalPresentation().getOriginalFilename());
				currProjectCharter.setFinalPresentation(projectCharter.getTempFinalPresentation().getBytes());
				currProjectCharter.setFinalPresentationName(StringUtils.cleanPath(projectCharter.getTempFinalPresentation().getOriginalFilename()));
				currProjectCharter.setFinalPresentationType(projectCharter.getTempFinalPresentation().getContentType());
			}
			if(projectCharter.getReviewListTemp()!=null)
			{
				for(T_Project_Charter_Review charterReview : projectCharter.getReviewListTemp()) {
					if(!charterReview.getReviewCommentsTemp().isEmpty()&&!charterReview.getReviewMomTemp().isEmpty()) {
						System.out.println("Comments:"+charterReview.getReviewCommentsTemp());
						charterReview.setProjectCharterReview(projectCharter);
						charterReview.setReviewComments(charterReview.getReviewCommentsTemp());
						charterReview.setReviewMom(charterReview.getReviewMomTemp().getBytes());
						charterReview.setReviewMomName(StringUtils.cleanPath(charterReview.getReviewMomTemp().getOriginalFilename()));
						charterReview.setReviewMomType(charterReview.getReviewMomTemp().getContentType());
						charterReview.setReviewDoneOn(currDate);
						charterReview.setReviewDoneBy(user);
						charterReview.setActive(1);
						projectCharterReviewDao.save(charterReview);
					}
				}
			}
			currProjectCharter.setCharterLastUpdatedBy(user);
			currProjectCharter.setCharterLastUpdatedOn(currDate);
			currProjectCharter.setCharterActive(projectCharter.getCharterActive());

			if(projectCharter.getSaveOrSubmit().compareTo(1) == 0) {
				StringBuilder projectId = new StringBuilder();
				projectId.append(currProjectCharter.getProjectTypeId().getProjectTypeShortCode());
				projectId.append("-"+currProjectCharter.getmEntityId().getEntityAcronym());
				projectId.append("-"+currProjectCharter.getmEntityId().getLocationId().getLocationName().toUpperCase());
				LocalDateTime now = LocalDateTime.now();
				projectId.append("-"+now.getDayOfMonth()+""+now.getMonth()+""+now.getYear());
				now = null;
				currProjectCharter.setProjectCharterCode(projectId.toString());
				projectId.setLength(0); projectId = null;
				currProjectCharter.setProjectCharterStatus(5);
			}
			else {
				currProjectCharter.setProjectCharterStatus(4);
			}
			if(projectCharter.getSaveOrSubmit().compareTo(1) == 0) {
				T_Project_Contract_Approval projectContractApproval = new T_Project_Contract_Approval();
				projectContractApproval.setProjectContractApproval(currProjectCharter);
				projectContractApproval.setApproverType(1);
				projectContractApproval.setApproverId(currProjectCharter.getSponsor());
				projectContractApproval.setApprovalSubmissionDate(currDate);
				projectContractApproval.setApprovalStatus(0);
				projectContractApproval.setActive(1);
				projectContractApprovalDao.save(projectContractApproval);
				projectContractApproval = null;
			}else if(projectCharter.getSaveOrSubmit().compareTo(3) == 0) 
			{
				T_Project_Charter_Approval projectCharterApproval = new T_Project_Charter_Approval();
				T_Project_Charter_Request_Terminate_Approval requestTerminateApprovalSubmission = new T_Project_Charter_Request_Terminate_Approval();
				requestTerminateApprovalSubmission.setProjectCharterApproval(projectCharterApproval.getProjectCharterApproval());
				requestTerminateApprovalSubmission.setActive(1);
				projectCharterRequestTerminateApprovalDao.save(requestTerminateApprovalSubmission);
				requestTerminateApprovalSubmission = null;
				response.append("terminate");
				currProjectCharter.setProjectCharterStatus(-1);
			}
			projectCharterDao.save(currProjectCharter);
			currProjectCharter = null;
			response.append("edit");
		}
		currDate = null; user = null;
		response.append("done");
		return response.toString();
	}

	@Override
	@Transactional
	public String saveCharterClosureProjectDetails(T_Project_Charter projectCharter, HttpServletRequest request) throws Exception {
		StringBuilder response = new StringBuilder();
		Date currDate = new Date();
		M_User user = mUserDao.findByUserLoginId(SecurityContextHolder.getContext().getAuthentication().getName());
		if(projectCharter.gettProjectCharterId() != null) {
			T_Project_Charter currProjectCharter = projectCharterDao.findById(projectCharter.gettProjectCharterId()).get();
			/* *********************************************************** */
			/* Save Current Data to History Table and then proceed editing */
			T_Project_Charter_History projectCharterHistory = new T_Project_Charter_History();
			projectCharterHistory.setProjectCharterHistory(currProjectCharter);
			if(currProjectCharter.getProjectCharterCode() != null && !currProjectCharter.getProjectCharterCode().isEmpty()) {
				projectCharterHistory.setProjectCharterCode(currProjectCharter.getProjectCharterCode());
			}
			projectCharterHistory.setProjectCharterStatus(currProjectCharter.getProjectCharterStatus());
			projectCharterHistory.setProjectName(currProjectCharter.getProjectName());
			if(currProjectCharter.getProjectFunctionId() != null) {
				projectCharterHistory.setProjectFunctionId(currProjectCharter.getProjectFunctionId());
			}
			if(currProjectCharter.getProjectMethodologyId() != null) {
				projectCharterHistory.setProjectMethodologyId(currProjectCharter.getProjectMethodologyId());
			}
			if(currProjectCharter.getProjectTypeId() != null) {
				projectCharterHistory.setProjectTypeId(currProjectCharter.getProjectTypeId());
			}
			if(currProjectCharter.getmEntityId() != null) {
				projectCharterHistory.setmEntityId(currProjectCharter.getmEntityId());
			}
			if(currProjectCharter.getConfidentiality() != null) {
				projectCharterHistory.setConfidentiality(currProjectCharter.getConfidentiality());
			}
			if(currProjectCharter.getProjectDescription() != null) {
				projectCharterHistory.setProjectDescription(currProjectCharter.getProjectDescription());
			}
			if(currProjectCharter.getSponsor() != null) {
				projectCharterHistory.setSponsor(currProjectCharter.getSponsor());
			}
			if(currProjectCharter.getProcessOwner() != null) {
				projectCharterHistory.setProcessOwner(currProjectCharter.getProcessOwner());
			}
			if(currProjectCharter.getFinanceController() != null) {
				projectCharterHistory.setFinanceController(currProjectCharter.getFinanceController());
			}
			if(currProjectCharter.getProblemSolvingLeader() != null) {
				projectCharterHistory.setProblemSolvingLeader(currProjectCharter.getProblemSolvingLeader());
			}
			if(currProjectCharter.getCorporateProblemSolvingLeader() != null) {
				projectCharterHistory.setCorporateProblemSolvingLeader(currProjectCharter.getCorporateProblemSolvingLeader());
			}
			if(currProjectCharter.getProjectLeader() != null) {
				projectCharterHistory.setProjectLeader(currProjectCharter.getProjectLeader());
			}
			if(currProjectCharter.getCharterPrimaryDriver() != null) {
				projectCharterHistory.setCharterPrimaryDriver(currProjectCharter.getCharterPrimaryDriver());
			}
			if(currProjectCharter.getEstimatedSaving() != null) {
				projectCharterHistory.setEstimatedSaving(currProjectCharter.getEstimatedSaving());
			}
			if(currProjectCharter.getBusinessHead() != null) {
				projectCharterHistory.setBusinessHead(currProjectCharter.getBusinessHead());
			}
			if(currProjectCharter.getAdditionalReader() != null) {
				projectCharterHistory.setAdditionalReader(currProjectCharter.getAdditionalReader());
			}
			if(currProjectCharter.getAdditionalSponsor() != null) {
				projectCharterHistory.setAdditionalSponsor(currProjectCharter.getAdditionalSponsor());
			}
			projectCharterHistory.setCountForCertification(currProjectCharter.getCountForCertification());
			projectCharterHistory.setAlignedForBusinessGoalTree(currProjectCharter.getAlignedForBusinessGoalTree());
			projectCharterHistory.setFallsUnderSponsorFunctionalArea(currProjectCharter.getFallsUnderSponsorFunctionalArea());
			
			/* ********** Project Plan Dates ********** */
			if(currProjectCharter.getEstimatedStartDate() != null) {
				projectCharterHistory.setEstimatedStartDate(currProjectCharter.getEstimatedStartDate());
			}
			if(currProjectCharter.getEstimatedEndDate() != null) {
				projectCharterHistory.setEstimatedEndDate(currProjectCharter.getEstimatedEndDate());
			}
			if(currProjectCharter.getEstimatedThroughputDays() != null) {
				projectCharterHistory.setEstimatedThroughputDays(currProjectCharter.getEstimatedThroughputDays());
			}
			if(currProjectCharter.getLaunchDate() != null) {
				projectCharterHistory.setLaunchDate(currProjectCharter.getLaunchDate());
			}
			if(currProjectCharter.getActualThroughputDays() != null) {
				projectCharterHistory.setActualThroughputDays(currProjectCharter.getActualThroughputDays());
			}
			if(currProjectCharter.getDefineDate() != null) {
				projectCharterHistory.setDefineDate(currProjectCharter.getDefineDate());
			}
			if(currProjectCharter.getMeasureDate() != null) {
				projectCharterHistory.setMeasureDate(currProjectCharter.getMeasureDate());
			}
			if(currProjectCharter.getAnalyzeDate() != null) {
				projectCharterHistory.setAnalyzeDate(currProjectCharter.getAnalyzeDate());
			}
			if(currProjectCharter.getImproveDays() != null) {
				projectCharterHistory.setImproveDays(currProjectCharter.getImproveDays());
			}
			if(currProjectCharter.getClosureDate() != null) {
				projectCharterHistory.setClosureDate(currProjectCharter.getClosureDate());
			}
			
			/* ********** Project Saving ********** */
			if(currProjectCharter.getAnnualCostSaving() != null) {
				projectCharterHistory.setAnnualCostSaving(currProjectCharter.getAnnualCostSaving());
			}
			if(currProjectCharter.getAnnualTaxSaving() != null) {
				projectCharterHistory.setAnnualTaxSaving(currProjectCharter.getAnnualTaxSaving());
			}
			if(currProjectCharter.getNetAnnualProfitImprovement() != null) {
				projectCharterHistory.setNetAnnualProfitImprovement(currProjectCharter.getNetAnnualProfitImprovement());
			}
			if(currProjectCharter.getCompletionYearCostSaving() != null) {
				projectCharterHistory.setCompletionYearCostSaving(currProjectCharter.getCompletionYearCostSaving());
			}
			if(currProjectCharter.getOneTimeCostToImplement() != null) {
				projectCharterHistory.setOneTimeCostToImplement(currProjectCharter.getOneTimeCostToImplement());
			}
			if(currProjectCharter.getNetCompletionYearProfitImprovement() != null) {
				projectCharterHistory.setNetCompletionYearProfitImprovement(currProjectCharter.getNetCompletionYearProfitImprovement());
			}
			if(currProjectCharter.getAnnualAvoidanceCostSaving() != null) {
				projectCharterHistory.setAnnualAvoidanceCostSaving(currProjectCharter.getAnnualAvoidanceCostSaving());
			}
			if(currProjectCharter.getAnnualInterestSaving() != null) {
				projectCharterHistory.setAnnualInterestSaving(currProjectCharter.getAnnualInterestSaving());
			}
			if(currProjectCharter.getCompletionYearAvoidanceCost() != null) {
				projectCharterHistory.setCompletionYearAvoidanceCost(currProjectCharter.getCompletionYearAvoidanceCost());
			}
			if(currProjectCharter.getExternalCustomerSavings() != null) {
				projectCharterHistory.setExternalCustomerSavings(currProjectCharter.getExternalCustomerSavings());
			}
			if(currProjectCharter.getHopperEstimateComment() != null && !currProjectCharter.getHopperEstimateComment().isEmpty()) {
				projectCharterHistory.setHopperEstimateComment(currProjectCharter.getHopperEstimateComment());
			}
			if(currProjectCharter.getNewEstimateCommentDuringContract() != null && !currProjectCharter.getNewEstimateCommentDuringContract().isEmpty()) {
				projectCharterHistory.setNewEstimateCommentDuringContract(currProjectCharter.getNewEstimateCommentDuringContract());
			}
			/** Other Details */
			projectCharterHistory.setCharterPrimaryDriver(currProjectCharter.getCharterPrimaryDriver());
			projectCharterHistory.setProjectStatus(currProjectCharter.getProjectStatus());
			projectCharterHistory.setSupplyChainImprovementProject(currProjectCharter.getSupplyChainImprovementProject());
			projectCharterHistory.setSupplierFocusProject(currProjectCharter.getSupplierFocusProject());
			projectCharterHistory.setProjectWarrantyFocus(currProjectCharter.getProjectWarrantyFocus());
			projectCharterHistory.setWarrantyFocusState(currProjectCharter.getWarrantyFocusState());
			projectCharterHistory.setExternalCustomerFocusProject(currProjectCharter.getExternalCustomerFocusProject());
			projectCharterHistory.setNameOfCustomer(currProjectCharter.getNameOfCustomer());
			projectCharterHistory.setContactPersonName(currProjectCharter.getContactPersonName());
			projectCharterHistory.setInterCompanyCustomerFocusProject(currProjectCharter.getInterCompanyCustomerFocusProject());
			projectCharterHistory.setProcessOrProductOppterrunityExists(currProjectCharter.getProcessOrProductOppterrunityExists());
			
			
			if(currProjectCharter.getQualityBaseline() != null) {
				projectCharterHistory.setQualityBaseline(currProjectCharter.getQualityBaseline());
			} else {
				projectCharterHistory.setQualityBaseline(null);
			}
			if(currProjectCharter.getQualityGoal() != null) {
				projectCharterHistory.setQualityGoal(currProjectCharter.getQualityGoal());
			} else {
				projectCharterHistory.setQualityGoal(null);
			}
			if(currProjectCharter.getQualityEntitlement() != null) {
				projectCharterHistory.setQualityEntitlement(currProjectCharter.getQualityEntitlement());
			} else {
				projectCharterHistory.setQualityEntitlement(null);
			}
			if(currProjectCharter.getQualityUnitOfMeasure() != null && currProjectCharter.getQualityUnitOfMeasure() != -1) {
				projectCharterHistory.setQualityUnitOfMeasure(currProjectCharter.getQualityUnitOfMeasure());
			} else {
				projectCharterHistory.setQualityUnitOfMeasure(null);
			}
			if(currProjectCharter.getCostBaseline() != null) {
				projectCharterHistory.setCostBaseline(currProjectCharter.getCostBaseline());
			} else {
				projectCharterHistory.setCostBaseline(null);
			}
			if(currProjectCharter.getCostGoal() != null) {
				projectCharterHistory.setCostGoal(currProjectCharter.getCostGoal());
			} else {
				projectCharterHistory.setCostGoal(null);
			}
			if(currProjectCharter.getCostEntitlement() != null) {
				projectCharterHistory.setCostEntitlement(currProjectCharter.getCostEntitlement());
			} else {
				projectCharterHistory.setCostEntitlement(null);
			}
			if(currProjectCharter.getCostUnitOfMeasure() != null && currProjectCharter.getCostUnitOfMeasure() != -1) {
				projectCharterHistory.setCostUnitOfMeasure(currProjectCharter.getCostUnitOfMeasure());
			} else {
				projectCharterHistory.setCostUnitOfMeasure(null);
			}
			if(currProjectCharter.getSavingOrGains() != null) {
				projectCharterHistory.setSavingOrGains(currProjectCharter.getSavingOrGains());
			} else {
				projectCharterHistory.setSavingOrGains(null);
			}
			if(currProjectCharter.getProjectTeamMemberInternal() != null) {
				projectCharterHistory.setProjectTeamMemberInternal(currProjectCharter.getProjectTeamMemberInternal());
			} else {
				projectCharterHistory.setProjectTeamMemberInternal(null);
			}
			if(currProjectCharter.getProjectTeamMemberExternal() != null) {
				projectCharterHistory.setProjectTeamMemberExternal(currProjectCharter.getProjectTeamMemberExternal());
			} else {
				projectCharterHistory.setProjectTeamMemberExternal(null);
			}
			if(currProjectCharter.getProjectScope() != null) {
				projectCharterHistory.setProjectScope(currProjectCharter.getProjectScope());
			} else {
				projectCharterHistory.setProjectScope(null);
			}
			if(currProjectCharter.getImpactToExternalCustomerOrOtherIntercompanyCustomer() != null) {
				projectCharterHistory.setImpactToExternalCustomerOrOtherIntercompanyCustomer(currProjectCharter.getImpactToExternalCustomerOrOtherIntercompanyCustomer());
			} else {
				projectCharterHistory.setImpactToExternalCustomerOrOtherIntercompanyCustomer(null);
			}
			if(currProjectCharter.getSupportRequired() != null) {
				projectCharterHistory.setSupportRequired(currProjectCharter.getSupportRequired());
			} else {
				projectCharterHistory.setSupportRequired(null);
			}
			if(currProjectCharter.getCycleCount() != null) {
				projectCharterHistory.setCycleCount(currProjectCharter.getCycleCount());
			} else {
				projectCharterHistory.setCycleCount(null);
			}
			if(currProjectCharter.getCharterAttachmentName() != null && !currProjectCharter.getCharterAttachmentName().isEmpty()) {
				System.out.println("name : "+currProjectCharter.getCharterAttachmentName());
				projectCharterHistory.setCharterAttachment(currProjectCharter.getCharterAttachment());
				projectCharterHistory.setCharterAttachmentName(currProjectCharter.getCharterAttachmentName());
				projectCharterHistory.setCharterAttachmentType(currProjectCharter.getCharterAttachmentType());
			} else {
				projectCharterHistory.setCharterAttachment(null);
				projectCharterHistory.setCharterAttachmentName(null);
				projectCharterHistory.setCharterAttachmentType(null);
			}
			if(currProjectCharter.getFinalPresentationName() != null && !currProjectCharter.getFinalPresentationName().isEmpty()) {
				System.out.println("name : "+currProjectCharter.getFinalPresentationName());
				projectCharterHistory.setFinalPresentation(currProjectCharter.getFinalPresentation());
				projectCharterHistory.setFinalPresentationName(currProjectCharter.getFinalPresentationName());
				projectCharterHistory.setFinalPresentationType(currProjectCharter.getFinalPresentationType());
			} else {
				projectCharterHistory.setFinalPresentation(null);
				projectCharterHistory.setFinalPresentationName(null);
				projectCharterHistory.setFinalPresentationType(null);
			}
			if(currProjectCharter.getFinalClosurePresentationName() != null && !currProjectCharter.getFinalClosurePresentationName().isEmpty()) {
				System.out.println("name : "+currProjectCharter.getFinalClosurePresentationName());
				projectCharterHistory.setFinalCLosurePresentation(currProjectCharter.getFinalClosurePresentation());
				projectCharterHistory.setFinalClosurePresentationName(currProjectCharter.getFinalClosurePresentationName());
				projectCharterHistory.setFinalClosurePresentationType(currProjectCharter.getFinalClosurePresentationType());
			} else {
				projectCharterHistory.setFinalCLosurePresentation(null);
				projectCharterHistory.setFinalClosurePresentationName(null);
				projectCharterHistory.setFinalClosurePresentationType(null);
			}
			projectCharterHistoryDao.save(projectCharterHistory);
			projectCharterHistory = null;
			
			/* *********************************************************** */
			
			/** ********** Other Details ********** */

		
			if(projectCharter.getProjectStatus().compareTo(-1) != 0) {
				currProjectCharter.setProjectStatus(projectCharter.getProjectStatus());
			} else {
				currProjectCharter.setProjectStatus(null);
			}

	
			
			if(projectCharter.getSupportRequired() != null) {
				currProjectCharter.setSupportRequired(projectCharter.getSupportRequired());
			} else {
				currProjectCharter.setSupportRequired(null);
			}
			if(projectCharter.getTempFinalClosurePresentation() != null && !projectCharter.getTempFinalClosurePresentation().isEmpty()) {
				System.out.print("name : "+projectCharter.getTempFinalClosurePresentation().getOriginalFilename());
				currProjectCharter.setFinalClosurePresentation(projectCharter.getTempFinalClosurePresentation().getBytes());
				currProjectCharter.setFinalClosurePresentationName(StringUtils.cleanPath(projectCharter.getTempFinalClosurePresentation().getOriginalFilename()));
				currProjectCharter.setFinalClosurePresentationType(projectCharter.getTempFinalClosurePresentation().getContentType());
			}
			SimpleDateFormat format1 = new SimpleDateFormat("yyyy-mm-dd");
		    SimpleDateFormat format2 = new SimpleDateFormat("dd-MMM-yyyy");	;
		    if(projectCharter.getControlListTemp()!=null)
			{
				for(T_Project_Charter_Control charterControl : projectCharter.getControlListTemp()) {
					if(!charterControl.getControlActionTemp().isEmpty()&&!charterControl.getControlEstablishedInSystemTemp().isEmpty()) {
						System.out.println("Control Action:"+charterControl.getControlActionTemp());
						charterControl.setProjectCharterControl(projectCharter);
						charterControl.setControlAction(charterControl.getControlActionTemp());
						charterControl.setControlEstablishedInSystem(charterControl.getControlEstablishedInSystemTemp());
						Date date = format1.parse(charterControl.getControlEstablishedDateTemp());
						format2.format(date);
						System.out.println(date);
						charterControl.setControlEstablishedDate(date);
						charterControl.setControlCreatedOn(currDate);
						charterControl.setControlCreatedBy(user);
						charterControl.setActive(1);
						projectCharterControlDao.save(charterControl);
					}
				}
			}
		    currProjectCharter.setCharterLastUpdatedBy(user);
			currProjectCharter.setCharterLastUpdatedOn(currDate);
			currProjectCharter.setCharterActive(projectCharter.getCharterActive());
			StringBuilder projectId = new StringBuilder();
			projectId.append(currProjectCharter.getProjectTypeId().getProjectTypeShortCode());
			projectId.append("-"+currProjectCharter.getmEntityId().getEntityAcronym());
			projectId.append("-"+currProjectCharter.getmEntityId().getLocationId().getLocationName().toUpperCase());
			LocalDateTime now = LocalDateTime.now();
			projectId.append("-"+now.getDayOfMonth()+""+now.getMonth()+""+now.getYear());
			now = null;
			currProjectCharter.setProjectCharterCode(projectId.toString());
			projectId.setLength(0); projectId = null;
			if(projectCharter.getSaveOrSubmit().compareTo(1) == 0) {
				currProjectCharter.setProjectCharterStatus(8);
			} 
			
			projectCharterDao.save(currProjectCharter);
			if(projectCharter.getSaveOrSubmit().compareTo(1) == 0) {
				T_Project_Closure_Approval projectClosureApproval = new T_Project_Closure_Approval();
				projectClosureApproval.setProjectClosureApproval(currProjectCharter);
				projectClosureApproval.setApproverType(1);
				projectClosureApproval.setApproverId(currProjectCharter.getSponsor());
				projectClosureApproval.setApprovalSubmissionDate(currDate);
				projectClosureApproval.setApprovalStatus(0);
				projectClosureApproval.setActive(1);
				projectClosureApprovalDao.save(projectClosureApproval);
				projectClosureApproval = null;
			}	
			currProjectCharter = null;
			response.append("edit");
		}
		currDate = null; user = null;
		response.append("done");
		return response.toString();
	}
	
	@Override
	@Transactional
	public String saveSustenanceScoreDetails(T_Project_Charter projectCharter, HttpServletRequest request) throws Exception {
		StringBuilder response = new StringBuilder();
		T_Project_Charter currCharter=projectCharterDao.findById(projectCharter.gettProjectCharterId()).get();
		T_Project_Charter_Control currCharterControl;
		if(projectCharter.gettProjectCharterId() != null) {
			if(projectCharter.getControlListTemp()!=null) {
				for(T_Project_Charter_Control charterControl : projectCharter.getControlListTemp()) {
					System.out.println("Control Action:"+charterControl.gettProjectCharterControlIdTemp());
					currCharterControl = projectCharterControlDao.findById(charterControl.gettProjectCharterControlIdTemp()).get();
					currCharterControl.setProjectCharterControl(projectCharter);
					currCharterControl.setSustenancePresenceOfControl(charterControl.getSustenancePresenceOfControlTemp());
					currCharterControl.setSustenanceAuditComments(charterControl.getSustenanceAuditCommentsTemp());
					projectCharterControlDao.save(currCharterControl);
					currCharterControl = null;
				}
			}
		}
		currCharter.setSustenanceScore(projectCharter.getSustenanceScore());
		if(projectCharter.getSaveOrSubmit().compareTo(1)==0)
		{
			currCharter.setProjectCharterStatus(12);
		}
		projectCharterDao.save(currCharter);
		currCharter=null;
		response.append("done");
		return response.toString();
	}

	@Override
	@Transactional
	public String saveSustenanceAuditDetails(T_Project_Charter projectCharter, HttpServletRequest request) throws Exception {
		StringBuilder response = new StringBuilder();
		if(projectCharter.gettProjectCharterId() != null) {
			T_Project_Charter currProjectCharter = projectCharterDao.findById(projectCharter.gettProjectCharterId()).get();
			if(projectCharter.getSustenanceProblemSolvingLeaderTemp().compareTo(-1) != 0) {
				/*currProjectCharter.setProblemSolvingLeader(mUserDao.findById(Long.parseLong(""+projectCharter.getProblemSolvingLeaderTemp()));*/
				currProjectCharter.setSustenanceProblemSolvingLeader(mUserDao.findById(Long.parseLong(""+projectCharter.getSustenanceProblemSolvingLeaderTemp())).get());
			}
			
			if(projectCharter.getSustenanceAuditTargetTemp() != null && !projectCharter. getSustenanceAuditTargetTemp().isEmpty()) {
				currProjectCharter.setSustenanceAuditTarget(dateFormat.parse(projectCharter.getSustenanceAuditTargetTemp()));
			}
			if(projectCharter.getSustenanceComments() != null) {
				currProjectCharter.setSustenanceComments(projectCharter.getSustenanceComments());
			}
			currProjectCharter.setProjectCharterStatus(11);
			projectCharterDao.save(currProjectCharter);
			currProjectCharter = null;
			response.append("edit");
		}
		response.append("done");
		return response.toString();
	}
	
	@Override
	public void submitCharterMail(T_Project_Charter projectCharter, HttpServletRequest request) {
		try {
			SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy");
			Date currDate = new Date();
			T_Project_Charter currProjectCharter = projectCharterDao.findById(projectCharter.gettProjectCharterId()).get();
			StringBuilder confidentiality = new StringBuilder();
			if(currProjectCharter.getConfidentiality().compareTo(1) == 0) {
				confidentiality.append("Non-Confidential");
			} else {
				confidentiality.append("Confidential");
			}
			List<T_Project_Charter_Approval> approvalList = projectCharterApprovalDao.findByProjectCharterApprovalAndActive(currProjectCharter, 1);
			StringBuilder mailBody = new StringBuilder();
			mailBody.append(Common_Constants.emailHead);
			mailBody.append("<tr>" + 
					"	<td style='padding: 10px 10px 10px 10px;'>" + 
					"		<p style='margin: 0; padding:10px 0 0 0;color:#00AEEF;font-size:29px' class='namenow'>" + 
					"			<strong>MESSAGE FROM EXCELLENCE IN MANUFACTURING</strong>" + 
					"		</p>" + 
					"		<p style='margin: 0; padding:10px 0 0 0;color:#002E6D;font-size:21.5px' class='namenow'>" + 
					"			CONTENT" + 
					"		</p>" + 
					"		<br>" + 
					"		<p style='margin: 0; padding:10px 0 0 0;' class='namenow'>" + 
					"			INTERNAL COMMUNICATION<br>" + dateFormat.format(currDate) + 
					"		</p>" + 
					"	</td>" + 
					"</tr>" + 
					"<tr>");
			if(approvalList != null && approvalList.size() != 0) {
				
			} else {
				mailBody.append("<td style='padding: 10px 10px 10px 10px;'>" + 
						"	<p style='margin: 0;padding-bottom:10px;' class='namenow'>" + 
						"		Dear " + currProjectCharter.getSponsor().getUserFirstName() + " " + currProjectCharter.getSponsor().getUserLastName() + "," +
						"	</p>");
			}
			mailBody.append("<p style='margin: 0; padding:10px 0 0 0;' class='namenow'>" + 
					"						Project Charter has been created and awaiting your approval, details as follows:" + 
					"					</p>" + 
					"					<p style='margin: 0; padding:10px 0 0 0;' class='namenow'>" + 
					"					<table width='100%' class='innerTable'>" + 
					"						<tr style='background-color: #00AEEF;color:#ffffff'>" + 
					"							<td style='width:320px'>" + 
					"								<p style='margin: 0;padding: 5px 5px 5px 5px;'>" + 
					"									<strong>Department</strong>" + 
					"								</p>" + 
					"							</td>" + 
					"							<td style='width:320px'>" + 
					"								<p style='margin: 0;padding: 5px 5px 5px 5px;'>" + 
					"									<strong>Company</strong>" + 
					"								</p>" + 
					"							</td>" + 
					"							<td style='width:320px'>" + 
					"								<p style='margin: 0;padding: 5px 5px 5px 5px;'>" + 
					"									<strong>Location</strong>" + 
					"								</p>" + 
					"							</td>" + 
					"						</tr>" + 
					"						<tr style='background-color: #D1D7E2;'>" + 
					"							<td style='width:320px'>" + 
					"								<p style='margin: 0;padding: 5px 5px 5px 5px;'>" + 
					"									" + currProjectCharter.getProjectFunctionId().getProjectFunctionName() + 
					"								</p>" + 
					"							</td>" + 
					"							<td style='width:320px'>" + 
					"								<p style='margin: 0;padding: 5px 5px 5px 5px;'>" + 
					"									" + currProjectCharter.getmEntityId().getEntityName() +
					"								</p>" + 
					"							</td>" + 
					"							<td style='width:320px'>" + 
					"								<p style='margin: 0;padding: 5px 5px 5px 5px;'>" + 
					"									" + currProjectCharter.getmEntityId().getLocationId().getLocationName() + 
					"								</p>" + 
					"							</td>" + 
					"						</tr>" + 
					"					</table>" + 
					"					<table width='100%' class='innerTable'>" + 
					"						<tr style='background-color: #00AEEF;color:#ffffff'>" + 
					"							<td style='width:320px'>" + 
					"								<p style='margin: 0;padding: 5px 5px 5px 5px;'>" + 
					"									<strong>Project ID</strong>" + 
					"								</p>" + 
					"							</td>" + 
					"							<td style='width:320px'>" + 
					"								<p style='margin: 0;padding: 5px 5px 5px 5px;'>" + 
					"									<strong>Project Name</strong>" + 
					"								</p>" + 
					"							</td>" + 
					"							<td style='width:320px'>" + 
					"								<p style='margin: 0;padding: 5px 5px 5px 5px;'>" + 
					"									<strong>Created On</strong>" + 
					"								</p>" + 
					"							</td>" + 
					"							<td style='width:320px'>" + 
					"								<p style='margin: 0;padding: 5px 5px 5px 5px;'>" + 
					"									<strong>Created By</strong>" + 
					"								</p>" + 
					"							</td>" + 
					"						</tr>" + 
					"						<tr style='background-color: #D1D7E2;'>" + 
					"							<td style='width:320px'>" + 
					"								<p style='margin: 0;padding: 5px 5px 5px 5px;'>" + 
					"						" + currProjectCharter.getProjectCharterCode() +
					"								</p>" + 
					"							</td>" + 
					"							<td style='width:320px'>" + 
					"								<p style='margin: 0;padding: 5px 5px 5px 5px;'>" + 
					"						" + EncryptionDecryptionFunction.getDecryptedData(currProjectCharter.getProjectName()) +
					"								</p>" + 
					"							</td>" + 
					"							<td style='width:320px'>" + 
					"								<p style='margin: 0;padding: 5px 5px 5px 5px;'>" + 
					"						" + currProjectCharter.getCharterCreatedBy().getUserFirstName() + " " + currProjectCharter.getCharterCreatedBy().getUserLastName() + 
					"								</p>" + 
					"							</td>" + 
					"							<td style='width:320px'>" + 
					"								<p style='margin: 0;padding: 5px 5px 5px 5px;'>" + 
					"						" + dateFormat.format(currProjectCharter.getCharterCreatedOn()) + 
					"								</p>" + 
					"							</td>" + 
					"						</tr>" + 
					"					</table>" + 
					"					<table width='100%' class='innerTable'>" + 
					"						<tr style='background-color: #00AEEF;color:#ffffff'>" + 
					"							<td style='width:320px'>" + 
					"								<p style='margin: 0;padding: 5px 5px 5px 5px;'>" + 
					"									<strong>Type</strong>" + 
					"								</p>" + 
					"							</td>" + 
					"							<td style='width:320px'>" + 
					"								<p style='margin: 0;padding: 5px 5px 5px 5px;'>" + 
					"									<strong>Method</strong>" + 
					"								</p>" + 
					"							</td>" + 
					"							<td style='width:320px'>" + 
					"								<p style='margin: 0;padding: 5px 5px 5px 5px;'>" + 
					"									<strong>Confidentiality</strong>" + 
					"								</p>" + 
					"							</td>" + 
					"						</tr>" + 
					"						<tr style='background-color: #D1D7E2;'>" + 
					"							<td style='width:320px'>" + 
					"								<p style='margin: 0;padding: 5px 5px 5px 5px;'>" + 
					"						" + currProjectCharter.getProjectTypeId().getProjectTypeName() +
					"								</p>" + 
					"							</td>" + 
					"							<td style='width:320px'>" + 
					"								<p style='margin: 0;padding: 5px 5px 5px 5px;'>" + 
					"						" + currProjectCharter.getProjectMethodologyId().getProjectMethodologyName() + 
					"								</p>" + 
					"							</td>" + 
					"							<td style='width:320px'>" + 
					"								<p style='margin: 0;padding: 5px 5px 5px 5px;'>" + 
					"						" + confidentiality.toString() + 
					"								</p>" + 
					"							</td>" + 
					"						</tr>" + 
					"						<tr style='background-color: #00AEEF;color:#ffffff'>" + 
					"							<td style='width:320px'>" + 
					"								<p style='margin: 0;padding: 5px 5px 5px 5px;'>" + 
					"									<strong>Estimated Start Date</strong>" + 
					"								</p>" + 
					"							</td>" + 
					"							<td style='width:320px'>" + 
					"								<p style='margin: 0;padding: 5px 5px 5px 5px;'>" + 
					"									<strong>Estimated End Date</strong>" + 
					"								</p>" + 
					"							</td>" + 
					"							<td style='width:320px'>" + 
					"								<p style='margin: 0;padding: 5px 5px 5px 5px;'>" + 
					"									<strong>Define Date</strong>" + 
					"								</p>" + 
					"							</td>" + 
					"						</tr>" + 
					"						<tr style='background-color: #D1D7E2;'>" + 
					"							<td style='width:320px'>" + 
					"								<p style='margin: 0;padding: 5px 5px 5px 5px;'>" + 
					"						" + dateFormat.format(currProjectCharter.getEstimatedStartDate()) +
					"								</p>" + 
					"							</td>" + 
					"							<td style='width:320px'>" + 
					"								<p style='margin: 0;padding: 5px 5px 5px 5px;'>" + 
					"						" + dateFormat.format(currProjectCharter.getEstimatedEndDate()) +
					"								</p>" + 
					"							</td>" + 
					"							<td style='width:320px'>" + 
					"								<p style='margin: 0;padding: 5px 5px 5px 5px;'>" + 
					"						" + dateFormat.format(currProjectCharter.getDefineDate()) +
					"								</p>" + 
					"							</td>" + 
					"						</tr>" + 
					"						<tr style='background-color: #00AEEF;color:#ffffff'>" + 
					"							<td style='width:320px'>" + 
					"								<p style='margin: 0;padding: 5px 5px 5px 5px;'>" + 
					"									<strong>Sponsor</strong>" + 
					"								</p>" + 
					"							</td>" + 
					"							<td style='width:320px'>" + 
					"								<p style='margin: 0;padding: 5px 5px 5px 5px;'>" + 
					"									<strong>Process Owner</strong>" + 
					"								</p>" + 
					"							</td>" + 
					"							<td style='width:320px'>" + 
					"								<p style='margin: 0;padding: 5px 5px 5px 5px;'>" + 
					"									<strong>Problem Solving Leader</strong>" + 
					"								</p>" + 
					"							</td>" + 
					"						</tr>" + 
					"						<tr style='background-color: #D1D7E2;'>" + 
					"							<td style='width:320px'>" + 
					"								<p style='margin: 0;padding: 5px 5px 5px 5px;'>" + 
					"						" + currProjectCharter.getSponsor().getUserFirstName() + " " + currProjectCharter.getSponsor().getUserLastName() +
					"								</p>" + 
					"							</td>" + 
					"							<td style='width:320px'>" + 
					"								<p style='margin: 0;padding: 5px 5px 5px 5px;'>" + 
					"						" + currProjectCharter.getProcessOwner().getUserFirstName() + " " + currProjectCharter.getProcessOwner().getUserLastName() +
					"								</p>" + 
					"							</td>" + 
					"							<td style='width:320px'>" + 
					"								<p style='margin: 0;padding: 5px 5px 5px 5px;'>" + 
					"						" + currProjectCharter.getProblemSolvingLeader().getUserFirstName() + " " + currProjectCharter.getProblemSolvingLeader().getUserLastName() + 
					"								</p>" + 
					"							</td>" + 
					"						</tr>" + 
					"						<tr style='background-color: #00AEEF;color:#ffffff'>" + 
					"							<td style='width:320px'>" + 
					"								<p style='margin: 0;padding: 5px 5px 5px 5px;'>" + 
					"									<strong>Corporate Problem Solving Leader</strong>" + 
					"								</p>" + 
					"							</td>" + 
					"							<td style='width:320px'>" + 
					"								<p style='margin: 0;padding: 5px 5px 5px 5px;'>" + 
					"									<strong>Project Leader</strong>" + 
					"								</p>" + 
					"							</td>" + 
					"							<td style='width:320px'>" + 
					"								<p style='margin: 0;padding: 5px 5px 5px 5px;'>" + 
					"									<strong>COO/Business Head</strong>" + 
					"								</p>" + 
					"							</td>" + 
					"						</tr>" + 
					"						<tr style='background-color: #D1D7E2;'>" + 
					"							<td style='width:320px'>" + 
					"								<p style='margin: 0;padding: 5px 5px 5px 5px;'>" + 
					"						" + currProjectCharter.getCorporateProblemSolvingLeader().getUserFirstName() + " " + currProjectCharter.getCorporateProblemSolvingLeader().getUserLastName() +
					"								</p>" + 
					"							</td>" + 
					"							<td style='width:320px'>" + 
					"								<p style='margin: 0;padding: 5px 5px 5px 5px;'>" + 
					"						" + currProjectCharter.getProjectLeader().getUserFirstName() + " " + currProjectCharter.getProjectLeader().getUserLastName() +
					"								</p>" + 
					"							</td>" + 
					"							<td style='width:320px'>" + 
					"								<p style='margin: 0;padding: 5px 5px 5px 5px;'>" + 
					"						" + currProjectCharter.getBusinessHead().getUserFirstName() + " " + currProjectCharter.getBusinessHead().getUserLastName() + 
					"								</p>" + 
					"							</td>" + 
					"						</tr>" + 
					"					</table>" + 
					"					</p>" + 
					"				</td>" + 
					"			</tr>");
			mailBody.append(Common_Constants.emailFooter);
			List<String> to = new ArrayList<String>();
			to.add("mehul.bokdia@anandgroupindia.com");
			List<String> cc = new ArrayList<String>();
			List<String> bcc = new ArrayList<String>();
			mailService.sendToCcBccMail("Project Charter Approval", mailBody.toString(), to, cc, bcc);
			approvalList = null;
			mailBody.setLength(0); mailBody = null;
			currDate = null; dateFormat = null;
			confidentiality.setLength(0); confidentiality =null;
			currProjectCharter = null;
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<T_Project_Charter> getCharterProjectList(HttpServletRequest request, Integer offset) {
		List<T_Project_Charter> finalCharterList = new ArrayList<T_Project_Charter>();
		M_User user = mUserDao.findByUserLoginId(SecurityContextHolder.getContext().getAuthentication().getName());
		try {
			List<T_Project_Charter> charterList = new ArrayList<T_Project_Charter>();
			if(user.getmEntityId().getEntityAcronym().equalsIgnoreCase("AAPL")) {
				Integer currYear = 0;
				if(request.getParameter("yearId") == null) {
					currYear = Integer.parseInt(""+Year.now());
				} else {
					currYear = Integer.parseInt(""+request.getParameter("yearId"));
				}
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
				Date fromDate = sdf.parse("01/01/"+currYear);
				Date toDate = sdf.parse("31/12/"+currYear);
				if(offset == -1) {
					charterList = projectCharterDao.findAll();
				} else {
					charterList = projectCharterDao.getCharterProjectListForSpecificPeriod(fromDate,toDate,offset);
				}
			} else {
				if(offset == -1) {
					charterList = projectCharterDao.getAllCompanySpecificAccessAndActiveStatus(user.getmEntityId().getmEntityId(), 1);
				} else {
					charterList = projectCharterDao.getCompanySpecificAccessAndActiveStatus(user.getmEntityId().getmEntityId(), 1, offset);
				}
			}
			Collections.sort(charterList);
			for(T_Project_Charter charter : charterList) {
				charter.setProjectName(EncryptionDecryptionFunction.getDecryptedData(charter.getProjectName()));
				
				if(request.getParameter("entityId")!=null)
				{
					Long temp=Long.parseLong(request.getParameter("entityId"));
					if(temp!=-1&&temp!=charter.getmEntityId().getEntitySource().getmEntityId())
						continue;
				}
				if(request.getParameter("childId")!=null)
				{
					Long temp=Long.parseLong(request.getParameter("childId"));
					if(temp!=-1&&temp!=charter.getmEntityId().getmEntityId())
						continue;
					
				}
				
				if(charter.getProjectDescription() != null) {
					charter.setProjectDescription(EncryptionDecryptionFunction.getDecryptedData(charter.getProjectDescription()));
				}
				if(charter.getProjectCharterStatus() != null && charter.getProjectCharterStatus().compareTo(1) == 0) {
					for(T_Project_Charter_Approval approval : charter.getProjectCharterApproval()) {
						if(approval.getActive().compareTo(1) == 0) {
							if(approval.getApprovalStatus().compareTo(0) == 0) {
								charter.setApprovalPendingWith("Approval Pending with "+approval.getApproverId().getUserFirstName()+" "+approval.getApproverId().getUserLastName());
							}
						}
					}
				}
				if(charter.getProjectCharterStatus() != null && charter.getProjectCharterStatus().compareTo(5) == 0) {
					for(T_Project_Contract_Approval contract : charter.getProjectContractApproval()) {
						if(contract.getActive().compareTo(1) == 0) {
							if(contract.getApprovalStatus().compareTo(0) == 0) {
								charter.setContractApprovalPendingWith("Contract Approval Pending with "+contract.getApproverId().getUserFirstName()+" "+contract.getApproverId().getUserLastName());
							}
						}
					}
				}
				if(charter.getProjectCharterStatus() != null && charter.getProjectCharterStatus().compareTo(8) == 0) {
					for(T_Project_Closure_Approval closure : charter.getProjectClosureApproval()) {
						if(closure.getActive().compareTo(1) == 0) {
							if(closure.getApprovalStatus().compareTo(0) == 0) {
								charter.setClosureApprovalPendingWith("Closure Approval Pending with "+closure.getApproverId().getUserFirstName()+" "+closure.getApproverId().getUserLastName());
							}
						}
					}
				}
				if(charter.getProjectCharterStatus() != null && charter.getProjectCharterStatus().compareTo(11) == 0) {
					charter.setSustenanceAuditPendingWith("Sustenance Audit to be Done By "+charter.getSustenanceProblemSolvingLeader().getUserFirstName()+" "+charter.getSustenanceProblemSolvingLeader().getUserLastName());
				}
				
				finalCharterList.add(charter);
			}
		} catch(Exception e) {
			e.printStackTrace();
			finalCharterList.clear();
		}
		user = null;
		return finalCharterList;
	}

	@Override
	public List<T_Project_Charter_History> getCharterProjectHistoryList(HttpServletRequest request, Integer offset) {
		List<T_Project_Charter_History> finalCharterHistoryList = new LinkedList<T_Project_Charter_History>();
		try {
			List<T_Project_Charter_History> charterHistoryList = projectCharterHistoryDao.findByProjectCharterHistory(projectCharterDao.findById(Long.parseLong(""+request.getParameter("id"))).get());
			Collections.sort(charterHistoryList);
			for(T_Project_Charter_History charterHistory : charterHistoryList) {
				System.out.println(charterHistory.getProjectName());
				StringBuilder projectName = new StringBuilder();
				projectName.append(EncryptionDecryptionFunction.getDecryptedData(charterHistory.getProjectName()));
				System.out.println(projectName.toString());
				charterHistory.setProjectName(projectName.toString());
				projectName = null;
				if(charterHistory.getProjectDescription() != null) {
					charterHistory.setProjectDescription(EncryptionDecryptionFunction.getDecryptedData(charterHistory.getProjectDescription()));
				}
				finalCharterHistoryList.add(charterHistory);
			}
			charterHistoryList = null;
		} catch(Exception e) {
			e.printStackTrace();
			finalCharterHistoryList.clear();
		}
		return finalCharterHistoryList;
	}

	@Override
	public String getCharterCountForDashboard(HttpServletRequest request, Integer dataFetchFlag) {
		StringBuilder response = new StringBuilder();;
		try {
			Date currDate = new Date();
			Calendar c = Calendar.getInstance(); 
			c.setTime(currDate); 
			c.add(Calendar.MONTH, -12);
			Date fromDate = c.getTime();
			System.out.println(currDate+" - "+fromDate);
			List<T_Project_Charter> charterList = projectCharterDao.findByCharterActiveAndCharterCreatedOnBetween(1,fromDate, currDate);
			currDate = null; fromDate = null;
			c = null;
			Map<Integer, Integer> charterDriverCount = new LinkedHashMap<Integer, Integer>();
			Map<Integer, Float> charterDriverSavingCount = new LinkedHashMap<Integer, Float>();
			charterDriverCount.put(1, 0);charterDriverCount.put(2, 0);charterDriverCount.put(3, 0);
			charterDriverCount.put(4, 0);charterDriverCount.put(5, 0);
			charterDriverSavingCount.put(1, 0.0f);charterDriverSavingCount.put(2, 0.0f);charterDriverSavingCount.put(3, 0.0f);
			charterDriverSavingCount.put(4, 0.0f);charterDriverSavingCount.put(5, 0.0f);
			System.out.println("****-----****----");
			System.out.println(charterList.size());
			for(T_Project_Charter charter : charterList) {
				System.out.println(charter.gettProjectCharterId()+" - "+EncryptionDecryptionFunction.getDecryptedData(charter.getProjectName()));
				if(charter.getCharterPrimaryDriver().equals(1)) {
					if(dataFetchFlag == 1) {
						charterDriverSavingCount.put(1, charterDriverSavingCount.get(1)+charter.getEstimatedSaving());
					} else {
						charterDriverCount.put(1, charterDriverCount.get(1)+1);
					}
				} else if(charter.getCharterPrimaryDriver().equals(2)) {
					if(dataFetchFlag == 1) {
						charterDriverSavingCount.put(2, charterDriverSavingCount.get(2)+charter.getEstimatedSaving());
					} else {
						charterDriverCount.put(2, charterDriverCount.get(2)+1);
					}
				} else if(charter.getCharterPrimaryDriver().equals(3)) {
					if(dataFetchFlag == 1) {
						charterDriverSavingCount.put(3, charterDriverSavingCount.get(3)+charter.getEstimatedSaving());
					} else {
						charterDriverCount.put(3, charterDriverCount.get(3)+1);
					}
				} else if(charter.getCharterPrimaryDriver().equals(4)) {
					if(dataFetchFlag == 1) {
						charterDriverSavingCount.put(4, charterDriverSavingCount.get(4)+charter.getEstimatedSaving());
					} else {
						charterDriverCount.put(4, charterDriverCount.get(4)+1);
					}
				} else if(charter.getCharterPrimaryDriver().equals(5)) {
					if(dataFetchFlag == 1) {
						charterDriverSavingCount.put(5, charterDriverSavingCount.get(5)+charter.getEstimatedSaving());
					} else {
						charterDriverCount.put(5, charterDriverCount.get(5)+1);
					}
				}
			}
			charterList = null;
			Gson gson = new Gson();
			if(dataFetchFlag == 1) {
				response.append(gson.toJson(charterDriverSavingCount));
			} else {
				response.append(gson.toJson(charterDriverCount));
			}
			gson = null;
			charterDriverCount = null;
			charterDriverSavingCount = null;
		} catch(Exception e) {
			e.printStackTrace();
			response.setLength(0);
		}
		return response.toString();
	}
}