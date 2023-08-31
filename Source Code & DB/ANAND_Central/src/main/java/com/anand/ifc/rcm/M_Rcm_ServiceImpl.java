package com.anand.ifc.rcm;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Year;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.anand.ifc.masters.M_Process_Dao;
import com.anand.masters.M_Department_Dao;
import com.anand.masters.M_Entity;
import com.anand.masters.M_Entity_Dao;
import com.anand.masters.M_User;
import com.anand.masters.M_User_Dao;
import com.google.gson.Gson;

@Service
public class M_Rcm_ServiceImpl implements M_Rcm_Service {

	@Autowired private M_Rcm_Dao mRcmDao;
	@Autowired private M_Department_Dao mDepartmentDao;
	@Autowired private M_Plant_Dao mPlantDao;
	@Autowired private M_Process_Dao mProcessDao;
	@Autowired private M_User_Dao mUserDao;
	@Autowired private M_Entity_Dao mEntityDao;
	@Autowired private M_Transaction_Dao mTransactionDao;
	@Autowired private M_Tracker_Dao mTrackerDao;

	@Override
	public List<M_Rcm> getRcmList(HttpServletRequest request, Integer offset) {
		List<M_Rcm> rcmListFinal = new ArrayList<M_Rcm>();
		try {
			List<M_Rcm> rcmList = null;
			HttpSession session = request.getSession(true);
			Integer activenessCheck = 1;
			if(request.getParameter("all") != null && activenessCheck.compareTo(Integer.parseInt(""+request.getParameter("all"))) == 0) {
				rcmList = mRcmDao.findAll();
			} else {
				rcmList = mRcmDao.getRcmListWithOffset(offset);
			}
			for(M_Rcm rcm : rcmList) {
				rcm.setActionForList("");
				if((session.getAttribute("admin") != null && activenessCheck.compareTo(Integer.parseInt(""+session.getAttribute("admin"))) == 0)
					|| (session.getAttribute("itAdmin") != null && activenessCheck.compareTo(Integer.parseInt(""+session.getAttribute("itAdmin"))) == 0)) {
					rcm.setActionForList("<a href='#' title='Edit rcm' onclick='editRcm("+rcm.getRcmId()+");'><i class='fas fa-edit'></i></a>");
				}
				if(rcm.getActionForList() != null && !rcm.getActionForList().isEmpty()) {
					rcm.setActionForList(rcm.getActionForList()+"&ensp;<a href='#' title='Get User Information' onclick='getRcmInfo("+rcm.getRcmId()+")'><i class='fas fa-info'></i></a>");
				} else {
					rcm.setActionForList(rcm.getActionForList()+"<a href='#' title='Get User Information' onclick='getRcmInfo("+rcm.getRcmId()+")'><i class='fas fa-info'></i></a>");
				}
				rcmListFinal.add(rcm);
			}
			activenessCheck = null;
			session = null;
			rcmList.clear(); rcmList = null;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return rcmListFinal;
	}
	
	@Override
	@Transactional
	public String saveDepartmentDetails(HttpServletRequest request, M_Rcm rcm) throws ParseException {
		StringBuilder response = new StringBuilder();
		M_User user = mUserDao.findByUserLoginId(SecurityContextHolder.getContext().getAuthentication().getName());
		Date currDate = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		if(rcm.getRcmId() != null) {
			M_Rcm currRcm = mRcmDao.findById(rcm.getRcmId()).get();
			currRcm.setControlNo(rcm.getControlNo());
			currRcm.setmProcessId(mProcessDao.findById(Long.parseLong(""+rcm.getTempProcessId())).get());
			currRcm.setSubProcess(rcm.getSubProcess());
			currRcm.setProcessOwner(rcm.getProcessOwner());
			currRcm.setControlObjective(rcm.getControlObjective());
			currRcm.setRisk(rcm.getRisk());
			currRcm.setEntityControl(rcm.getEntityControl());
			currRcm.setmDepartmentId(mDepartmentDao.findById(Long.parseLong(""+rcm.getTempDepartmentId())).get());
			currRcm.setRiskRating(rcm.getRiskRating());
			currRcm.setControlFrequency(rcm.getControlFrequency());
			currRcm.setUploadFrequency(rcm.getUploadFrequency());
			currRcm.setControlStartDate(formatter.parse(rcm.getControlStartDateTemp()));
			currRcm.setValidityDate(formatter.parse(rcm.getValidityDateTemp()));
			currRcm.setFraudRisk(rcm.getFraudRisk());
			currRcm.setUniqueReferred(rcm.getUniqueReferred());
			currRcm.setKeyInfo(rcm.getKeyInfo());
			currRcm.setPreventiveDetective(rcm.getPreventiveDetective());
			currRcm.setControlType(rcm.getControlType());
			currRcm.setSelfCertificateCheck(rcm.getSelfCertificateCheck());
			currRcm.setRemarks(rcm.getRemarks());
			currRcm.setRcmStatus(rcm.getRcmStatus());
			//currRcm.setRcmCreatedBy((mUserDao.findByUserLoginId(SecurityContextHolder.getContext().getAuthentication().getName())));
			mRcmDao.save(currRcm);
			for(M_Plant rcmPlant : currRcm.getPlantForRcm()) {
				System.out.println("-- plant : "+rcmPlant.getPlantId().getEntityName()+" "+rcmPlant.getPlantId().getLocationId().getLocationName());
				rcmPlant.setPlantActive(0);
				mPlantDao.save(rcmPlant);
			}
			if(rcm.getPlantListTemp() != null) {
				System.out.println("rcmPlantSize : "+rcm.getPlantListTemp().size());
				for(M_Plant rcmPlant : rcm.getPlantListTemp()) {
					if(rcmPlant != null) {
						if(rcmPlant.getRcmPlantId() != null) {
							M_Plant currRcmPlant = mPlantDao.findById(rcmPlant.getRcmPlantId()).get();
							System.out.println("update plant : "+rcmPlant.getRcmPlantId()+" - "+currRcmPlant.getPlantForRcm().getmDepartmentId().getDepartmentName()+" - "+currRcmPlant.getPlantId().getEntityName()+" "+currRcmPlant.getPlantId().getLocationId().getLocationName());
							currRcmPlant.setPlantActive(1);
							mPlantDao.save(currRcmPlant);
						} else {
							if(rcmPlant.getPlantActive() != null) {
								System.out.println("add new plant : "+rcmPlant.getPlantIdTemp());
								M_Entity entity = mEntityDao.findById(rcmPlant.getPlantIdTemp()).get();
								List<M_Plant> exisitingRcmForPlant = mPlantDao.findByPlantForRcmAndPlantId(currRcm, entity);
								if(exisitingRcmForPlant != null && exisitingRcmForPlant.size() != 0) {
									for(M_Plant currRcmPlant : exisitingRcmForPlant) {
										currRcmPlant.setPlantForRcm(currRcm);
										currRcmPlant.setPlantId(entity);
										currRcmPlant.setSohBy(mUserDao.findById(rcmPlant.getSohByTemp()).get());
										currRcmPlant.setLineManager(mUserDao.findById(rcmPlant.getLineManagerTemp()).get());
										if(rcmPlant.getPraacTemp() != null) {
											rcmPlant.setPraac(mUserDao.findById(rcmPlant.getPraacTemp()).get());
										}
										currRcmPlant.setPlantActive(rcmPlant.getPlantActive());
										mPlantDao.save(currRcmPlant);
									}
								} else {
									rcmPlant.setPlantForRcm(currRcm);
									rcmPlant.setPlantId(entity);
									rcmPlant.setSohBy(mUserDao.findById(rcmPlant.getSohByTemp()).get());
									rcmPlant.setLineManager(mUserDao.findById(rcmPlant.getLineManagerTemp()).get());
									if(rcmPlant.getPraacTemp() != null) {
										rcmPlant.setPraac(mUserDao.findById(rcmPlant.getPraacTemp()).get());
									}
									rcmPlant.setPlantCreatedOn(currDate);
									rcmPlant.setPlantCreatedBy(user);
									rcmPlant.setPlantActive(rcmPlant.getPlantActive());
									mPlantDao.save(rcmPlant);
								}
								exisitingRcmForPlant.clear(); exisitingRcmForPlant = null;
								entity = null;
							}
						}
					}
				}
			}
			response.append("edit");
		} else {
	        rcm.setmDepartmentId(mDepartmentDao.findById(Long.parseLong(""+rcm.getTempDepartmentId())).get());
	        rcm.setmProcessId(mProcessDao.findById(Long.parseLong(""+rcm.getTempProcessId())).get());
	        rcm.setControlStartDate(formatter.parse(rcm.getControlStartDateTemp()));
			rcm.setValidityDate(formatter.parse(rcm.getValidityDateTemp()));
			rcm.setRcmCreatedOn(currDate);
			mRcmDao.save(rcm);
			if(rcm.getPlantListTemp() != null) {
				for(M_Plant rcmPlant : rcm.getPlantListTemp()) {
					if(rcmPlant != null && rcmPlant.getPlantActive() != null && rcmPlant.getPlantActive().compareTo(1) == 0) {
						System.out.println(rcmPlant.getPlantIdTemp()+" - - - ");
						rcmPlant.setPlantForRcm(rcm);
						rcmPlant.setSohBy(mUserDao.findById(rcmPlant.getSohByTemp()).get());
						rcmPlant.setLineManager(mUserDao.findById(rcmPlant.getLineManagerTemp()).get());
						if(rcmPlant.getPraacTemp() != null) {
						rcmPlant.setPraac(mUserDao.findById(rcmPlant.getPraacTemp()).get());
						}
						rcmPlant.setPlantCreatedOn(currDate);
						rcmPlant.setPlantCreatedBy(user);
						rcmPlant.setPlantId(mEntityDao.findById(rcmPlant.getPlantIdTemp()).get());
						rcmPlant.setPlantActive(rcmPlant.getPlantActive());
						mPlantDao.save(rcmPlant);
					}
				}
			}
			response.append("add");
		}
		formatter = null; currDate = null; user = null; 
		return response.toString();
	}
	@Override
	public String getRcmDetails(HttpServletRequest request) {
		String response = "";
		Map<String, String> rcmDetails = new HashMap<String, String>();
		try {
			/*M_Entity entity = mEntityDao.getOne(Integer.parseInt(""+request.getParameter("mEntityId")));*/
			
			
			M_Rcm rcm = mRcmDao.findById(Long.parseLong(""+request.getParameter("rcmId"))).get();
			
			DateFormat df = new SimpleDateFormat("dd/MM/yyyy");  

			rcmDetails.put("controlNo", rcm.getControlNo());
			rcmDetails.put("mProcessId", ""+rcm.getmProcessId().getmProcessId());
			rcmDetails.put("processName", ""+rcm.getmProcessId().getProcessName());
			rcmDetails.put("subProcess", ""+rcm.getSubProcess());
			rcmDetails.put("processOwner", rcm.getProcessOwner());
			rcmDetails.put("controlObjective", rcm.getControlObjective());
			rcmDetails.put("risk", rcm.getRisk());
			rcmDetails.put("riskRating", ""+rcm.getRiskRating());
			rcmDetails.put("controlFrequency", ""+rcm.getControlFrequency());
			rcmDetails.put("entityControl", ""+rcm.getEntityControl());
			rcmDetails.put("mDepartmentId", ""+rcm.getmDepartmentId().getmDepartmentId());
			rcmDetails.put("departmentName", ""+rcm.getmDepartmentId().getDepartmentName());
			rcmDetails.put("uploadFrequency", ""+rcm.getUploadFrequency());
			rcmDetails.put("controlStartDate", ""+df.format(rcm.getControlStartDate()));
			rcmDetails.put("validityDate", ""+df.format(rcm.getValidityDate()));
			rcmDetails.put("fraudRisk", ""+rcm.getFraudRisk());
			rcmDetails.put("uniqueReferred", ""+rcm.getUniqueReferred());
			rcmDetails.put("keyInfo", ""+rcm.getKeyInfo());
			rcmDetails.put("preventiveDetective", ""+rcm.getPreventiveDetective());
			rcmDetails.put("controlType", ""+rcm.getControlType());
			rcmDetails.put("selfCertificateCheck", ""+rcm.getSelfCertificateCheck());
			rcmDetails.put("remarks", ""+rcm.getRemarks());
			rcmDetails.put("rcmStatus", ""+rcm.getRcmStatus());
			Integer plantIndex = 0;
			for(M_Plant rcmPlant : rcm.getPlantForRcm()) {
				if(rcmPlant.getPlantActive().compareTo(1) == 0) {
					rcmDetails.put("plant"+plantIndex, ""+rcmPlant.getPlantId().getEntityName()+" "+rcmPlant.getPlantId().getLocationId().getLocationName());
					rcmDetails.put("sohBy"+plantIndex, ""+rcmPlant.getSohBy().getUserFirstName()+" "+rcmPlant.getSohBy().getUserLastName());
					rcmDetails.put("lineManager"+plantIndex, ""+rcmPlant.getLineManager().getUserFirstName()+" "+rcmPlant.getLineManager().getUserLastName());
					if(rcmPlant.getPraac() != null) {
					rcmDetails.put("praac"+plantIndex, ""+rcmPlant.getPraac().getUserFirstName()+" "+rcmPlant.getPraac().getUserLastName());
					}
					else {
						rcmDetails.put("praac"+plantIndex, " ");
					}
					rcmDetails.put("rcmPlantId"+plantIndex, ""+rcmPlant.getRcmPlantId());
					plantIndex++;
				}
			}
			rcmDetails.put("plantIndex", ""+plantIndex);
			plantIndex = null;
			Gson gson = new Gson();
			response = gson.toJson(rcmDetails);
			gson = null; rcm = null; rcmDetails = null;
		} catch(Exception e) {
			e.printStackTrace();
			response = "error";
		}
		return response;
	}

	@Override
	public List<M_Transaction> getRcmTxnList(HttpServletRequest request, Integer offset) {
		List<M_Transaction> txnListFinal=new ArrayList<M_Transaction>();
		try {
			HttpSession session = request.getSession(true);
			Integer activenessCheck = 1;
			Integer currYear = 0;
			if(request.getParameter("yearId") == null) {
				currYear = Integer.parseInt(""+Year.now());
			} else {
				currYear = Integer.parseInt(""+request.getParameter("yearId"));
			}
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			Date fromDate = sdf.parse("01/01/"+currYear);
			Date toDate = sdf.parse("31/12/"+currYear);
			System.out.println("currYear : "+currYear);
			List<M_Transaction> txnList = mTransactionDao.getAllPurchaseIdForSpecificPeriod(fromDate, toDate);
			M_User currUser = mUserDao.findByUserLoginId(SecurityContextHolder.getContext().getAuthentication().getName());
			for(M_Transaction txn : txnList) {
				Integer defaultValFlag = -1;
				Integer addFlag = 1;
				if(request.getParameter("parentEntityId") != null && defaultValFlag.compareTo(Integer.parseInt(""+request.getParameter("parentEntityId"))) != 0) {
					if(txn.getPlantReference().getPlantId().getEntitySource().getmEntityId().compareTo(Long.parseLong(""+request.getParameter("parentEntityId"))) != 0) {
						addFlag = 0;
					}
				}
				if(addFlag.compareTo(0) != 0 && request.getParameter("plantId") != null && defaultValFlag.compareTo(Integer.parseInt(""+request.getParameter("plantId"))) != 0) {
					if(txn.getPlantReference().getPlantId().getmEntityId().compareTo(Long.parseLong(""+request.getParameter("plantId"))) != 0) {
						addFlag = 0;
					}
				}
				if(addFlag.compareTo(0) != 0 && request.getParameter("frequency") != null && defaultValFlag.compareTo(Integer.parseInt(""+request.getParameter("frequency"))) != 0) {
					if(txn.getPlantReference().getPlantForRcm().getControlFrequency().compareTo(Integer.parseInt(""+request.getParameter("frequency"))) != 0) {
						addFlag = 0;
					}
				}
				if(addFlag.compareTo(0) != 0 && request.getParameter("processId") != null && defaultValFlag.compareTo(Integer.parseInt(""+request.getParameter("processId"))) != 0) {
					if(txn.getControlReference().getmProcessId().getmProcessId().compareTo(Long.parseLong(""+request.getParameter("processId"))) != 0) {
						addFlag = 0;
					}
				}
				System.out.println("addFlag : "+addFlag);
				if(addFlag.compareTo(1) == 0) {
					txn.setActionForList("");
					if((session.getAttribute("admin") != null && activenessCheck.compareTo(Integer.parseInt(""+session.getAttribute("admin"))) == 0)
						|| (session.getAttribute("itAdmin") != null && activenessCheck.compareTo(Integer.parseInt(""+session.getAttribute("itAdmin"))) == 0)
						|| txn.getSohBy().getmUserId().compareTo(currUser.getmUserId()) == 0
						|| txn.getLineManager().getmUserId().compareTo(currUser.getmUserId()) == 0
						|| (txn.getPraac() != null && txn.getPraac().getmUserId().compareTo(currUser.getmUserId()) == 0)) {

						Integer allowEdit = 0;
						if(txn.getApprovalStatus() != null) {
							//null - waiting for upload by SOH person -- 0 - Waiting for approval by Line Manager
							//1 - All Approval Done -- 2 - Waiting for approval by PRAAC
							//3 - Rejected by Line Manager -- 4 - Rejected by PRAAC
							if(txn.getApprovalStatus().compareTo(0) == 0 || txn.getApprovalStatus().compareTo(4) == 0) {
								if(currUser.getmUserId().compareTo(txn.getLineManager().getmUserId()) == 0) {
									allowEdit = 1;
								}
							}
							if(txn.getApprovalStatus().compareTo(2) == 0) {
								if(currUser.getmUserId().compareTo(txn.getPraac().getmUserId()) == 0) {
									allowEdit = 1;
								}
							}
							if(txn.getApprovalStatus().compareTo(3) == 0) {
								if(currUser.getmUserId().compareTo(txn.getSohBy().getmUserId()) == 0) {
									allowEdit = 1;
								}
							}
						} else {
							if(currUser.getmUserId().compareTo(txn.getSohBy().getmUserId()) == 0) {
								allowEdit = 1;
							}
						}
						System.out.println("allowEdit : "+allowEdit);
						if(allowEdit.compareTo(1) == 0) {
							txn.setActionForList(txn.getActionForList()+"<a href='#' title='Get Transaction Aprroval Information' onclick='getApprovalInfo("+txn.getRcmTransactionId()+","+txn.getApprovalStatus()+")'><i class='fas fa-file-signature'></i></a>");
						}
						allowEdit = null;
					}
					if(txn.getActionForList() != null && !txn.getActionForList().isEmpty()) {
						txn.setActionForList(txn.getActionForList()+"&ensp;<a href='#' title='Get Transaction Information' onclick='getTxnInfo("+txn.getRcmTransactionId()+")'><i class='fas fa-info'></i></a>");
					} else {
						txn.setActionForList(txn.getActionForList()+"<a href='#' title='Get Transaction Information' onclick='getTxnInfo("+txn.getRcmTransactionId()+")'><i class='fas fa-info'></i></a>");
					}
					txnListFinal.add(txn);
				}
			}
			sdf = null; currYear= null; currUser = null; activenessCheck = null;
			Collections.sort(txnListFinal);
			session = null;
			txnList.clear(); txnList = null;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return txnListFinal;
	}
	@Override
	public String getRcmTransactionDetails(HttpServletRequest request) {
		String response = "";
		Map<String, String> rcmTransactionDetails = new HashMap<String, String>();
		try {
			/*M_Entity entity = mEntityDao.getOne(Integer.parseInt(""+request.getParameter("mEntityId")));*/
			M_Transaction txn = mTransactionDao.findById(Long.parseLong(""+request.getParameter("rcmTransactionId"))).get();
			
			DateFormat df = new SimpleDateFormat("dd/MM/yyyy");  
			rcmTransactionDetails.put("plant", txn.getPlantReference().getPlantId().getEntityName()+"-"+txn.getPlantReference().getPlantId().getLocationId().getLocationName());
			rcmTransactionDetails.put("uploadDate", df.format(txn.getControlReference().getRcmCreatedOn()));
			rcmTransactionDetails.put("departmentName", ""+txn.getControlReference().getmDepartmentId().getDepartmentName());
			rcmTransactionDetails.put("controlNo", txn.getControlReference().getControlNo());
			//rcmTransactionDetails.put("mProcessId", ""+txn.getControlReference().getmProcessId().getmProcessId());
			rcmTransactionDetails.put("processName", ""+txn.getControlReference().getmProcessId().getProcessName());
			rcmTransactionDetails.put("subProcess", ""+txn.getControlReference().getSubProcess());
			rcmTransactionDetails.put("processOwner", txn.getControlReference().getProcessOwner());
			//rcmTransactionDetails.put("mDepartmentId", ""+txn.getControlReference().getmDepartmentId().getmDepartmentId());
			rcmTransactionDetails.put("controlObjective", txn.getControlReference().getControlObjective());
			rcmTransactionDetails.put("risk", txn.getControlReference().getRisk());
			rcmTransactionDetails.put("entityControl", txn.getControlReference().getEntityControl());
			//rcmTransactionDetails.put("document", txn.getControlReference().getdo);
			rcmTransactionDetails.put("riskRating", ""+txn.getControlReference().getRiskRating());
			rcmTransactionDetails.put("controlStartDate", df.format(txn.getControlReference().getControlStartDate()));
			rcmTransactionDetails.put("validityDate", df.format(txn.getControlReference().getValidityDate()));
			rcmTransactionDetails.put("controlFrequency", ""+txn.getControlReference().getControlFrequency());
			rcmTransactionDetails.put("uploadFrequency", ""+txn.getControlReference().getUploadFrequency());
			rcmTransactionDetails.put("fraudRisk", ""+txn.getControlReference().getFraudRisk());
			rcmTransactionDetails.put("uniqueReferred", ""+txn.getControlReference().getUniqueReferred());
			rcmTransactionDetails.put("keyInfo", ""+txn.getControlReference().getKeyInfo());
			rcmTransactionDetails.put("preventiveDetective", ""+txn.getControlReference().getPreventiveDetective());
			rcmTransactionDetails.put("controlType", ""+txn.getControlReference().getControlType());
			rcmTransactionDetails.put("selfCertificateCheck", ""+txn.getControlReference().getSelfCertificateCheck());
			rcmTransactionDetails.put("remarks", ""+txn.getControlReference().getRemarks());
			rcmTransactionDetails.put("soh", txn.getSohBy().getUserFirstName()+" "+(txn.getSohBy().getUserMiddleName()==null?"":txn.getSohBy().getUserMiddleName())+" "+txn.getSohBy().getUserLastName());
			rcmTransactionDetails.put("lineManager", txn.getLineManager().getUserFirstName()+" "+(txn.getLineManager().getUserMiddleName()==null?"":txn.getLineManager().getUserMiddleName())+" "+txn.getLineManager().getUserLastName());
			rcmTransactionDetails.put("praac", txn.getPraac().getUserFirstName()+" "+(txn.getPraac().getUserMiddleName()==null?"":txn.getPraac().getUserMiddleName())+" "+txn.getPraac().getUserLastName());
			rcmTransactionDetails.put("compliantDate", df.format(txn.getCreatedOn()));
			rcmTransactionDetails.put("score", ""+txn.getScore());
			rcmTransactionDetails.put("moreInfoDiv", "0");
			if(txn.getApprovalStatus() != null) {
				rcmTransactionDetails.put("moreInfoDiv", "1");
				rcmTransactionDetails.put("complianceFlag", ""+txn.getComplianceFlag());
				rcmTransactionDetails.put("comments", ""+txn.getComments());
				rcmTransactionDetails.put("proofName", txn.getProofAttachmentName());
				Integer trackerIndex = 0;
				for(M_Tracker track : txn.getTransaction()) {
					rcmTransactionDetails.put("approvalTimestamp"+trackerIndex, ""+df.format(track.getApprovalTimestamp()));
					rcmTransactionDetails.put("comments"+trackerIndex, track.getComments());
					rcmTransactionDetails.put("approvedRejected"+trackerIndex, ""+track.getApprovedRejected());
					rcmTransactionDetails.put("approverType"+trackerIndex, ""+track.getApproverType());
					trackerIndex++;
				}
				rcmTransactionDetails.put("trackerIndex", ""+trackerIndex);
				trackerIndex = null;
			}
			Gson gson = new Gson();
			response = gson.toJson(rcmTransactionDetails);
			gson = null; txn = null; rcmTransactionDetails = null;
		} catch(Exception e) {
			e.printStackTrace();
			response = "error";
		}
		return response;
	}

	@Override
	@Transactional
	public String saveTrackerDetails(HttpServletRequest request, M_Tracker tracker) throws ParseException {
		//StringBuilder response = new StringBuilder();
		M_Transaction currTransaction = mTransactionDao.findById(tracker.getTransaction().getRcmTransactionId()).get();
		if(tracker.getApproverType() == 1) {
			if(tracker.getApprovedRejected() == 0) {
				currTransaction.setApprovalStatus(3);
				if(tracker.getTransaction().getPraac() == null) {
					currTransaction.setScore(0);
				}
			}
			else {
				if(tracker.getTransaction().getPraac() == null) {
					currTransaction.setApprovalStatus(1);
					currTransaction.setScore(5);
				}
				else {
					currTransaction.setApprovalStatus(2);
				}
			}
		}
		if(tracker.getApproverType() == 2) {
			if(tracker.getApprovedRejected() == 0) {
				currTransaction.setApprovalStatus(4);
				currTransaction.setScore(0);
			}
			else {
				currTransaction.setApprovalStatus(1);
				currTransaction.setScore(5);
			}
		}
		tracker.setTransaction(currTransaction);
		tracker.setApprovalTimestamp(new Date());
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		tracker.setApprovalTimestamp(timestamp);
		mTrackerDao.save(tracker);
		return null;
	}

	@Override
	public String getApprovalDetails(HttpServletRequest request) {
		String response = "";
		Map<String, String> rcmTransactionDetails = new HashMap<String, String>();
		try {
			M_Transaction txn = mTransactionDao.findById(Long.parseLong(""+request.getParameter("rcmTransactionId"))).get();
			DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
			rcmTransactionDetails.put("rcmTransactionId", ""+txn.getRcmTransactionId());
			rcmTransactionDetails.put("plant", txn.getPlantReference().getPlantId().getEntityName()+"-"+txn.getPlantReference().getPlantId().getLocationId().getLocationName());
			rcmTransactionDetails.put("uploadDate", df.format(txn.getControlReference().getRcmCreatedOn()));
			rcmTransactionDetails.put("departmentName", ""+txn.getControlReference().getmDepartmentId().getDepartmentName());
			rcmTransactionDetails.put("controlNo", txn.getControlReference().getControlNo());
			//rcmTransactionDetails.put("mProcessId", ""+txn.getControlReference().getmProcessId().getmProcessId());
			rcmTransactionDetails.put("processName", ""+txn.getControlReference().getmProcessId().getProcessName());
			rcmTransactionDetails.put("subProcess", ""+txn.getControlReference().getSubProcess());
			rcmTransactionDetails.put("processOwner", txn.getControlReference().getProcessOwner());
			//rcmTransactionDetails.put("mDepartmentId", ""+txn.getControlReference().getmDepartmentId().getmDepartmentId());
			rcmTransactionDetails.put("controlObjective", txn.getControlReference().getControlObjective());
			rcmTransactionDetails.put("risk", txn.getControlReference().getRisk());
			rcmTransactionDetails.put("entityControl", txn.getControlReference().getEntityControl());
			//rcmTransactionDetails.put("document",txn.getControlReference().getdo);
			rcmTransactionDetails.put("riskRating", ""+txn.getControlReference().getRiskRating());
			rcmTransactionDetails.put("controlStartDate", df.format(txn.getControlReference().getControlStartDate()));
			rcmTransactionDetails.put("validityDate", df.format(txn.getControlReference().getValidityDate()));
			rcmTransactionDetails.put("controlFrequency", ""+txn.getControlReference().getControlFrequency());
			rcmTransactionDetails.put("uploadFrequency", ""+txn.getControlReference().getUploadFrequency());
			rcmTransactionDetails.put("fraudRisk", ""+txn.getControlReference().getFraudRisk());
			rcmTransactionDetails.put("uniqueReferred", ""+txn.getControlReference().getUniqueReferred());
			rcmTransactionDetails.put("keyInfo", ""+txn.getControlReference().getKeyInfo());
			rcmTransactionDetails.put("controlType", ""+txn.getControlReference().getControlType());
			rcmTransactionDetails.put("selfCertificateCheck", ""+txn.getControlReference().getSelfCertificateCheck());
			rcmTransactionDetails.put("remarks", ""+txn.getControlReference().getRemarks());
			rcmTransactionDetails.put("soh", txn.getSohBy().getUserFirstName()+" "+(txn.getSohBy().getUserMiddleName()==null?"":txn.getSohBy().getUserMiddleName())+" "+txn.getSohBy().getUserLastName());
			rcmTransactionDetails.put("lineManager", txn.getLineManager().getUserFirstName()+" "+(txn.getLineManager().getUserMiddleName()==null?"":txn.getLineManager().getUserMiddleName())+" "+txn.getLineManager().getUserLastName());
			rcmTransactionDetails.put("praac", txn.getPraac().getUserFirstName()+" "+(txn.getPraac().getUserMiddleName()==null?"":txn.getPraac().getUserMiddleName())+" "+txn.getPraac().getUserLastName());
			rcmTransactionDetails.put("moreInfoDiv", "0");
			rcmTransactionDetails.put("compliantDate", df.format(txn.getCreatedOn()));
			rcmTransactionDetails.put("score", ""+txn.getScore());
			if(txn.getApprovalStatus() != null) {
				rcmTransactionDetails.put("moreInfoDiv", "1");
				Integer trackerIndex = 0;
				for(M_Tracker track : txn.getTransaction()) {
					rcmTransactionDetails.put("approvalTimestamp"+trackerIndex, ""+df.format(track.getApprovalTimestamp()));
					rcmTransactionDetails.put("comments"+trackerIndex, track.getComments());
					rcmTransactionDetails.put("approvedRejected"+trackerIndex, ""+track.getApprovedRejected());
					rcmTransactionDetails.put("approverType"+trackerIndex, ""+track.getApproverType());
					trackerIndex++;
				}
				rcmTransactionDetails.put("trackerIndex", ""+trackerIndex);
				trackerIndex = null;
			}
			if(txn.getApprovalStatus() != null) {
				rcmTransactionDetails.put("complianceFlag", ""+txn.getComplianceFlag());
				rcmTransactionDetails.put("comments", ""+txn.getComments());
				rcmTransactionDetails.put("proofName", txn.getProofAttachmentName());
			}
			if(txn.getApprovalStatus() != null && txn.getApprovalStatus() == 2) {
				for(M_Tracker track : txn.getTransaction()) {
					if(track.getApproverType() == 1) {
						rcmTransactionDetails.put("approvedRejected", ""+track.getApprovedRejected());
						rcmTransactionDetails.put("comments1", ""+track.getComments());
						rcmTransactionDetails.put("approvalTimestamp", ""+track.getApprovalTimestamp());
					}
				}
			}
			if(txn.getApprovalStatus()!=null && txn.getApprovalStatus()==1) {
				for(M_Tracker track : txn.getTransaction()) {
					if(track.getApproverType() == 1) {
						rcmTransactionDetails.put("approvedRejected", ""+track.getApprovedRejected());
						rcmTransactionDetails.put("comments1", ""+track.getComments());
					}
					if(track.getApproverType() == 2) {
						rcmTransactionDetails.put("approvedRejected1", ""+track.getApprovedRejected());
						rcmTransactionDetails.put("comments2", ""+track.getComments());
					}
					rcmTransactionDetails.put("approvalTimestamp", ""+track.getApprovalTimestamp());
				}
				
			}
			rcmTransactionDetails.put("actionAllowed","0");
			M_User currUser = mUserDao.findByUserLoginId(SecurityContextHolder.getContext().getAuthentication().getName());
			if(txn.getApprovalStatus() != null) {
				//null - waiting for upload by SOH person -- 0 - Waiting for approval by Line Manager
				//1 - All Approval Done -- 2 - Waiting for approval by PRAAC
				//3 - Rejected by Line Manager -- 4 - Rejected by PRAAC
				if(txn.getApprovalStatus().compareTo(0) == 0 || txn.getApprovalStatus().compareTo(4) == 0) {
					if(currUser.getmUserId().compareTo(txn.getLineManager().getmUserId()) == 0) {
						rcmTransactionDetails.put("actionAllowed","1");
					}
				}
				if(txn.getApprovalStatus().compareTo(2) == 0) {
					if(currUser.getmUserId().compareTo(txn.getPraac().getmUserId()) == 0) {
						rcmTransactionDetails.put("actionAllowed","1");
					}
				}
				if(txn.getApprovalStatus().compareTo(3) == 0) {
					if(currUser.getmUserId().compareTo(txn.getSohBy().getmUserId()) == 0) {
						rcmTransactionDetails.put("actionAllowed","1");
					}
				}
			} else {
				if(currUser.getmUserId().compareTo(txn.getSohBy().getmUserId()) == 0) {
					rcmTransactionDetails.put("actionAllowed","1");
				}
			}
			currUser = null;
			Gson gson = new Gson();
			response = gson.toJson(rcmTransactionDetails);
			df = null; gson = null; txn = null; rcmTransactionDetails = null;
		} catch(Exception e) {
			e.printStackTrace();
			response = "error";
		}
		return response;
	}

	@Override
	@Transactional
	public String saveTransactionDetails(HttpServletRequest request, M_Transaction transaction) throws Exception {
		StringBuilder response = new StringBuilder();
		M_Transaction currTransaction = mTransactionDao.findById(transaction.getRcmTransactionId()).get();
		if(currTransaction != null) {
			if(transaction.getTempProofAttachment() != null && !transaction.getTempProofAttachment().isEmpty()) {
				currTransaction.setProofAttachment(transaction.getTempProofAttachment().getBytes());
				currTransaction.setProofAttachmentName(StringUtils.cleanPath(transaction.getTempProofAttachment().getOriginalFilename()));
				currTransaction.setProofAttachmentType(transaction.getTempProofAttachment().getContentType());
			}
			currTransaction.setComplianceFlag(transaction.getComplianceFlag());
			currTransaction.setComments(transaction.getComments());
			currTransaction.setApprovalStatus(0);
			mTransactionDao.save(currTransaction);
			response.append("add");
		}
		currTransaction = null;
		return response.toString();
	}

	@Override
	public M_Transaction getFileDetails(HttpServletRequest request) {
		M_Transaction transaction = mTransactionDao.findById(Long.parseLong(""+request.getParameter("id"))).get();
		return transaction;
	}
}

