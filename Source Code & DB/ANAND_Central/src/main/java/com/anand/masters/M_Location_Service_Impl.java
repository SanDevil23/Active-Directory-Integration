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
public class M_Location_Service_Impl implements M_Location_Service {

	@Autowired private M_Location_Dao mLocationDao;
	@Autowired private M_Location_History_Dao mLocationHistoryDao;
	@Autowired private M_Zone_Dao mZoneDao;
	@Autowired private M_User_Dao mUserDao;

	@Override
	public List<M_Location> getLocationList(HttpServletRequest request, Integer offset) {
		List<M_Location> finalLocationList = new ArrayList<M_Location>();
		try {
			List<M_Location> locationList = null;
			HttpSession session = request.getSession(true);
			Integer activenessCheck = 1;
			if(request.getParameter("all") != null && activenessCheck.compareTo(Integer.parseInt(""+request.getParameter("all"))) == 0) {
				System.out.println("1");
				locationList = mLocationDao.findAll();
			} else {
				System.out.println("0");
				locationList = mLocationDao.getLocationListWithOffset(offset);
			}
			for(M_Location location : locationList) {
				location.setActionForList("");
				if((session.getAttribute("admin") != null && activenessCheck.compareTo(Integer.parseInt(""+session.getAttribute("admin"))) == 0)
					|| (session.getAttribute("itAdmin") != null && activenessCheck.compareTo(Integer.parseInt(""+session.getAttribute("itAdmin"))) == 0)) {
					System.out.println("1");
					location.setActionForList("<a href='#' title='Edit Location' onclick='editLocation("+location.getmLocationId()+");'><i class='fas fa-edit'></i></a>");
				}
				finalLocationList.add(location);
			}
			activenessCheck = null;
			Collections.sort(finalLocationList);
			session = null;
			locationList.clear(); locationList = null;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return finalLocationList;
	}

	@Override
	public List<M_Location> getLocationByActiveStatus(Integer locationActive) {
		List<M_Location> locationList = null;
		try {
			locationList = mLocationDao.findByLocationActive(locationActive);
			Collections.sort(locationList);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return locationList;
	}

	@Override
	@Transactional
	public String saveLocationDetails(HttpServletRequest request, M_Location location) {
		StringBuilder response = new StringBuilder();
		M_User user = mUserDao.findByUserLoginId(SecurityContextHolder.getContext().getAuthentication().getName());
		Date currDate = new Date();
		if(location.getmLocationId() != null) {
			/*M_Location currLocation = mLocationDao.getOne(location.getmLocationId());*/
			M_Location currLocation = mLocationDao.findById(Long.parseLong(""+location.getmLocationId())).get();
			Integer proceedFlag = 0;
			List<M_Location> locationExists = mLocationDao.findByLocationName(location.getLocationName());
			if(locationExists != null && locationExists.size() != 0) {
				for(M_Location locationDetails : locationExists) {
					if(locationDetails.getLocationName().equalsIgnoreCase(locationDetails.getLocationName()) && currLocation.getmLocationId().compareTo(locationDetails.getmLocationId()) != 0) {
						proceedFlag = 1;
					}
				}
			}
			locationExists = null;
			if(proceedFlag.compareTo(0) == 0) {
				M_Location_History locationHistory = new M_Location_History();
				locationHistory.setmLocationId(currLocation);
				locationHistory.setLocationActive(currLocation.getLocationActive());
				locationHistory.setLocationName(currLocation.getLocationName());
				locationHistory.setmZoneId(currLocation.getmZoneId());
				locationHistory.setmUserId(user);
				locationHistory.setCreatedOn(currDate);
				mLocationHistoryDao.save(locationHistory);
				locationHistory = null;

				currLocation.setLocationName(location.getLocationName());
				currLocation.setLocationActive(location.getLocationActive());
				/*currLocation.setmZoneId(mZoneDao.getOne(location.getZoneIdTemp()));*/
				currLocation.setmZoneId(mZoneDao.findById(Long.parseLong(""+location.getZoneIdTemp())).get());
				currLocation.setmUserIdUpdated(user);
				currLocation.setUpdatedOn(currDate);
				mLocationDao.save(currLocation);
				currLocation = null;
				response.append("edit");
			} else {
				response.append("nameExists");
			}
			proceedFlag = null;
		} else {
			List<M_Location> locationExists = mLocationDao.findByLocationName(location.getLocationName());
			if(locationExists != null && locationExists.size() != 0) {
				System.out.println("name exists");
				response.append("nameExists");
			} else {
				location.setmUserId(user);
				location.setCreatedOn(currDate);
				/*location.setmZoneId(mZoneDao.getOne(location.getZoneIdTemp()));*/
				location.setmZoneId(mZoneDao.findById(Long.parseLong(""+location.getZoneIdTemp())).get());
				mLocationDao.save(location);
				response.append("add");
			}
			locationExists = null;
		}
		user = null;
		return response.toString();
	}

	@Override
	public String getLocationDetails(HttpServletRequest request) {
		String response = "";
		Map<String, String> locationDetails = new HashMap<String, String>();
		try {
			/*M_Location location = mLocationDao.getOne(Integer.parseInt(""+request.getParameter("mLocationId")));*/
			M_Location location = mLocationDao.findById(Long.parseLong(""+request.getParameter("mLocationId"))).get();
			locationDetails.put("locationName", location.getLocationName());
			locationDetails.put("locationActive", ""+location.getLocationActive());
			locationDetails.put("zoneIdTempEdit", ""+location.getmZoneId().getmZoneId());
			Gson gson = new Gson();
			response = gson.toJson(locationDetails);
			gson = null; location = null; locationDetails = null;
		} catch(Exception e) {
			e.printStackTrace();
			response = "error";
		}
		return response;
	}
}