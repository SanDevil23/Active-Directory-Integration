package com.anand.masters;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface M_User_Service {

	List<M_User> getUserList(HttpServletRequest request, Integer offset);

	List<M_User> getUserByActiveStatus(Integer userActive);

	List<M_User> getActiveUserByRole(Integer userActive, String roleName);

	String getActiveUserByRoleInJson(Integer userActive, String roleName);
	
	List<M_User> getActiveUserByRoleInList(Integer userActive, String roleName,HttpServletRequest request);

	String getLineManager(HttpServletRequest request);
	List<M_User> getLineManagerList(HttpServletRequest request);

	String getPraac(HttpServletRequest request);
	List<M_User> getPraacList(HttpServletRequest request);


	List<M_User> getUserOfSameEntities();

	String saveUserDetails(HttpServletRequest request, M_User user) throws Exception;

	void sendRegistrationMail(HttpServletRequest request, M_User user);

	String getUserDetails(HttpServletRequest request);

	String checkUserExists(HttpServletRequest request);

	String verifyEmail(HttpServletRequest request) throws Exception;

	void sendVerificationMail(HttpServletRequest request);
}
