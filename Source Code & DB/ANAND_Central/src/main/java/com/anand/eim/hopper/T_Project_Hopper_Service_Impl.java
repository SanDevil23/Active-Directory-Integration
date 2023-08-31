package com.anand.eim.hopper;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.anand.common.EncryptionDecryptionFunction;
import com.anand.masters.M_Entity_Dao;
import com.anand.eim.masters.M_Project_Function_Dao;
import com.anand.eim.masters.M_Project_Methodology_Dao;
import com.anand.eim.masters.M_Project_Type_Dao;
import com.anand.masters.M_User;
import com.anand.masters.M_User_Dao;
import com.google.gson.Gson;

@Service
public class T_Project_Hopper_Service_Impl implements T_Project_Hopper_Service {

	@Autowired private M_Project_Hopper_Dao projectHopperDao;
	@Autowired private T_Project_Hopper_History_Dao projectHopperHistoryDao;
	@Autowired private M_Project_Function_Dao mProjectFunctionDao;
	@Autowired private M_Project_Methodology_Dao mProjectMethodologyDao;
	@Autowired private M_Project_Type_Dao mProjectTypeDao;
	@Autowired private M_Entity_Dao mEntityDao;
	@Autowired private M_User_Dao mUserDao;

	@Override
	public T_Project_Hopper getHopperProjectDetail(HttpServletRequest request) {
		T_Project_Hopper projectHopper = projectHopperDao.findById(Long.parseLong(""+request.getParameter("id"))).get();
		try {
			projectHopper.setSponsorTemp(Integer.parseInt(""+projectHopper.getSponsor().getmUserId()));
			projectHopper.setProblemSolvingLeaderTemp(Integer.parseInt(""+projectHopper.getProblemSolvingLeader().getmUserId()));
			projectHopper.setCorporateProblemSolvingLeaderTemp(Integer.parseInt(""+projectHopper.getCorporateProblemSolvingLeader().getmUserId()));
			projectHopper.setProjectLeaderTemp(Integer.parseInt(""+projectHopper.getProjectLeader().getmUserId()));
			projectHopper.setFunctionTemp(Integer.parseInt(""+projectHopper.getProjectFunctionId().getProjectFunctionId()));
			projectHopper.setMetheodologyTemp(Integer.parseInt(""+projectHopper.getProjectMethodologyId().getProjectMethodologyId()));
			projectHopper.setTypeTemp(Integer.parseInt(""+projectHopper.getProjectTypeId().getProjectTypeId()));
			projectHopper.setCompanyTemp(Integer.parseInt(""+projectHopper.getmEntityId().getmEntityId()));
			projectHopper.setProjectName(EncryptionDecryptionFunction.getDecryptedData(projectHopper.getProjectName()));
			projectHopper.setProjectDescription(EncryptionDecryptionFunction.getDecryptedData(projectHopper.getProjectDescription()));
		} catch(Exception e) {
			e.printStackTrace();
		}
		return projectHopper;
	}

	@Override
	@Transactional
	public String saveHopperProjectDetails(T_Project_Hopper projectHopper, HttpServletRequest request) {
		StringBuilder response = new StringBuilder();
		M_User currUser = mUserDao.findByUserLoginId(SecurityContextHolder.getContext().getAuthentication().getName());
		try {
			if(projectHopper.gettProjectHopperId() != null) {
				T_Project_Hopper currProjectHopper = projectHopperDao.findById(projectHopper.gettProjectHopperId()).get();
				/* *********************************************************** */
				/* Save Current Data to History Table and then proceed editing */
				T_Project_Hopper_History projectHopperHistory = new T_Project_Hopper_History();
				projectHopperHistory.setProjectHopperHistory(currProjectHopper);
				projectHopperHistory.setProjectFunctionId(currProjectHopper.getProjectFunctionId());
				projectHopperHistory.setProjectMethodologyId(currProjectHopper.getProjectMethodologyId());
				projectHopperHistory.setProjectTypeId(currProjectHopper.getProjectTypeId());
				projectHopperHistory.setmEntityId(currProjectHopper.getmEntityId());
				projectHopperHistory.setConfidentiality(currProjectHopper.getConfidentiality());
				projectHopperHistory.setProjectName(currProjectHopper.getProjectName());
				projectHopperHistory.setProjectDescription(currProjectHopper.getProjectDescription());
				projectHopperHistory.setSponsor(currProjectHopper.getSponsor());
				projectHopperHistory.setProblemSolvingLeader(currProjectHopper.getProblemSolvingLeader());
				projectHopperHistory.setCorporateProblemSolvingLeader(currProjectHopper.getCorporateProblemSolvingLeader());
				if(currProjectHopper.getProjectLeader() != null) {
					projectHopperHistory.setProjectLeader(currProjectHopper.getProjectLeader());
				}
				projectHopperHistory.setHopperPrimaryDriver(currProjectHopper.getHopperPrimaryDriver());
				projectHopperHistory.setEstimatedSaving(currProjectHopper.getEstimatedSaving());
				projectHopperHistory.setHopperActive(currProjectHopper.getHopperActive());
				if(currProjectHopper.getHopperLastUpdatedBy() != null) {
					projectHopperHistory.setHopperCreatedBy(currProjectHopper.getHopperLastUpdatedBy());
				} else {
					projectHopperHistory.setHopperCreatedBy(currProjectHopper.getHopperCreatedBy());
				}
				projectHopperHistory.setHopperCreatedOn(currProjectHopper.getHopperCreatedOn());
				projectHopperHistoryDao.save(projectHopperHistory);
				projectHopperHistory = null;
				/* *********************************************************** */
				
				currProjectHopper.setProjectFunctionId(mProjectFunctionDao.findById(Long.parseLong(""+projectHopper.getFunctionTemp())).get());
				currProjectHopper.setProjectMethodologyId(mProjectMethodologyDao.findById(Long.parseLong(""+projectHopper.getMetheodologyTemp())).get());
				/*currProjectHopper.setProjectTypeId(mProjectTypeDao.getOne(projectHopper.getTypeTemp()));*/
				currProjectHopper.setProjectTypeId(mProjectTypeDao.findById(Long.parseLong(""+projectHopper.getTypeTemp())).get());
				
				/*currProjectHopper.setmEntityId(mEntityDao.getOne(projectHopper.getCompanyTemp()));*/
				currProjectHopper.setmEntityId(mEntityDao.findById(Long.parseLong(""+projectHopper.getCompanyTemp())).get());
				
				currProjectHopper.setConfidentiality(projectHopper.getConfidentiality());
				currProjectHopper.setProjectName(EncryptionDecryptionFunction.getEncryptedData(projectHopper.getProjectName().trim().replaceAll("\\s+", " ")));
				currProjectHopper.setProjectDescription(EncryptionDecryptionFunction.getEncryptedData(projectHopper.getProjectDescription().trim().replaceAll("\\s+", " ")));
				
				/*currProjectHopper.setSponsor(mUserDao.getOne(projectHopper.getSponsorTemp()));*/
				currProjectHopper.setSponsor(mUserDao.findById(Long.parseLong(""+projectHopper.getSponsorTemp())).get());
				
				/*currProjectHopper.setProblemSolvingLeader(mUserDao.getOne(projectHopper.getProblemSolvingLeaderTemp()));*/
				currProjectHopper.setProblemSolvingLeader(mUserDao.findById(Long.parseLong(""+projectHopper.getProblemSolvingLeaderTemp())).get());
				
				/*currProjectHopper.setCorporateProblemSolvingLeader(mUserDao.getOne(projectHopper.getCorporateProblemSolvingLeaderTemp()));*/
				currProjectHopper.setCorporateProblemSolvingLeader(mUserDao.findById(Long.parseLong(""+projectHopper.getCorporateProblemSolvingLeaderTemp())).get());
				
				currProjectHopper.setProjectLeader(null);
				if(projectHopper.getProjectLeaderTemp().compareTo(-1) != 0) {
					/*currProjectHopper.setProjectLeader(mUserDao.getOne(projectHopper.getProjectLeaderTemp()));*/
					currProjectHopper.setProjectLeader(mUserDao.findById(Long.parseLong(""+projectHopper.getProjectLeaderTemp())).get());
				}
				currProjectHopper.setHopperPrimaryDriver(projectHopper.getHopperPrimaryDriver());
				currProjectHopper.setEstimatedSaving(projectHopper.getEstimatedSaving());
				currProjectHopper.setHopperLastUpdatedBy(currUser);
				currProjectHopper.setHopperLastUpdatedOn(new Date());
				projectHopperDao.save(currProjectHopper);
				currProjectHopper = null;
				response.append("edit");
			} else {
				/*projectHopper.setProjectFunctionId(mProjectFunctionDao.getOne(projectHopper.getFunctionTemp()));*/
				projectHopper.setProjectFunctionId(mProjectFunctionDao.findById(Long.parseLong(""+projectHopper.getFunctionTemp())).get());
				
				/*projectHopper.setProjectMethodologyId(mProjectMethodologyDao.getOne(projectHopper.getMetheodologyTemp()));*/
				projectHopper.setProjectMethodologyId(mProjectMethodologyDao.findById(Long.parseLong(""+projectHopper.getMetheodologyTemp())).get());
				
				/*projectHopper.setProjectTypeId(mProjectTypeDao.getOne(projectHopper.getTypeTemp()));*/
				projectHopper.setProjectTypeId(mProjectTypeDao.findById(Long.parseLong(""+projectHopper.getTypeTemp())).get());
				
				/*projectHopper.setmEntityId(mEntityDao.getOne(projectHopper.getCompanyTemp()));*/
				projectHopper.setmEntityId(mEntityDao.findById(Long.parseLong(""+projectHopper.getCompanyTemp())).get());
				
				projectHopper.setConfidentiality(projectHopper.getConfidentiality());
				projectHopper.setProjectName(EncryptionDecryptionFunction.getEncryptedData(projectHopper.getProjectName().trim().replaceAll("\\s+", " ")));
				projectHopper.setProjectDescription(EncryptionDecryptionFunction.getEncryptedData(projectHopper.getProjectDescription().trim().replaceAll("\\s+", " ")));
				
				/*projectHopper.setSponsor(mUserDao.getOne(projectHopper.getSponsorTemp()));*/
				projectHopper.setSponsor(mUserDao.findById(Long.parseLong(""+projectHopper.getSponsorTemp())).get());
				
				/*projectHopper.setProblemSolvingLeader(mUserDao.getOne(projectHopper.getProblemSolvingLeaderTemp()));*/
				projectHopper.setProblemSolvingLeader(mUserDao.findById(Long.parseLong(""+projectHopper.getProblemSolvingLeaderTemp())).get());
				
				/*projectHopper.setCorporateProblemSolvingLeader(mUserDao.getOne(projectHopper.getCorporateProblemSolvingLeaderTemp()));*/
				projectHopper.setCorporateProblemSolvingLeader(mUserDao.findById(Long.parseLong(""+projectHopper.getCorporateProblemSolvingLeaderTemp())).get());
				
				projectHopper.setProjectLeader(null);
				if(projectHopper.getProjectLeaderTemp().compareTo(-1) != 0) {
					/*projectHopper.setProjectLeader(mUserDao.getOne(projectHopper.getProjectLeaderTemp()));*/
					projectHopper.setProjectLeader(mUserDao.findById(Long.parseLong(""+projectHopper.getProjectLeaderTemp())).get());
				}
				projectHopper.setEstimatedSaving(projectHopper.getEstimatedSaving());
				projectHopper.setHopperCreatedBy(currUser);
				projectHopper.setHopperCreatedOn(new Date());
				projectHopperDao.save(projectHopper);
				response.append("add");
			}
			response.append("done");
		} catch(Exception e) {
			e.printStackTrace();
			response.setLength(0);
			response.append("error");
		}
		currUser = null;
		return response.toString();
	}

	@Override
	public List<T_Project_Hopper> getHopperProjectList(HttpServletRequest request, Integer offset) {
		List<T_Project_Hopper> finalHopperList = new ArrayList<T_Project_Hopper>();
		try {
			List<T_Project_Hopper> hopperList = new ArrayList<T_Project_Hopper>();
			/** offset == -1 - get all company list */
			/** offset != -1 - get company list based on offsetValue */
			if(offset == -1) {
				hopperList = projectHopperDao.findAll();
			} else {
				hopperList = projectHopperDao.getHopperProjectList(offset);
			}
			for(T_Project_Hopper hopper : hopperList) {
				hopper.setProjectName(EncryptionDecryptionFunction.getDecryptedData(hopper.getProjectName()));
				hopper.setProjectDescription(EncryptionDecryptionFunction.getDecryptedData(hopper.getProjectDescription()));
				finalHopperList.add(hopper);
			}
		} catch(Exception e) {
			e.printStackTrace();
			finalHopperList.clear();
		}
		return finalHopperList;
	}

	@Override
	public List<T_Project_Hopper_History> getHopperProjectHistoryList(HttpServletRequest request, Integer offset) {
		List<T_Project_Hopper_History> finalHopperHistoryList = new LinkedList<T_Project_Hopper_History>();
		try {
			List<T_Project_Hopper_History> hopperHistoryList = projectHopperHistoryDao.findByProjectHopperHistory(projectHopperDao.findById(Long.parseLong(""+request.getParameter("id"))).get());
			Collections.sort(hopperHistoryList);
			for(T_Project_Hopper_History hopperHistory : hopperHistoryList) {
				hopperHistory.setProjectName(EncryptionDecryptionFunction.getDecryptedData(hopperHistory.getProjectName()));
				hopperHistory.setProjectDescription(EncryptionDecryptionFunction.getDecryptedData(hopperHistory.getProjectDescription()));
				finalHopperHistoryList.add(hopperHistory);
			}
			hopperHistoryList = null;
		} catch(Exception e) {
			e.printStackTrace();
			finalHopperHistoryList.clear();
		}
		return finalHopperHistoryList;
	}

	@Override
	public String getHopperCountForDashboard(HttpServletRequest request, Integer dataFetchFlag) {
		StringBuilder response = new StringBuilder();;
		try {
			Date currDate = new Date();
			Calendar c = Calendar.getInstance(); 
			c.setTime(currDate); 
			c.add(Calendar.MONTH, -12);
			Date fromDate = c.getTime();
			System.out.println(currDate+" - "+fromDate);
			List<T_Project_Hopper> hopperList = projectHopperDao.findByHopperActiveAndHopperCreatedOnBetween(1,fromDate, currDate);
			currDate = null; fromDate = null;
			c = null;
			Map<Integer, Integer> hopperDriverCount = new LinkedHashMap<Integer, Integer>();
			Map<Integer, Float> hopperDriverSavingCount = new LinkedHashMap<Integer, Float>();
			hopperDriverCount.put(1, 0);hopperDriverCount.put(2, 0);hopperDriverCount.put(3, 0);
			hopperDriverCount.put(4, 0);hopperDriverCount.put(5, 0);
			hopperDriverSavingCount.put(1, 0.0f);hopperDriverSavingCount.put(2, 0.0f);hopperDriverSavingCount.put(3, 0.0f);
			hopperDriverSavingCount.put(4, 0.0f);hopperDriverSavingCount.put(5, 0.0f);
			System.out.println("****-----****----");
			System.out.println(hopperList.size());
			for(T_Project_Hopper hopper : hopperList) {
				if(hopper.getHopperPrimaryDriver().equals(1)) {
					if(dataFetchFlag == 1) {
						hopperDriverSavingCount.put(1, hopperDriverSavingCount.get(1)+hopper.getEstimatedSaving());
					} else {
						hopperDriverCount.put(1, hopperDriverCount.get(1)+1);
					}
				} else if(hopper.getHopperPrimaryDriver().equals(2)) {
					if(dataFetchFlag == 1) {
						hopperDriverSavingCount.put(2, hopperDriverSavingCount.get(2)+hopper.getEstimatedSaving());
					} else {
						hopperDriverCount.put(2, hopperDriverCount.get(2)+1);
					}
				} else if(hopper.getHopperPrimaryDriver().equals(3)) {
					if(dataFetchFlag == 1) {
						hopperDriverSavingCount.put(3, hopperDriverSavingCount.get(3)+hopper.getEstimatedSaving());
					} else {
						hopperDriverCount.put(3, hopperDriverCount.get(3)+1);
					}
				} else if(hopper.getHopperPrimaryDriver().equals(4)) {
					if(dataFetchFlag == 1) {
						hopperDriverSavingCount.put(4, hopperDriverSavingCount.get(4)+hopper.getEstimatedSaving());
					} else {
						hopperDriverCount.put(4, hopperDriverCount.get(4)+1);
					}
				} else if(hopper.getHopperPrimaryDriver().equals(5)) {
					if(dataFetchFlag == 1) {
						hopperDriverSavingCount.put(5, hopperDriverSavingCount.get(5)+hopper.getEstimatedSaving());
					} else {
						hopperDriverCount.put(5, hopperDriverCount.get(5)+1);
					}
				}
			}
			hopperList = null;
			Gson gson = new Gson();
			if(dataFetchFlag == 1) {
				response.append(gson.toJson(hopperDriverSavingCount));
			} else {
				response.append(gson.toJson(hopperDriverCount));
			}
			gson = null;
			hopperDriverCount = null;
			hopperDriverSavingCount = null;
		} catch(Exception e) {
			e.printStackTrace();
			response.setLength(0);
		}
		return response.toString();
	}

}