/**
 * *******************************************************************************************
 * Copyright © 2021 Anand Group India. All rights reserved.
 * No part of this product may be reproduced in any form by any means without prior
 * written authorization of Anand Automotive Private Limited and its licensors, if any.
 * *******************************************************************************************
 * Author - Anand Group India - R S Iyer
 */
package com.anand.act.batch;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.anand.masters.M_User;
import com.anand.masters.M_User_Dao;
import com.google.gson.Gson;

@Service
public class ACT_Coaching_Batch_Service_Impl implements ACT_Coaching_Batch_Service {

	@Autowired private ACT_Coaching_Batch_Dao actCoachingBatchDao;
	@Autowired private ACT_Coaching_Batch_History_Dao actCoachingBatchHistoryDao;
	@Autowired private ACT_Coach_Coachee_Map_Dao actCoachCoacheeMapDao;
	@Autowired private ACT_Coach_Coachee_Map_History_Dao actCoachCoacheeMapHistoryDao;
	@Autowired private M_User_Dao mUserDao;

	@Override
	public List<ACT_Coaching_Batch> getBatchList(HttpServletRequest request, Integer offset) {
		List<ACT_Coaching_Batch> finalBatchList = new ArrayList<ACT_Coaching_Batch>();
		M_User user = mUserDao.findByUserLoginId(SecurityContextHolder.getContext().getAuthentication().getName());
		try {
			final long userId = user.getmUserId();
			List<ACT_Coaching_Batch> batchList = null;
			Integer activenessCheck = 1;
			if(request.getParameter("all") != null && activenessCheck.compareTo(Integer.parseInt(""+request.getParameter("all"))) == 0) {
				batchList = actCoachingBatchDao.findAll();
			} else {
				batchList = actCoachingBatchDao.getBatchWithOffset(offset);
			}
			for(ACT_Coaching_Batch batch : batchList) {
				if(request.getParameter("batch-id") != null && 
						batch.getActCoachingBatchId().compareTo(Long.parseLong(request.getParameter("batch-id"))) != 0) {
					continue;
				}
				Date currDate = new Date();
				batch.setActionForList("");
				List<ACT_Coach_Coachee_Map> coachCoacheeMapList = new ArrayList<ACT_Coach_Coachee_Map>();
				coachCoacheeMapList.addAll(batch.getCoachCoacheeMappingSet());
				System.out.println(request.getRequestURL().toString());
				System.out.println(request.getRequestURL().toString().contains("coaching-batch"));
				if(request.getRequestURL().toString().contains("coaching-batch")) {
					
					if(request.getRequestURL().toString().contains("coaching-batch-details")) {
						
						if(request.getSession(true).getAttribute("ctCoachee") != null && 
							activenessCheck.compareTo(Integer.parseInt(""+request.getSession(true).getAttribute("ctCoachee"))) == 0 && 
							request.getSession(true).getAttribute("ctCoach") != null && 
							activenessCheck.compareTo(Integer.parseInt(""+request.getSession(true).getAttribute("ctCoach"))) == 0) {
							if(Integer.parseInt(""+coachCoacheeMapList.stream()
							.filter(coacheeCheck -> coacheeCheck.getActCoachCoacheeMapActive().compareTo(1) == 0)
							.filter(coacheeCheck -> coacheeCheck.getCoacheeUserId().getmUserId().compareTo(userId) == 0).count()) > 0) {
								if(currDate.compareTo(batch.getBatchEndDate()) < 1) {
									batch.setActionForList(batch.getActionForList()+"<a title='Add Goals' href='coaching-goals?batch-id="+batch.getActCoachingBatchId()+"&coachee-id="+user.getmUserId()+"'><i class='fas fa-bullseye'></i></a>");
								} else {
									batch.setActionForList("<i class='fas fa-bullseye' title='Batch Ended, Not allowed to add coaching goals.'></i>");
								}
							} else {
								batch.setActionForList("<i class='fas fa-bullseye bg-info-anand-danger' title='Sorry, you are not part of this ALDP.'></i>");
							}
							if(Integer.parseInt(""+coachCoacheeMapList.stream()
							.filter(coachCheck -> coachCheck.getActCoachCoacheeMapActive().compareTo(1) == 0)
							.filter(coachCheck -> coachCheck.getCoachUserId().getmUserId().compareTo(userId) == 0).count()) > 0) {
								if(!batch.toString().isEmpty()) {
									batch.setActionForList(batch.getActionForList()+"&emsp;");
								}
								batch.setActionForList(batch.getActionForList()+"<a title='List all Coachees' href='coachee-list?batch-id="+batch.getActCoachingBatchId()+"'><i class='fas fa-list'></i></a>");
							}
						} else if (request.getSession(true).getAttribute("ctCoachee") != null && 
							activenessCheck.compareTo(Integer.parseInt(""+request.getSession(true).getAttribute("ctCoachee"))) == 0) {
							if(Integer.parseInt(""+coachCoacheeMapList.stream()
							.filter(coacheeCheck -> coacheeCheck.getActCoachCoacheeMapActive().compareTo(1) == 0)
							.filter(coacheeCheck -> coacheeCheck.getCoacheeUserId().getmUserId().compareTo(userId) == 0).count()) > 0) {
								if(currDate.compareTo(batch.getBatchEndDate()) < 1) {
									batch.setActionForList(batch.getActionForList()+"<a title='Add Goals' href='coaching-goals?batch-id="+batch.getActCoachingBatchId()+"&coachee-id="+user.getmUserId()+"'><i class='fas fa-bullseye'></i></a>");
								} else {
									batch.setActionForList("<i class='fas fa-bullseye' title='Batch Ended, Not allowed to add coaching goals.'></i>");
								}
							} else {
								batch.setActionForList("<i class='fas fa-bullseye bg-info-anand-danger' title='Sorry, you are not part of this ALDP.'></i>");
							}
						} else if(request.getSession(true).getAttribute("ctCoach") != null && 
							activenessCheck.compareTo(Integer.parseInt(""+request.getSession(true).getAttribute("ctCoach"))) == 0) {
							if(Integer.parseInt(""+coachCoacheeMapList.stream()
								.filter(coachCheck -> coachCheck.getActCoachCoacheeMapActive().compareTo(1) == 0)
								.filter(coachCheck -> coachCheck.getCoachUserId().getmUserId().compareTo(userId) == 0).count()) > 0) {
								batch.setActionForList(batch.getActionForList()+"<a title='List all Coachees' href='coachee-list?batch-id="+batch.getActCoachingBatchId()+"'><i class='fas fa-list'></i></a>");
							}
						}
						if((request.getSession(true).getAttribute("ctAdmin") != null && activenessCheck.compareTo(Integer.parseInt(""+request.getSession(true).getAttribute("ctAdmin"))) == 0)
							|| (request.getSession(true).getAttribute("itAdmin") != null && activenessCheck.compareTo(Integer.parseInt(""+request.getSession(true).getAttribute("itAdmin"))) == 0)) {
							System.out.println("test1");
							batch.setActionForList(batch.getActionForList()+"<a title='List all Coachees' href='coachee-list?batch-id="+batch.getActCoachingBatchId()+"'><i class='fas fa-list'></i></a>");
							if(currDate.compareTo(batch.getBatchEndDate()) < 1) {
								batch.setActionForList(batch.getActionForList()+"&emsp;<a href='#' title='Edit Batch' onclick='editBatch("+batch.getActCoachingBatchId()+");'><i class='fas fa-edit'></i></a>");
							} else {
								batch.setActionForList(batch.getActionForList()+"&emsp;<i title='Batch Ended, No Editing Allowed' class='fas fa-edit'></i></a>");
							}
						}
					} else {
						if((request.getSession(true).getAttribute("ctAdmin") != null && activenessCheck.compareTo(Integer.parseInt(""+request.getSession(true).getAttribute("ctAdmin"))) == 0)
							|| (request.getSession(true).getAttribute("itAdmin") != null && activenessCheck.compareTo(Integer.parseInt(""+request.getSession(true).getAttribute("itAdmin"))) == 0)) {
							if(currDate.compareTo(batch.getBatchEndDate()) < 1) {
								batch.setActionForList("<a href='#' title='Edit Batch' onclick='editBatch("+batch.getActCoachingBatchId()+");'><i class='fas fa-edit'></i></a>");
							} else {
								batch.setActionForList("<i title='Batch Ended, No Editing Allowed' class='fas fa-edit'></i></a>");
							}
						}
						if(request.getSession(true).getAttribute("ctCoachee") != null && 
							activenessCheck.compareTo(Integer.parseInt(""+request.getSession(true).getAttribute("ctCoachee"))) == 0) {
							if(Integer.parseInt(""+coachCoacheeMapList.stream()
							.filter(coacheeCheck -> coacheeCheck.getActCoachCoacheeMapActive().compareTo(1) == 0)
							.filter(coacheeCheck -> coacheeCheck.getCoacheeUserId().getmUserId().compareTo(userId) == 0).count()) > 0) {
								if(currDate.compareTo(batch.getBatchEndDate()) < 1) {
									batch.setActionForList(batch.getActionForList()+"<a title='Add Goals' href='coaching-goals?batch-id="+batch.getActCoachingBatchId()+"&coachee-id="+user.getmUserId()+"'><i class='fas fa-bullseye'></i></a>");
								} else {
									batch.setActionForList("<i class='fas fa-bullseye' title='Batch Ended, Not allowed to add coaching goals.'></i>");
								}
							} else {
								batch.setActionForList("<i class='fas fa-bullseye bg-info-anand-danger' title='Sorry, you are not part of this ALDP.'></i>");
							}
						}
						if(request.getSession(true).getAttribute("ctCoach") != null && 
							activenessCheck.compareTo(Integer.parseInt(""+request.getSession(true).getAttribute("ctCoach"))) == 0) {
							if(Integer.parseInt(""+coachCoacheeMapList.stream()
								.filter(coachCheck -> coachCheck.getActCoachCoacheeMapActive().compareTo(1) == 0)
								.filter(coachCheck -> coachCheck.getCoachUserId().getmUserId().compareTo(userId) == 0).count()) > 0) {
								batch.setActionForList(batch.getActionForList()+"<a title='List all Coachees' href='coachee-list?batch-id="+batch.getActCoachingBatchId()+"'><i class='fas fa-list'></i></a>");
							}
						}
					}
				}
				if(request.getRequestURL().toString().contains("coachee-list")) {
					if(request.getSession(true).getAttribute("ctCoach") != null && 
						activenessCheck.compareTo(Integer.parseInt(""+request.getSession(true).getAttribute("ctCoach"))) == 0) {
						if(currDate.compareTo(batch.getBatchEndDate()) < 1) {
							if(Integer.parseInt(""+coachCoacheeMapList.stream()
								.filter(coachCheck -> coachCheck.getActCoachCoacheeMapActive().compareTo(1) == 0)
								.filter(coachCheck -> coachCheck.getCoachUserId().getmUserId().compareTo(userId) == 0).count()) > 0) {
								batch.setActionForList("ADD");
							}
						} else {
							batch.setActionForList("<i class='fas fa-bullseye' title='Batch Ended, Not allowed to add coaching goals.'></i>");
						}
					}
					if((request.getSession(true).getAttribute("ctAdmin") != null && activenessCheck.compareTo(Integer.parseInt(""+request.getSession(true).getAttribute("ctAdmin"))) == 0)
						|| (request.getSession(true).getAttribute("itAdmin") != null && activenessCheck.compareTo(Integer.parseInt(""+request.getSession(true).getAttribute("itAdmin"))) == 0)) {
						System.out.println("1");
						if(currDate.compareTo(batch.getBatchEndDate()) < 1) {
							System.out.println("2");
							batch.setActionForList("ADD");
						} else {
							batch.setActionForList("<i class='fas fa-bullseye' title='Batch Ended, Not allowed to add coaching goals.'></i>");
						}
					}
				}
				coachCoacheeMapList.clear();
				coachCoacheeMapList.addAll(batch.getCoachCoacheeMappingSet());
				if(!batch.getActionForList().isEmpty()) {
					batch.setActionForList(batch.getActionForList()+"&emsp;");
				}
				if(!request.getRequestURL().toString().contains("coachee-list")) {
					
					if(request.getSession(true).getAttribute("ctCoachee") != null && 
							activenessCheck.compareTo(Integer.parseInt(""+request.getSession(true).getAttribute("ctCoachee"))) == 0 && 
							request.getSession(true).getAttribute("ctCoach") != null && 
							activenessCheck.compareTo(Integer.parseInt(""+request.getSession(true).getAttribute("ctCoach"))) == 0) {
						if((Integer.parseInt(""+coachCoacheeMapList.stream()
							.filter(coacheeCheck -> coacheeCheck.getActCoachCoacheeMapActive().compareTo(1) == 0)
							.filter(coacheeCheck -> coacheeCheck.getCoacheeUserId().getmUserId().compareTo(userId) == 0).count()) > 0) || 
								(Integer.parseInt(""+coachCoacheeMapList.stream()
								.filter(coacheeCheck -> coacheeCheck.getActCoachCoacheeMapActive().compareTo(1) == 0)
								.filter(coacheeCheck -> coacheeCheck.getCoachUserId().getmUserId().compareTo(userId) == 0).count()) > 0)
								) {
							batch.setActionForList(batch.getActionForList()+"<a href='#' title='Batch Info' onclick='openBatchInfo("+batch.getActCoachingBatchId()+");'><i class='fas fa-info'></i></a>");
						} else {
							batch.setActionForList(batch.getActionForList()+"<a href='#' title='You are not a coachee/coach in this ALDP Batch'><i class='fas fa-info bg-info-anand-danger'></i></a>");
						}
					} else if(request.getSession(true).getAttribute("ctCoachee") != null && 
						activenessCheck.compareTo(Integer.parseInt(""+request.getSession(true).getAttribute("ctCoachee"))) == 0) {
						if(Integer.parseInt(""+coachCoacheeMapList.stream()
						.filter(coacheeCheck -> coacheeCheck.getActCoachCoacheeMapActive().compareTo(1) == 0)
						.filter(coacheeCheck -> coacheeCheck.getCoacheeUserId().getmUserId().compareTo(userId) == 0).count()) > 0) {
							batch.setActionForList(batch.getActionForList()+"<a href='#' title='Batch Info' onclick='openBatchInfo("+batch.getActCoachingBatchId()+");'><i class='fas fa-info'></i></a>");
						} else {
							batch.setActionForList(batch.getActionForList()+"<a href='#' title='You are not a coachee in this ALDP Batch'><i class='fas fa-info bg-info-anand-danger'></i></a>");
						}
					} else if(request.getSession(true).getAttribute("ctCoach") != null && 
							activenessCheck.compareTo(Integer.parseInt(""+request.getSession(true).getAttribute("ctCoach"))) == 0) {
							if(Integer.parseInt(""+coachCoacheeMapList.stream()
							.filter(coacheeCheck -> coacheeCheck.getActCoachCoacheeMapActive().compareTo(1) == 0)
							.filter(coacheeCheck -> coacheeCheck.getCoachUserId().getmUserId().compareTo(userId) == 0).count()) > 0) {
								batch.setActionForList(batch.getActionForList()+"<a href='#' title='Batch Info' onclick='openBatchInfo("+batch.getActCoachingBatchId()+");'><i class='fas fa-info'></i></a>");
						} else {
							batch.setActionForList(batch.getActionForList()+"<a href='#' title='You are not a coach in this ALDP Batch'><i class='fas fa-info bg-info-anand-danger'></i></a>");
						}
					}
					if((request.getSession(true).getAttribute("ctAdmin") != null && activenessCheck.compareTo(Integer.parseInt(""+request.getSession(true).getAttribute("ctAdmin"))) == 0)
							|| (request.getSession(true).getAttribute("itAdmin") != null && activenessCheck.compareTo(Integer.parseInt(""+request.getSession(true).getAttribute("itAdmin"))) == 0)) {
						batch.setActionForList(batch.getActionForList()+"<a href='#' title='Batch Info' onclick='openBatchInfo("+batch.getActCoachingBatchId()+");'><i class='fas fa-info'></i></a>");
					}
				}
				batch.setTotalParticipants(Integer.parseInt(""+coachCoacheeMapList.stream().filter(c -> c.getActCoachCoacheeMapActive().compareTo(1) == 0).count()));
				batch.setAnandLeaderCount(Integer.parseInt(""+coachCoacheeMapList.stream()
					.filter(c -> c.getActCoachCoacheeMapActive().compareTo(1) == 0)
					.filter(c -> c.getActCoacheeProgram().compareTo(3) == 0).count()));
				batch.setAnandTalentCount(Integer.parseInt(""+coachCoacheeMapList.stream()
					.filter(c -> c.getActCoachCoacheeMapActive().compareTo(1) == 0)
					.filter(c -> c.getActCoacheeProgram().compareTo(2) == 0).count()));
				batch.setAnandMenteeCount(Integer.parseInt(""+coachCoacheeMapList.stream()
					.filter(c -> c.getActCoachCoacheeMapActive().compareTo(1) == 0)
					.filter(c -> c.getActCoacheeProgram().compareTo(1) == 0).count()));
				finalBatchList.add(batch);
				currDate = null;
			}
			Collections.sort(finalBatchList);
		} catch(Exception e) {
			e.printStackTrace();
			finalBatchList.clear(); finalBatchList = null;
		}
		user = null;
		return finalBatchList;
	}

	@Override
	public ACT_Coaching_Batch getCurrentBatch() {
		try {
			return actCoachingBatchDao.getBatchWithOffset(0).get(0);
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<ACT_Coaching_Batch> getBatchByActiveStatus(Integer batchActive) {
		List<ACT_Coaching_Batch> batchList = null;
		try {
			batchList = actCoachingBatchDao.findByBatchActive(batchActive);
			Collections.sort(batchList);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return batchList;
	}

	@Override
	@Transactional
	public String saveBatchDetails(HttpServletRequest request, ACT_Coaching_Batch batch) throws ParseException {
		StringBuilder response = new StringBuilder();
		M_User user = mUserDao.findByUserLoginId(SecurityContextHolder.getContext().getAuthentication().getName());
		Date currDate = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		if(batch.getActCoachingBatchId() != null) {
			ACT_Coaching_Batch currBatch = actCoachingBatchDao.findById(Long.parseLong(""+batch.getActCoachingBatchId())).get();
			Integer proceedFlag = 0;
			List<ACT_Coaching_Batch> batchExists = actCoachingBatchDao.findByBatchName(batch.getBatchName());
			if(batchExists != null && batchExists.size() != 0) {
				for(ACT_Coaching_Batch batchDetails : batchExists) {
					if(batch.getBatchName().equalsIgnoreCase(batchDetails.getBatchName()) && currBatch.getActCoachingBatchId().compareTo(batchDetails.getActCoachingBatchId()) != 0) {
						proceedFlag = 1;
					}
				}
			}
			batchExists = null;
			if(proceedFlag.compareTo(0) == 0) {
				ACT_Coaching_Batch_History batchHistory = new ACT_Coaching_Batch_History();
				batchHistory.setActCoachingBatchId(currBatch);
				batchHistory.setBatchActive(currBatch.getBatchActive());
				batchHistory.setBatchName(currBatch.getBatchName());
				batchHistory.setBatchDescription(currBatch.getBatchDescription());
				batchHistory.setmUserId(user);
				if(currBatch.getUpdatedOn() != null) {
					batchHistory.setCreatedOn(currBatch.getUpdatedOn());
				} else {
					batchHistory.setCreatedOn(currBatch.getCreatedOn());
				}
				actCoachingBatchHistoryDao.save(batchHistory);
				for(ACT_Coach_Coachee_Map coachCoacheeMap : currBatch.getCoachCoacheeMappingSet()) {
					ACT_Coach_Coachee_Map_History coachCoacheeHistory = new ACT_Coach_Coachee_Map_History();
					coachCoacheeHistory.setCoachCoacheeMappingHistorySet(batchHistory);
					coachCoacheeHistory.setActCoachCoacheeMapHistoryActive(currBatch.getBatchActive());
					coachCoacheeHistory.setCoachUserId(coachCoacheeMap.getCoachUserId());
					coachCoacheeHistory.setCoacheeUserId(coachCoacheeMap.getCoacheeUserId());
					coachCoacheeHistory.setActCoacheeProgram(coachCoacheeMap.getActCoacheeProgram());
					coachCoacheeHistory.setSupervisorUserId(coachCoacheeMap.getSupervisorUserId());
					coachCoacheeHistory.setActCoachCoacheeMapHistoryCreatedBy(user);
					if(coachCoacheeMap.getUpdatedOn() != null) {
						coachCoacheeHistory.setCreatedOn(coachCoacheeMap.getUpdatedOn());
					} else {
						coachCoacheeHistory.setCreatedOn(coachCoacheeMap.getCreatedOn());
					}
					actCoachCoacheeMapHistoryDao.save(coachCoacheeHistory);
					coachCoacheeHistory = null;
					
					coachCoacheeMap.setActCoachCoacheeMapActive(0);
					actCoachCoacheeMapDao.save(coachCoacheeMap);
				}
				batchHistory = null;

				currBatch.setBatchName(batch.getBatchName());
				currBatch.setBatchDescription(batch.getBatchDescription());
				currBatch.setBatchActive(batch.getBatchActive());
				currBatch.setmUserIdUpdated(user);
				currBatch.setUpdatedOn(currDate);
				actCoachingBatchDao.save(currBatch);
				
				for(ACT_Coach_Coachee_Map coachCoacheeMap : batch.getCoachCoacheeMappingList()) {
					if(coachCoacheeMap.getActCoachCoacheeMapActive().compareTo(1) == 0) {
						if(coachCoacheeMap.getActCoachCoacheeMapId() != null) {
							System.out.println("Edit ID");
							ACT_Coach_Coachee_Map currCoachCoacheeMap = actCoachCoacheeMapDao.findById(coachCoacheeMap.getActCoachCoacheeMapId()).get();
							currCoachCoacheeMap.setCoachUserId(mUserDao.findById(coachCoacheeMap.getCoachIdTemp()).get());
							currCoachCoacheeMap.setCoacheeUserId(mUserDao.findById(coachCoacheeMap.getCoacheeIdTemp()).get());
							currCoachCoacheeMap.setActCoacheeProgram(coachCoacheeMap.getActCoacheeProgram());
							currCoachCoacheeMap.setSupervisorUserId(mUserDao.findById(coachCoacheeMap.getSupervisorIdTemp()).get());
							currCoachCoacheeMap.setActCoachCoacheeMapActive(1);
							currCoachCoacheeMap.setActCoachCoacheeMapUpdatedBy(user);
							currCoachCoacheeMap.setUpdatedOn(currDate);
							actCoachCoacheeMapDao.save(currCoachCoacheeMap);
							currCoachCoacheeMap = null;
						} else {
							List<ACT_Coach_Coachee_Map> existingCoachCoacheeMap = actCoachCoacheeMapDao.findByCoachCoacheeMappingSetAndCoachUserIdAndCoacheeUserIdAndSupervisorUserId
									(batch, mUserDao.findById(coachCoacheeMap.getCoachIdTemp()).get(), mUserDao.findById(coachCoacheeMap.getCoacheeIdTemp()).get(), mUserDao.findById(coachCoacheeMap.getSupervisorIdTemp()).get());
							if(existingCoachCoacheeMap == null || (existingCoachCoacheeMap != null && existingCoachCoacheeMap.size() == 0)) {
								coachCoacheeMap.setCoachCoacheeMappingSet(batch);
								coachCoacheeMap.setCoachUserId(mUserDao.findById(coachCoacheeMap.getCoachIdTemp()).get());
								coachCoacheeMap.setCoacheeUserId(mUserDao.findById(coachCoacheeMap.getCoacheeIdTemp()).get());
								coachCoacheeMap.setActCoacheeProgram(coachCoacheeMap.getActCoacheeProgram());
								coachCoacheeMap.setSupervisorUserId(mUserDao.findById(coachCoacheeMap.getSupervisorIdTemp()).get());
								coachCoacheeMap.setActCoachCoacheeMapActive(1);
								coachCoacheeMap.setCreatedOn(currDate);
								coachCoacheeMap.setActCoachCoacheeMapCreatedBy(user);
								actCoachCoacheeMapDao.save(coachCoacheeMap);
							} else {
								System.out.println("Edit Existing");
							}
							existingCoachCoacheeMap = null;
						}
					}
				}

				currBatch = null;
				response.append("edit");
			} else {
				response.append("nameExists");
			}
			proceedFlag = null;
		} else {
			List<ACT_Coaching_Batch> batchExists = actCoachingBatchDao.findByBatchName(batch.getBatchName());
			if(batchExists != null && batchExists.size() != 0) {
				System.out.println("name exists");
				response.append("nameExists");
			} else {
				batch.setmUserId(user);
				batch.setCreatedOn(currDate);
				batch.setBatchStartDate(dateFormat.parse(batch.getStartDateTemp()));
				batch.setBatchEndDate(dateFormat.parse(batch.getEndDateTemp()));
				actCoachingBatchDao.save(batch);

				for(ACT_Coach_Coachee_Map coachCoacheeMap : batch.getCoachCoacheeMappingList()) {
					if(coachCoacheeMap.getActCoachCoacheeMapActive().compareTo(1) == 0) {
						System.out.println(coachCoacheeMap.getCoachIdTemp()+" - "+coachCoacheeMap.getCoacheeIdTemp()+" - "+coachCoacheeMap.getSupervisorIdTemp());
						List<ACT_Coach_Coachee_Map> existingCoachCoacheeMap = actCoachCoacheeMapDao.findByCoachCoacheeMappingSetAndCoachUserIdAndCoacheeUserIdAndSupervisorUserId
								(batch, mUserDao.findById(coachCoacheeMap.getCoachIdTemp()).get(), mUserDao.findById(coachCoacheeMap.getCoacheeIdTemp()).get(), mUserDao.findById(coachCoacheeMap.getSupervisorIdTemp()).get());
						if(existingCoachCoacheeMap == null || (existingCoachCoacheeMap != null && existingCoachCoacheeMap.size() == 0)) {
							coachCoacheeMap.setCoachCoacheeMappingSet(batch);
							coachCoacheeMap.setCoachUserId(mUserDao.findById(coachCoacheeMap.getCoachIdTemp()).get());
							coachCoacheeMap.setCoacheeUserId(mUserDao.findById(coachCoacheeMap.getCoacheeIdTemp()).get());
							coachCoacheeMap.setActCoacheeProgram(coachCoacheeMap.getActCoacheeProgram());
							coachCoacheeMap.setSupervisorUserId(mUserDao.findById(coachCoacheeMap.getSupervisorIdTemp()).get());
							coachCoacheeMap.setActCoachCoacheeMapActive(1);
							coachCoacheeMap.setCreatedOn(currDate);
							coachCoacheeMap.setActCoachCoacheeMapCreatedBy(user);
							actCoachCoacheeMapDao.save(coachCoacheeMap);
						} else {
							System.out.println("Coach - Coachee - Supervisor Exists");
						}
					}
				}

				response.append("add");
			}
			batchExists = null;
		}
		dateFormat = null; currDate = null; user = null;
		return response.toString();
	}

	@Override
	public String getBatchDetails(HttpServletRequest request) {
		String response = "";
		Map<String, String> batchDetails = new HashMap<String, String>();
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		SimpleDateFormat dateFormatInfo = new SimpleDateFormat("dd-MMM-yyyy");
		try {
			ACT_Coaching_Batch batch = actCoachingBatchDao.findById(Long.parseLong(""+request.getParameter("actCoachingBatchId"))).get();
			batchDetails.put("batchName", batch.getBatchName());
			batchDetails.put("batchDescription", batch.getBatchDescription());
			batchDetails.put("batchActive", ""+batch.getBatchActive());
			batchDetails.put("batchStartDate", dateFormat.format(batch.getBatchStartDate()));
			batchDetails.put("batchEndDate", dateFormat.format(batch.getBatchEndDate()));
			
			batchDetails.put("batchStartDateInfo", dateFormatInfo.format(batch.getBatchStartDate()));
			batchDetails.put("batchEndDateInfo", dateFormatInfo.format(batch.getBatchEndDate()));
			
			Integer coachCoacheeMapCount = 0;
			for(ACT_Coach_Coachee_Map coachCoacheeMap : batch.getCoachCoacheeMappingSet()) {
				if(coachCoacheeMap.getActCoachCoacheeMapActive().compareTo(1) == 0) {
					batchDetails.put("coach"+coachCoacheeMapCount, ""+coachCoacheeMap.getCoachUserId().getmUserId());
					batchDetails.put("coachee"+coachCoacheeMapCount, ""+coachCoacheeMap.getCoacheeUserId().getmUserId());
					batchDetails.put("programType"+coachCoacheeMapCount, ""+coachCoacheeMap.getActCoacheeProgram());
					batchDetails.put("supervisor"+coachCoacheeMapCount, ""+coachCoacheeMap.getSupervisorUserId().getmUserId());
					batchDetails.put("actCoachCoacheeMapId"+coachCoacheeMapCount, ""+coachCoacheeMap.getActCoachCoacheeMapId());
					
					batchDetails.put("coachName"+coachCoacheeMapCount, ""+coachCoacheeMap.getCoachUserId().getUserFirstName()+" "+coachCoacheeMap.getCoachUserId().getUserLastName());
					batchDetails.put("coacheeName"+coachCoacheeMapCount, ""+coachCoacheeMap.getCoacheeUserId().getUserFirstName()+" "+coachCoacheeMap.getCoacheeUserId().getUserLastName());
					String programType = "";
					if(coachCoacheeMap.getActCoacheeProgram().compareTo(1) == 0) {
						programType = "ANAND Mentee";
					} else if(coachCoacheeMap.getActCoacheeProgram().compareTo(2) == 0) {
						programType = "ANAND Talent";
					} else {
						programType = "ANAND Leader";
					}
					batchDetails.put("programTypeName"+coachCoacheeMapCount, programType);
					programType = null;
					batchDetails.put("supervisorName"+coachCoacheeMapCount, ""+coachCoacheeMap.getSupervisorUserId().getUserFirstName()+" "+coachCoacheeMap.getSupervisorUserId().getUserLastName());
					
					coachCoacheeMapCount++;
				}
			}
			batchDetails.put("coachCoacheeIndex", ""+coachCoacheeMapCount);
			coachCoacheeMapCount = null;
			Gson gson = new Gson();
			response = gson.toJson(batchDetails);
			gson = null; batch = null; batchDetails = null;
		} catch(Exception e) {
			e.printStackTrace();
			response = "error";
		}
		dateFormat = null; dateFormatInfo = null;
		return response;
	}

	@Override
	public ACT_Coach_Coachee_Map getCoachCoacheeMapInformation(HttpServletRequest request) {
		try {
			M_User coacheeId = mUserDao.findById(Long.parseLong(""+request.getParameter("coachee-id"))).get();
			ACT_Coaching_Batch coachingBatch = actCoachingBatchDao.findById(Long.parseLong(""+request.getParameter("batch-id"))).get();
			List<ACT_Coach_Coachee_Map> coachCoacheeMapInfo = actCoachCoacheeMapDao.findByCoachCoacheeMappingSetAndCoacheeUserId(coachingBatch, coacheeId);
			if(coachCoacheeMapInfo != null & coachCoacheeMapInfo.size() != 0) {
				return coachCoacheeMapInfo.get(0);
			} else {
				return null;
			}
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}