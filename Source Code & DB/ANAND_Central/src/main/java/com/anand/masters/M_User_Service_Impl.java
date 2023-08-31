package com.anand.masters;

import java.text.SimpleDateFormat;
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
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.anand.common.Common_Constants;
import com.anand.common.EncryptionDecryptionFunction;
import com.anand.common.MailService;
import com.google.gson.Gson;

@Service
public class M_User_Service_Impl implements M_User_Service {

	@Autowired private M_User_Dao mUserDao;
	@Autowired private M_User_History_Dao mUserHistoryDao;
	@Autowired private M_Role_Dao mRoleDao;
	@Autowired private M_User_Role_Map_Dao mUserRoleMapDao;
	@Autowired private M_User_Role_Map_History_Dao mUserRoleMapHistoryDao;
	@Autowired private M_Entity_Dao mEntityDao;
	@Autowired private M_Department_Dao mDepartmentDao;
	@Autowired private M_Designation_Dao mDesignationDao;
	@Autowired private M_App_Dao mAppsDao;
	@Autowired private M_User_App_Map_Dao mUserAppMapDao;
	@Autowired private MailService mailService;

	@Override
	public List<M_User> getUserList(HttpServletRequest request, Integer offset) {
		List<M_User> userListFinal = new ArrayList<M_User>();
		try {
			Integer proceedFlag = 1;
			List<M_User> userList = null;
			if(request.getParameter("all") != null && proceedFlag.compareTo(Integer.parseInt(""+request.getParameter("all"))) == 0) {
				System.out.println("1");
				userList = mUserDao.findAll();
			} else {
				System.out.println("0");
				userList = mUserDao.getUserListWithOffset(offset);
			}
			HttpSession session = request.getSession(true);
			for(M_User user : userList) {
				System.out.println(user.getUserLoginId()+"-"+user.getUserEmailVerifyToken());
				if((session.getAttribute("admin") != null && proceedFlag.compareTo(Integer.parseInt(""+session.getAttribute("admin"))) == 0) ||
					(session.getAttribute("itAdmin") != null && proceedFlag.compareTo(Integer.parseInt(""+session.getAttribute("itAdmin"))) == 0)) {
					user.setAction("<a href='#' title='Edit User Information' onclick='editUserInfo("+user.getmUserId()+")'><i class='fas fa-edit'></i></a>");
				}
				if(user.getAction() != null && !user.getAction().isEmpty()) {
					user.setAction(user.getAction()+"&ensp;<a href='#' title='Get User Information' onclick='getUserInfo("+user.getmUserId()+")'><i class='fas fa-info'></i></a>");
				} else {
					user.setAction(user.getAction()+"<a href='#' title='Get User Information' onclick='getUserInfo("+user.getmUserId()+")'><i class='fas fa-info'></i></a>");
				}
				user.setRolesAvailable("");
				for(M_User_Role_Map userRoleMap : user.getUserInfoForRole()) {
					if(userRoleMap.getUserRoleActive().compareTo(1) == 0) {
						if(user.getRolesAvailable() != null && !user.getRolesAvailable().isEmpty()) {
							user.setRolesAvailable(user.getRolesAvailable()+", "+userRoleMap.getRoleInfoForUsers().getRoleName());
						} else {
							user.setRolesAvailable(userRoleMap.getRoleInfoForUsers().getRoleName());
						}
					}
				}
				userListFinal.add(user);
			}
			session = null; proceedFlag = null;
			Collections.sort(userListFinal);
			userList = null;
		} catch(Exception e) {
			e.printStackTrace();
			userListFinal.clear();
			userListFinal = null;
		}
		return userListFinal;
	}

	@Override
	public List<M_User> getUserByActiveStatus(Integer userActive) {
		List<M_User> userList = null;
		try {
			userList = mUserDao.findByUserActive(userActive);
			Collections.sort(userList);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return userList;
	}

	@Override
	public List<M_User> getActiveUserByRole(Integer userActive, String roleName) {
		List<M_User> userList = new ArrayList<M_User>();
		try {
			M_User currUser = mUserDao.findByUserLoginId(SecurityContextHolder.getContext().getAuthentication().getName());
			List<M_User_Role_Map> usersWithRole = mUserRoleMapDao.findByRoleInfoForUsersAndUserRoleActive(mRoleDao.findByRoleName(roleName).get(0), 1);
			for(M_User_Role_Map currUserWithRole : usersWithRole) {
				if(currUserWithRole.getUserInfoForRole().getUserActive().compareTo(1) == 0) {
					Integer addFlag = 0;
					if(currUser.getmEntityId().getEntityAcronym().equalsIgnoreCase("AAPL")) {
						addFlag = 1;
					} else if(currUser.getmEntityId().getEntitySource().getmEntityId().compareTo(currUserWithRole.getUserInfoForRole().getmEntityId().getEntitySource().getmEntityId()) == 0) {
						addFlag = 1;
					}
					if(addFlag.compareTo(1) == 0) {
						userList.add(currUserWithRole.getUserInfoForRole());
					}
					addFlag = null;
				}
			}
			Collections.sort(userList);
		} catch(Exception e) {
			e.printStackTrace();
			userList.clear();
			userList = null;
		}
		return userList;
	}

	@Override
	public String getActiveUserByRoleInJson(Integer userActive, String roleName) {
		StringBuilder response = new StringBuilder();
		List<Map<String, String>> finalUserList = new ArrayList<Map<String, String>>();
		try {
			List<M_User> userList = getActiveUserByRole(userActive, roleName);
			for(M_User user : userList) {
				
				Map<String, String> userMap = new HashMap<String, String>();
				userMap.put("mUserId", ""+user.getmUserId());
                userMap.put("mEntityId", ""+user.getmEntityId().getmEntityId());
				userMap.put("userFirstName", user.getUserFirstName());
				if(user.getUserMiddleName() != null) {
					userMap.put("userMiddleName", user.getUserMiddleName());
				} else {
					userMap.put("userMiddleName", "");
				}
				userMap.put("userLastName", user.getUserLastName());
				userMap.put("userEntity", "");
				if(user.getmEntityId() != null) {
					userMap.put("userEntity", user.getmEntityId().getEntityName());
				}
				
				userMap.put("userLocation", "");
				if(user.getmEntityId() != null) {
					if(user.getmEntityId().getLocationId() != null) {
						userMap.put("userLocation", user.getmEntityId().getLocationId().getLocationName());
					}
				}
				
				userMap.put("userZone", "");
				if(user.getmEntityId() != null) {
					if(user.getmEntityId().getLocationId() != null) {
						userMap.put("userZone", user.getmEntityId().getLocationId().getmZoneId().getZoneName());
					}
				}
				
				userMap.put("userRoles", user.getRolesAvailable());
				if(user.getUserActive().compareTo(1) == 0) {
					userMap.put("userActive","<span class='badge bg-info-anand-success'>Active</span>");
				} else {
					userMap.put("userActive","<span class='badge bg-info-anand-danger'>In-Active</span>");
				}
				userMap.put("userAction",user.getAction());
				userMap.put("userEmailId",user.getUserLoginId());
				finalUserList.add(userMap);
				userMap = null;
			}
			userList.clear(); userList = null;
			Gson gson = new Gson();
			response.append(gson.toJson(finalUserList));
			gson = null;
		} catch(Exception e) {
			e.printStackTrace();
			response.setLength(0);
			response.append("error");
		}
		finalUserList.clear(); finalUserList = null;
		return response.toString();
	}
	
	

	@Override
	public List<M_User> getActiveUserByRoleInList(Integer userActive, String roleName, HttpServletRequest request) {
		List<M_User> finalUserList = new ArrayList<>();
		try {
			List<M_User> userList = getActiveUserByRole(userActive, roleName);
			List<M_User> finalTempUserList = new ArrayList<>();
			if(request.getParameter("parentEntityId") != null && Integer.parseInt(request.getParameter("parentEntityId")) != -1) {
				for(M_User user : userList) {
					if(user.getmEntityId().getEntitySource().getmEntityId().compareTo(Long.parseLong(request.getParameter("parentEntityId")))==0) {
						finalTempUserList.add(user);
					}
					user = null;
				}
			}
			if(request.getParameter("plantId") != null && Integer.parseInt(request.getParameter("plantId")) != -1) {
				if(finalTempUserList != null && finalTempUserList.size() != 0) {
					for(M_User user : finalTempUserList) {
						if(user.getmEntityId().getmEntityId().compareTo(Long.parseLong(request.getParameter("plantId")))==0) {
							finalUserList.add(user);
						}
						user = null;
					}
				} else {
					for(M_User user : userList) {
						if(user.getmEntityId().getmEntityId().compareTo(Long.parseLong(request.getParameter("plantId")))==0) {
							finalTempUserList.add(user);
						}
						user = null;
					}
				}
			}
			if(finalUserList.size() == 0) {
				finalUserList.addAll(finalTempUserList);
			}
			userList.clear(); userList = null;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return finalUserList;
	}

	@Override
	public String getLineManager(HttpServletRequest request) {
		StringBuilder response = new StringBuilder();
		List<Map<String, String>> finalUserList = new ArrayList<Map<String, String>>();
		M_Entity entity = mEntityDao.findById(Long.parseLong(""+request.getParameter("mEntityId"))).get();
		try {
			List<M_User> userList = getActiveUserByRole(1, "IFC PRAAC");
			for(M_User user : userList) {
				System.out.println(user.getUserLoginId()+" - "+entity.getEntitySource().getmEntityId()+" - "+user.getmEntityId().getEntitySource().getmEntityId());
				if(entity.getEntitySource().getmEntityId().compareTo(user.getmEntityId().getEntitySource().getmEntityId()) == 0) {
					Map<String, String> userMap = new HashMap<String, String>();
					userMap.put("mUserId", ""+user.getmUserId());
	                userMap.put("mEntityId", ""+user.getmEntityId().getmEntityId());
					userMap.put("userFirstName", user.getUserFirstName());
					if(user.getUserMiddleName() != null) {
						userMap.put("userMiddleName", user.getUserMiddleName());
					} else {
						userMap.put("userMiddleName", "");
					}
					userMap.put("userLastName", user.getUserLastName());
					userMap.put("userEntity", "");
					if(user.getmEntityId() != null) {
						userMap.put("userEntity", user.getmEntityId().getEntityName());
					}
					
					userMap.put("userLocation", "");
					if(user.getmEntityId() != null) {
						if(user.getmEntityId().getLocationId() != null) {
							userMap.put("userLocation", user.getmEntityId().getLocationId().getLocationName());
						}
					}
					
					userMap.put("userZone", "");
					if(user.getmEntityId() != null) {
						if(user.getmEntityId().getLocationId() != null) {
							userMap.put("userZone", user.getmEntityId().getLocationId().getmZoneId().getZoneName());
						}
					}
					
					userMap.put("userRoles", user.getRolesAvailable());
					if(user.getUserActive().compareTo(1) == 0) {
						userMap.put("userActive","<span class='badge bg-info-anand-success'>Active</span>");
					} else {
						userMap.put("userActive","<span class='badge bg-info-anand-danger'>In-Active</span>");
					}
					userMap.put("userAction",user.getAction());
					userMap.put("userEmailId",user.getUserLoginId());
					finalUserList.add(userMap);
					userMap = null;
				}
			}
			userList.clear();
			userList = getActiveUserByRole(1, "IFC Line Manager");
			for(M_User user : userList) {
				if(entity.getmEntityId().compareTo(user.getmEntityId().getmEntityId()) == 0) {
					Map<String, String> userMap = new HashMap<String, String>();
					userMap.put("mUserId", ""+user.getmUserId());
	                userMap.put("mEntityId", ""+user.getmEntityId().getmEntityId());
					userMap.put("userFirstName", user.getUserFirstName());
					if(user.getUserMiddleName() != null) {
						userMap.put("userMiddleName", user.getUserMiddleName());
					} else {
						userMap.put("userMiddleName", "");
					}
					userMap.put("userLastName", user.getUserLastName());
					userMap.put("userEntity", "");
					if(user.getmEntityId() != null) {
						userMap.put("userEntity", user.getmEntityId().getEntityName());
					}
					
					userMap.put("userLocation", "");
					if(user.getmEntityId() != null) {
						if(user.getmEntityId().getLocationId() != null) {
							userMap.put("userLocation", user.getmEntityId().getLocationId().getLocationName());
						}
					}
					
					userMap.put("userZone", "");
					if(user.getmEntityId() != null) {
						if(user.getmEntityId().getLocationId() != null) {
							userMap.put("userZone", user.getmEntityId().getLocationId().getmZoneId().getZoneName());
						}
					}
					
					userMap.put("userRoles", user.getRolesAvailable());
					if(user.getUserActive().compareTo(1) == 0) {
						userMap.put("userActive","<span class='badge bg-info-anand-success'>Active</span>");
					} else {
						userMap.put("userActive","<span class='badge bg-info-anand-danger'>In-Active</span>");
					}
					userMap.put("userAction",user.getAction());
					userMap.put("userEmailId",user.getUserLoginId());
					finalUserList.add(userMap);
					userMap = null;
				}
			}
			userList.clear(); userList = null;
			Gson gson = new Gson();
			response.append(gson.toJson(finalUserList));
			gson = null;
		} catch(Exception e) {
			e.printStackTrace();
			response.setLength(0);
			response.append("error");
		}
		finalUserList.clear(); finalUserList = null;
		return response.toString();
	}
	
	@Override
	public List<M_User> getLineManagerList(HttpServletRequest request) {
		List<M_User> finalUserList = new ArrayList<>();
		try {
			List<M_User> userList = getActiveUserByRole(1, "IFC PRAAC");
			List<M_User> finalTempUserList = new ArrayList<>();
			if(request.getParameter("parentEntityId") != null && Integer.parseInt(request.getParameter("parentEntityId")) != -1) {
				for(M_User user : userList) {
					if(user.getmEntityId().getEntitySource().getmEntityId().compareTo(Long.parseLong(request.getParameter("parentEntityId")))==0) {
						finalTempUserList.add(user);
					}
					user = null;
				}
			}
			if(request.getParameter("plantId") != null && Integer.parseInt(request.getParameter("plantId")) != -1) {
				if(finalTempUserList != null && finalTempUserList.size() != 0) {
					for(M_User user : finalTempUserList) {
						if(user.getmEntityId().getmEntityId().compareTo(Long.parseLong(request.getParameter("plantId")))==0) {
							finalUserList.add(user);
						}
						user = null;
					}
				} else {
					for(M_User user : userList) {
						if(user.getmEntityId().getmEntityId().compareTo(Long.parseLong(request.getParameter("plantId")))==0) {
							finalTempUserList.add(user);
						}
						user = null;
					}
				}
			}
			userList.clear();
			userList = getActiveUserByRole(1, "IFC Line Manager");
			if(request.getParameter("parentEntityId") != null && Integer.parseInt(request.getParameter("parentEntityId")) != -1) {
				for(M_User user : userList) {
					if(user.getmEntityId().getEntitySource().getmEntityId().compareTo(Long.parseLong(request.getParameter("parentEntityId")))==0) {
						finalTempUserList.add(user);
					}
					user = null;
				}
			}
			if(request.getParameter("plantId") != null && Integer.parseInt(request.getParameter("plantId")) != -1) {
				if(finalTempUserList != null && finalTempUserList.size() != 0) {
					for(M_User user : finalTempUserList) {
						if(user.getmEntityId().getmEntityId().compareTo(Long.parseLong(request.getParameter("plantId")))==0) {
							finalUserList.add(user);
						}
						user = null;
					}
				} else {
					for(M_User user : userList) {
						if(user.getmEntityId().getmEntityId().compareTo(Long.parseLong(request.getParameter("plantId")))==0) {
							finalTempUserList.add(user);
						}
						user = null;
					}
				}
			}
			if(finalUserList.size() == 0) {
				finalUserList.addAll(finalTempUserList);
			}
			userList.clear(); userList = null;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return finalUserList;
	}

	@Override
    public String getPraac(HttpServletRequest request) {
        StringBuilder response = new StringBuilder();
        List<Map<String, String>> finalUserList = new ArrayList<Map<String, String>>();
        M_Entity entity = mEntityDao.findById(Long.parseLong(""+request.getParameter("mEntityId"))).get();
        try {
            List<M_User> userList = getActiveUserByRole(1, "IFC PRAAC");
            for(M_User user : userList) {
                System.out.println(user.getUserLoginId()+" - "+entity.getEntitySource().getmEntityId()+" - "+user.getmEntityId().getEntitySource().getmEntityId());
                if(entity.getEntitySource().getmEntityId().compareTo(user.getmEntityId().getEntitySource().getmEntityId()) == 0) {
                    Map<String, String> userMap = new HashMap<String, String>();
                    userMap.put("mUserId", ""+user.getmUserId());
                    userMap.put("mEntityId", ""+user.getmEntityId().getmEntityId());
                    userMap.put("userFirstName", user.getUserFirstName());
                    if(user.getUserMiddleName() != null) {
                        userMap.put("userMiddleName", user.getUserMiddleName());
                    } else {
                        userMap.put("userMiddleName", "");
                    }
                    userMap.put("userLastName", user.getUserLastName());
                    userMap.put("userEntity", "");
                    if(user.getmEntityId() != null) {
                        userMap.put("userEntity", user.getmEntityId().getEntityName());
                    }

                    userMap.put("userLocation", "");
                    if(user.getmEntityId() != null) {
                        if(user.getmEntityId().getLocationId() != null) {
                            userMap.put("userLocation", user.getmEntityId().getLocationId().getLocationName());
                        }
                    }

                    userMap.put("userZone", "");
                    if(user.getmEntityId() != null) {
                        if(user.getmEntityId().getLocationId() != null) {
                            userMap.put("userZone", user.getmEntityId().getLocationId().getmZoneId().getZoneName());
                        }
                    }

                    userMap.put("userRoles", user.getRolesAvailable());
                    if(user.getUserActive().compareTo(1) == 0) {
                        userMap.put("userActive","<span class='badge bg-info-anand-success'>Active</span>");
                    } else {
                        userMap.put("userActive","<span class='badge bg-info-anand-danger'>In-Active</span>");
                    }
                    userMap.put("userAction",user.getAction());
                    userMap.put("userEmailId",user.getUserLoginId());
                    finalUserList.add(userMap);
                    userMap = null;
                }
            }
            userList.clear(); userList = null;
            Gson gson = new Gson();
            response.append(gson.toJson(finalUserList));
            gson = null;
        } catch(Exception e) {
            e.printStackTrace();
            response.setLength(0);
            response.append("error");
        }
        System.out.println("praac : "+finalUserList.size()+" - "+response.toString());
        finalUserList.clear(); finalUserList = null;
        return response.toString();
    }
	
	@Override
    public List<M_User> getPraacList(HttpServletRequest request) {
    	List<M_User> finalUserList = new ArrayList<>();
		try {
			List<M_User> userList = getActiveUserByRole(1, "IFC PRAAC");
			List<M_User> finalTempUserList = new ArrayList<>();
			if(request.getParameter("parentEntityId") != null && Integer.parseInt(request.getParameter("parentEntityId")) != -1) {
				for(M_User user : userList) {
					if(user.getmEntityId().getEntitySource().getmEntityId().compareTo(Long.parseLong(request.getParameter("parentEntityId")))==0) {
						finalTempUserList.add(user);
					}
					user = null;
				}
			}
			if(request.getParameter("plantId") != null && Integer.parseInt(request.getParameter("plantId")) != -1) {
				if(finalTempUserList != null && finalTempUserList.size() != 0) {
					for(M_User user : finalTempUserList) {
						if(user.getmEntityId().getmEntityId().compareTo(Long.parseLong(request.getParameter("plantId")))==0) {
							finalUserList.add(user);
						}
						user = null;
					}
				} else {
					for(M_User user : userList) {
						if(user.getmEntityId().getmEntityId().compareTo(Long.parseLong(request.getParameter("plantId")))==0) {
							finalTempUserList.add(user);
						}
						user = null;
					}
				}
			}
			if(finalUserList.size() == 0) {
				finalUserList.addAll(finalTempUserList);
			}
			userList.clear(); userList = null;
		}catch(Exception e) {
            e.printStackTrace();
        }
		return finalUserList;
    }

	@Override
	public List<M_User> getUserOfSameEntities() {
		List<M_User> userList = new ArrayList<M_User>();
		M_User currUser = mUserDao.findByUserLoginId(SecurityContextHolder.getContext().getAuthentication().getName());
		List<M_User> tempUserList = null;
		try {
			tempUserList = mUserDao.findByUserActive(1);
			for(M_User user : tempUserList) {
				if(user.getmEntityId().getmEntityId().compareTo(currUser.getmEntityId().getmEntityId()) == 0) {
					userList.add(user);
				}
			}
			Collections.sort(userList);
		} catch(Exception e) {
			e.printStackTrace();
			userList.clear();
			userList = null;
		}
		tempUserList = null;
		currUser = null;
		return userList;
	}

	@Override
	@Transactional
	public String saveUserDetails(HttpServletRequest request, M_User user) throws Exception {
		StringBuilder response = new StringBuilder();
		M_User currUser = mUserDao.findByUserLoginId(SecurityContextHolder.getContext().getAuthentication().getName());
		Date currDate = new Date();
		if(user.getmUserId() != null) {
			M_User userToEdit = mUserDao.findById(Long.parseLong(""+user.getmUserId())).get();
			
			Integer proceedFlag = 0;
			M_User userExists = mUserDao.findByUserLoginId(userToEdit.getUserLoginId());
			if(userExists != null) {
				if(userExists.getUserLoginId().equalsIgnoreCase(userToEdit.getUserLoginId()) && userExists.getmUserId().compareTo(userToEdit.getmUserId()) != 0) {
					proceedFlag = 1;
				}
			}
			userExists = null;
			if(proceedFlag.compareTo(0) == 0) {
				M_User_History userHistory = new M_User_History();
				userHistory.setmUserId(currUser);
				userHistory.setUserActive(currUser.getUserActive());
				userHistory.setUserLoginId(currUser.getUserLoginId());
				userHistory.setUserPassword(currUser.getUserPassword());
				userHistory.setUserPasswordTwo(currUser.getUserPasswordTwo());
				userHistory.setUserFirstName(currUser.getUserFirstName());
				userHistory.setUserMiddleName(null);
				if(currUser.getUserMiddleName() != null && !currUser.getUserMiddleName().isEmpty()) {
					userHistory.setUserMiddleName(currUser.getUserMiddleName());
				}
				userHistory.setUserLastName(currUser.getUserLastName());
				userHistory.setUserPhoneNumber(currUser.getUserPhoneNumber());
				userHistory.setUserReportingManagerMail(currUser.getUserReportingManagerMail());
				userHistory.setUserReportingManagerName(currUser.getUserReportingManagerName());
				userHistory.setmEntityId(currUser.getmEntityId());
				userHistory.setmDesignationId(currUser.getmDesignationId());
				userHistory.setmDepartmentId(currUser.getmDepartmentId());
				userHistory.setUserCreatedOn(currDate);
				userHistory.setUserCreatedBy(currUser);
				mUserHistoryDao.save(userHistory);
				for(M_User_Role_Map userRole : userToEdit.getUserInfoForRole()) {
					M_User_Role_Map_History userRoleMapHistory = new M_User_Role_Map_History();
					userRoleMapHistory.setmUserRoleMapId(userRole);
					userRoleMapHistory.setmUserHistoryId(userHistory);
					userRoleMapHistory.setmRoleId(userRole.getRoleInfoForUsers());
					userRoleMapHistory.setUserRoleActive(userRole.getUserRoleActive());
					userRoleMapHistory.setUserRoleCreatedOn(currDate);
					userRoleMapHistory.setUserRoleCreatedBy(currUser);
					mUserRoleMapHistoryDao.save(userRoleMapHistory);
					userRoleMapHistory = null;
				}
				userHistory = null;

				userToEdit.setUserFirstName(user.getUserFirstName());
				if(user.getUserMiddleName() != null && !user.getUserMiddleName().isEmpty()) {
					userToEdit.setUserMiddleName(user.getUserMiddleName());
				}
				userToEdit.setUserLastName(user.getUserLastName());
				userToEdit.setUserLoginId(user.getUserLoginId());
				userToEdit.setUserPhoneNumber(user.getUserPhoneNumber());
				userToEdit.setmEntityId(mEntityDao.findById(Long.parseLong(""+user.getTempEntityId())).get());
				userToEdit.setmDepartmentId(mDepartmentDao.findById(Long.parseLong(""+user.getTempDepartmentId())).get());
				userToEdit.setmDesignationId(mDesignationDao.findById(Long.parseLong(""+user.getTempDesignationId())).get());
				userToEdit.setUserReportingManagerMail(user.getUserReportingManagerMail());
				userToEdit.setUserReportingManagerName(user.getUserReportingManagerName());
				userToEdit.setUserActive(user.getUserActive());
				userToEdit.setUserLoginId(userToEdit.getUserLoginId());
				mUserDao.save(currUser);

				for(M_User_Role_Map userRole : userToEdit.getUserInfoForRole()) {
					if(!userRole.getRoleInfoForUsers().getRoleName().contains("Employee")) {
						userRole.setUserRoleActive(0);
						mUserRoleMapDao.save(userRole);
					}
				}
				String[] userRolesNow = user.getUserRolesTemp().split(",");
				for(int i=0; i<userRolesNow.length; i++) {
					M_Role role = mRoleDao.findById(Long.parseLong(""+userRolesNow[i])).get();
					List<M_User_Role_Map> userRoleAvailable = mUserRoleMapDao.findByUserInfoForRoleAndRoleInfoForUsers(userToEdit, role);
					if(userRoleAvailable != null && userRoleAvailable.size() != 0) {
						for(M_User_Role_Map userRole : userRoleAvailable) {
							userRole.setUserRoleActive(1);
							mUserRoleMapDao.save(userRole);
						}
					} else {
						M_User_Role_Map userRoleMap = new M_User_Role_Map();
						userRoleMap.setUserInfoForRole(userToEdit);
						userRoleMap.setRoleInfoForUsers(role);
						userRoleMap.setUserRoleActive(1);
						userRoleMap.setUserRoleCreatedBy(currUser);
						userRoleMap.setUserRoleCreatedOn(currDate);
						mUserRoleMapDao.save(userRoleMap);
					}
					userRoleAvailable = null; role = null;
				}
				if(userToEdit.getUserInfoForApp() != null) {
					for(M_User_App_Map userApps : userToEdit.getUserInfoForApp()) {
						userApps.setUserAppActive(0);
						mUserAppMapDao.save(userApps);
					}
				}
				System.out.println("getUserAppsTemp : "+user.getUserAppsTemp());
				String[] userAppssNow = user.getUserAppsTemp().split(",");
				for(int i=0; i<userAppssNow.length; i++) {
					M_App role = mAppsDao.findById(Long.parseLong(""+userAppssNow[i])).get();
					List<M_User_App_Map> userAppsAvailable = mUserAppMapDao.findByUserInfoForAppAndAppInfoForUsers(userToEdit, role);
					System.out.println(role.getAppName()+" : "+userAppsAvailable.size());
					if(userAppsAvailable != null && userAppsAvailable.size() != 0) {
						for(M_User_App_Map userApps : userAppsAvailable) {
							userApps.setUserAppActive(1);
							mUserAppMapDao.save(userApps);
						}
					} else {
						M_User_App_Map userAppsMap = new M_User_App_Map();
						userAppsMap.setUserInfoForApp(userToEdit);
						userAppsMap.setAppInfoForUsers(role);
						userAppsMap.setUserAppActive(1);
						userAppsMap.setUserAppCreatedBy(currUser);
						userAppsMap.setUserAppCreatedOn(currDate);
						mUserAppMapDao.save(userAppsMap);
						userAppsMap = null;
					}
					userAppsAvailable = null; role = null;
				}
				userToEdit = null;

				response.append("edit");
			} else {
				response.append("nameExists");
			}
			proceedFlag = null;
		} else {
			M_User userExists = mUserDao.findByUserLoginId(user.getUserLoginId());
			if(userExists != null) {
				System.out.println("name exists");
				response.append("nameExists");
			} else {
				BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
				if(user.getUserLastName() != null && !user.getUserLastName().isEmpty()) {
					user.setUserLastName(user.getUserLastName());
				} else {
					user.setUserLastName(null);
				}
				M_Entity entityInfo = mEntityDao.findById(Long.parseLong(""+user.getTempEntityId())).get();
				user.setmEntityId(entityInfo);
				user.setmDepartmentId(mDepartmentDao.findById(Long.parseLong(""+user.getTempDepartmentId())).get());
				user.setmDesignationId(mDesignationDao.findById(Long.parseLong(""+user.getTempDesignationId())).get());
				user.setUserPassword(bCryptPasswordEncoder.encode(user.getUserPassword()));
				user.setUserPasswordTwo(EncryptionDecryptionFunction.getEncryptedData(user.getUserPassword()));
				user.setUserActive(0);
				user.setUserApproved(0);
				user.setUserEmailVerifyToken(EncryptionDecryptionFunction.getEncryptedData(user.getUserLoginId()));
				user.setUserCreatedOn(currDate);

				M_User lastUser = mUserDao.getUserInfoWhichContainsUserCode(entityInfo.getEntityAcronym());
				if(lastUser != null) {
					String[] userCodeSplit = lastUser.getUserCode().split(entityInfo.getEntityAcronym());
					Integer lastValue = Integer.parseInt(userCodeSplit[1]);
					lastValue++;
					if(lastValue.compareTo(10) < 0) {
						user.setUserCode(entityInfo.getEntityAcronym()+"0000"+lastValue);
					} else if(lastValue.compareTo(100) < 0) {
						user.setUserCode(entityInfo.getEntityAcronym()+"000"+lastValue);
					} else if(lastValue.compareTo(1000) < 0) {
						user.setUserCode(entityInfo.getEntityAcronym()+"00"+lastValue);
					} else if(lastValue.compareTo(10000) < 0) {
						user.setUserCode(entityInfo.getEntityAcronym()+"0"+lastValue);
					} else {
						user.setUserCode(entityInfo.getEntityAcronym()+lastValue);
					}
					userCodeSplit = null; lastValue = null;
				} else {
					user.setUserCode(entityInfo.getEntityAcronym()+"00001");
				}
				lastUser = null;

				mUserDao.save(user);

				bCryptPasswordEncoder = null; user = null;
				response.append("add");
			}
			userExists = null;
		}
		return response.toString();
	}

	@Override
	public void sendRegistrationMail(HttpServletRequest request, M_User user) {
		try {
			M_User currUser = mUserDao.findByUserLoginId(user.getUserLoginId());
			StringBuilder body = new StringBuilder();
			body.append(Common_Constants.emailHead);
			Date currDate = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
			body.append("<tr>" + 
					"	<td style='padding: 10px 10px 10px 10px;'>" + 
					"		<p style='margin: 0; padding:10px 0 0 0;color:#00AEEF;font-size:29px' class='namenow'>" + 
					"			<strong>MESSAGE FROM<br>CORPORATE IFC PORTAL</strong>" + 
					"		</p>" + 
					"		<p style='margin: 0; padding:10px 0 0 0;color:#002E6D;font-size:21.5px' class='namenow'>" + 
					"			Registration Complete - IFC Portal" +
					"		</p>" + 
					"		<br>" + 
					"		<p style='margin: 0; padding:10px 0 0 0;' class='namenow'>" + 
					"			INTERNAL COMMUNICATION<br>" + 
					"" +formatter.format(currDate) +  
					"		</p>" + 
					"	</td>" + 
					"</tr>");
			System.out.println("token : "+currUser.getUserEmailVerifyToken());
			body.append("<tr>" + 
					"	<td style='padding: 10px 10px 10px 10px;'>" + 
					"		<p style='margin: 0;padding-bottom:10px;' class='namenow'>" + 
					"			Dear " + currUser.getUserFirstName() + " " + currUser.getUserLastName() + 
					"		</p><br>" + 
					"		<p style='margin: 0; padding:10px 0 0 0;' class='namenow'>" + 
					"			You successfully registered in the IAMS Portal." + 
					"		</p>" + 
					"		<p style='margin: 0; padding:10px 0 0 0;' class='namenow'>" + 
					"			<a href='"+Common_Constants.applicationUrl+"signup-verification?signup-verification="+EncryptionDecryptionFunction.getEncryptedData(user.getUserLoginId())+"'>Click Here</a> to verify your registration and wait for approval by Admin." + 
					"		</p>" + 
					"	</td>" + 
					"</tr>");
			body.append(Common_Constants.emailFooter);
			List<String> to = new ArrayList<String>();
			if(!request.getRequestURL().toString().contains(Common_Constants.applicationUrl)) {
				to.add(Common_Constants.toMailIdTesting);
			} else {
				to.add(user.getUserLoginId());
			}
			mailService.sendToCcBccMail("Account Created - IFC Portal", body.toString(), to, null, null);
			to = null; body.setLength(0); body = null;
			currDate = null; formatter = null; currUser = null;
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public String getUserDetails(HttpServletRequest request) {
		String response = "";
		Map<String, String> userDetails = new HashMap<String, String>();
		try {
			M_User user = mUserDao.findById(Long.parseLong(""+request.getParameter("mUserId"))).get();
			userDetails.put("userFirstName", user.getUserFirstName());
			if(user.getUserMiddleName() != null) {
				userDetails.put("userMiddleName", user.getUserMiddleName());
			} else {
				userDetails.put("userMiddleName", "");
			}
			StringBuilder userRoles = new StringBuilder();
			for(M_User_Role_Map userRole : user.getUserInfoForRole()) {
				if(userRole.getUserRoleActive().compareTo(1) == 0) {
					if(!userRoles.toString().isEmpty()) {
						userRoles.append(","+userRole.getRoleInfoForUsers().getmRoleId());
					} else {
						userRoles.append(""+userRole.getRoleInfoForUsers().getmRoleId());
					}
				}
			}
			userDetails.put("userRoles", userRoles.toString());
			userRoles.setLength(0); userRoles = null;
			
			StringBuilder userApps = new StringBuilder();
			for(M_User_App_Map userApp : user.getUserInfoForApp()) {
				if(userApp.getUserAppActive().compareTo(1) == 0) {
					if(!userApps.toString().isEmpty()) {
						userApps.append(","+userApp.getAppInfoForUsers().getmAppId());
					} else {
						userApps.append(""+userApp.getAppInfoForUsers().getmAppId());
					}
				}
			}
			userDetails.put("userApps", userApps.toString());
			userApps.setLength(0); userApps = null;
			
			userDetails.put("userLastName", user.getUserLastName());
			userDetails.put("userActive", ""+user.getUserActive());
			userDetails.put("userPhoneNumber", ""+user.getUserPhoneNumber());
			userDetails.put("userEntityId", ""+user.getmEntityId().getmEntityId());
			userDetails.put("userEntityName", ""+user.getmEntityId().getEntityName());
			userDetails.put("userEntityLocationId", ""+user.getmEntityId().getLocationId().getmLocationId());
			userDetails.put("userEntityLocationName", ""+user.getmEntityId().getLocationId().getLocationName());
			userDetails.put("userLoginId", user.getUserLoginId());
			userDetails.put("userDesignation", ""+user.getmDesignationId().getDesignationName());
			userDetails.put("userDesignationId", ""+user.getmDesignationId().getmDesignationId());
			userDetails.put("userDepartment", ""+user.getmDepartmentId().getDepartmentName());
			userDetails.put("userDepartmentId", ""+user.getmDepartmentId().getmDepartmentId());
			userDetails.put("userReportingManagerMailId", ""+user.getUserReportingManagerMail());
			userDetails.put("userReportingManagerName", ""+user.getUserReportingManagerName());
			userDetails.put("userActive", ""+user.getUserActive());
			Gson gson = new Gson();
			response = gson.toJson(userDetails);
			gson = null; user = null; userDetails = null;
		} catch(Exception e) {
			e.printStackTrace();
			response = "error";
		}
		return response;
	}

	@Override
	public String checkUserExists(HttpServletRequest request) {
		try {
			M_User user = mUserDao.findByUserLoginId(""+request.getParameter("userLoginId"));
			if(user != null) {
				if(request.getParameter("register") != null) {
					System.out.println("1");
					return "exists";
				} else if(request.getParameter("mUserId") != null && user.getmUserId().compareTo(Long.parseLong(""+request.getParameter("mUserId"))) != 0) {
					System.out.println("2");
					return "exists";
				} else {
					System.out.println("3");
					return "proceed";
				}
			} else {
				System.out.println("4");
				return "proceed";
			}
		} catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	@Override
	@Transactional
	public String verifyEmail(HttpServletRequest request) throws Exception {
		StringBuilder response = new StringBuilder();
		Date currDate = new Date();
		System.out.println(request.getParameter("signup-verification"));
		System.out.println(EncryptionDecryptionFunction.getDecryptedData(""+request.getParameter("signup-verification")));
		M_User user = mUserDao.findByUserLoginId(EncryptionDecryptionFunction.getDecryptedData(""+request.getParameter("signup-verification")));
		if(user != null) {
			if(user.getUserEmailVerifyToken() != null) {
				user.setUserActive(1);
				user.setUserApproved(1);
				user.setUserApprovedOn(currDate);
				user.setUserEmailVerifyToken(null);
				mUserDao.save(user);
				
				M_User_Role_Map userRoleMap = new M_User_Role_Map();
				userRoleMap.setUserInfoForRole(user);
				userRoleMap.setRoleInfoForUsers(mRoleDao.findByRoleNameAndRoleActive("Employee",1).get(0));
				userRoleMap.setUserRoleActive(1);
				userRoleMap.setUserRoleCreatedBy(user);
				userRoleMap.setUserRoleCreatedOn(currDate);
				mUserRoleMapDao.save(userRoleMap);
				userRoleMap = null;
				response.append("verified");
			} else {
				response.append("alreadyverified");
			}
		} else {
			response.append("cannotVerify");
		}
		user = null; currDate = null;
		System.out.println(response.toString());
		return response.toString();
	}

	@Override
	public void sendVerificationMail(HttpServletRequest request) {
		try {
			M_User currUser = mUserDao.findByUserLoginId(EncryptionDecryptionFunction.getDecryptedData(""+request.getParameter("verifyEmail")));
			StringBuilder body = new StringBuilder();
			body.append(Common_Constants.emailHead);
			Date currDate = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
			body.append("<tr>" + 
					"	<td style='padding: 10px 10px 10px 10px;'>" + 
					"		<p style='margin: 0; padding:10px 0 0 0;color:#00AEEF;font-size:29px' class='namenow'>" + 
					"			<strong>MESSAGE FROM<br>CORPORATE IFC PORTAL</strong>" + 
					"		</p>" + 
					"		<p style='margin: 0; padding:10px 0 0 0;color:#002E6D;font-size:21.5px' class='namenow'>" + 
					"			Email Verification Complete Complete - IFC Portal" +
					"		</p>" + 
					"		<br>" + 
					"		<p style='margin: 0; padding:10px 0 0 0;' class='namenow'>" + 
					"			INTERNAL COMMUNICATION<br>" + 
					"" +formatter.format(currDate) +  
					"		</p>" + 
					"	</td>" + 
					"</tr>");
			body.append("<tr>" + 
					"	<td style='padding: 10px 10px 10px 10px;'>" + 
					"		<p style='margin: 0;padding-bottom:10px;' class='namenow'>" + 
					"			Dear " + currUser.getUserFirstName() + " " + currUser.getUserLastName() + 
					"		</p><br>" + 
					"		<p style='margin: 0; padding:10px 0 0 0;' class='namenow'>" + 
					"			Thanks you for verifying your email, your verification is complete.<br>" + 
					"		</p>" + 
					"	</td>" + 
					"</tr>");
			currDate = null;
			formatter = null;
			body.append(Common_Constants.emailFooter);
			List<String> to = new ArrayList<String>();
			if(request.getRequestURL().toString().contains("localhost")) {
				to.add("sheshadhri.iyer@anandgroupindia.com");
			} else if(request.getRequestURL().toString().contains("172.16.6.42")) {
				to.add("sheshadhri.iyer@anandgroupindia.com");
			} else {
				to.add("sheshadhri.iyer@anandgroupindia.com");
			}
			mailService.sendToCcBccMail("Email Verification Complete - ANAND Project", body.toString(), to, null, null);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}