package com.anand.masters;

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

import com.google.gson.Gson;

@Service
public class M_Department_Service_Impl implements M_Department_Service {

	@Autowired private M_Department_Dao mDepartmentDao;
	@Autowired private M_Department_History_Dao mDepartmentHistoryDao;
	@Autowired private M_User_Dao mUserDao;

	@Override
	public List<M_Department> getDepartmentList(HttpServletRequest request, Integer offset) {
		List<M_Department> finalDepartmentList = new ArrayList<M_Department>();
		List<M_Department> designationList = null;
		try {
			Integer activenessCheck = 1;
			if(request.getParameter("all") != null && activenessCheck.compareTo(Integer.parseInt(""+request.getParameter("all"))) == 0) {
				designationList = mDepartmentDao.findAll();
			} else {
				designationList = mDepartmentDao.getDepartmentWithOffset(offset);
			}
			HttpSession session = request.getSession(true);
			for(M_Department department : designationList) {
				department.setActionForList("");
				if((session.getAttribute("admin") != null && activenessCheck.compareTo(Integer.parseInt(""+session.getAttribute("admin"))) == 0)
					|| (session.getAttribute("itAdmin") != null && activenessCheck.compareTo(Integer.parseInt(""+session.getAttribute("itAdmin"))) == 0)) {
					department.setActionForList("<a href='#' title='Edit Department' onclick='editDepartment("+department.getmDepartmentId()+");'><i class='fas fa-edit'></i></a>");
				}
				finalDepartmentList.add(department);
			}
			activenessCheck = null;
			Collections.sort(designationList);
		} catch(Exception e) {
			e.printStackTrace();
		}
		designationList.clear(); designationList = null;
		return finalDepartmentList;
	}

	@Override
	public List<M_Department> getDepartmentByActiveStatus(Integer designationActive) {
		List<M_Department> designationList = null;
		try {
			designationList = mDepartmentDao.findByDepartmentActive(designationActive);
			Collections.sort(designationList);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return designationList;
	}

	@Override
	@Transactional
	public String saveDepartmentDetails(HttpServletRequest request, M_Department department) {
		StringBuilder response = new StringBuilder();
		M_User user = mUserDao.findByUserLoginId(SecurityContextHolder.getContext().getAuthentication().getName());
		Date currDate = new Date();
		if(department.getmDepartmentId() != null) {
			/*M_Department currDepartment = mDepartmentDao.getOne(department.getmDepartmentId());*/
			M_Department currDepartment = mDepartmentDao.findById(Long.parseLong(""+department.getmDepartmentId())).get();
			Integer proceedFlag = 0;
			List<M_Department> departmentExists = mDepartmentDao.findByDepartmentName(department.getDepartmentName());
			if(departmentExists != null && departmentExists.size() != 0) {
				for(M_Department departmentDetails : departmentExists) {
					if(department.getDepartmentName().equalsIgnoreCase(departmentDetails.getDepartmentName()) && currDepartment.getmDepartmentId().compareTo(departmentDetails.getmDepartmentId()) != 0) {
						proceedFlag = 1;
					}
				}
			}
			departmentExists = null;
			if(proceedFlag.compareTo(0) == 0) {
				M_Department_History designationHistory = new M_Department_History();
				designationHistory.setmDepartmentId(currDepartment);
				designationHistory.setDepartmentActive(currDepartment.getDepartmentActive());
				designationHistory.setDepartmentName(currDepartment.getDepartmentName());
				designationHistory.setDepartmentDescription(currDepartment.getDepartmentDescription());
				designationHistory.setmUserId(user);
				designationHistory.setCreatedOn(currDate);
				mDepartmentHistoryDao.save(designationHistory);
				designationHistory = null;

				currDepartment.setDepartmentName(department.getDepartmentName());
				currDepartment.setDepartmentDescription(department.getDepartmentDescription());
				currDepartment.setDepartmentActive(department.getDepartmentActive());
				currDepartment.setmUserIdUpdate(user);
				currDepartment.setUpdatedOn(currDate);
				mDepartmentDao.save(currDepartment);
				currDepartment = null;
				response.append("edit");
			} else {
				response.append("nameExists");
			}
			proceedFlag = null;
		} else {
			List<M_Department> departmentExists = mDepartmentDao.findByDepartmentName(department.getDepartmentName());
			if(departmentExists != null && departmentExists.size() != 0) {
				System.out.println("name exists");
				response.append("nameExists");
			} else {
				department.setmUserId(user);
				department.setCreatedOn(currDate);
				mDepartmentDao.save(department);
				
				response.append("add");
			}
			departmentExists = null;
		}
		user = null;
		return response.toString();
	}

	@Override
	public String getDepartmentDetails(HttpServletRequest request) {
		String response = "";
		Map<String, String> departmentDetails = new HashMap<String, String>();
		try {
			/*M_Department department = mDepartmentDao.getOne(Integer.parseInt(""+request.getParameter("mDepartmentId")));*/
			M_Department department = mDepartmentDao.findById(Long.parseLong(""+request.getParameter("mDepartmentId"))).get();
			departmentDetails.put("departmentName", department.getDepartmentName());
			departmentDetails.put("departmentDescription", department.getDepartmentDescription());
			departmentDetails.put("departmentActive", ""+department.getDepartmentActive());
			Gson gson = new Gson();
			response = gson.toJson(departmentDetails);
			gson = null; department = null; departmentDetails = null;
		} catch(Exception e) {
			e.printStackTrace();
			response = "error";
		}
		return response;
	}
}