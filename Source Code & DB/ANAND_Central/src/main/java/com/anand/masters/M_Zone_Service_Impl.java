package com.anand.masters;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;

@Service
public class M_Zone_Service_Impl implements M_Zone_Service {

	@Autowired private M_Zone_Dao mZoneDao;
	@Autowired private M_Zone_History_Dao mZoneHistoryDao;
	@Autowired private M_User_Dao mUserDao;

	@Override
	public List<M_Zone> getZoneList(HttpServletRequest request, Integer offset) {
		List<M_Zone> finalZoneList = new ArrayList<M_Zone>();
		try {
			List<M_Zone> zoneList = null;
			HttpSession session = request.getSession(true);
			Integer activenessCheck = 1;
			if(request.getParameter("all") != null && activenessCheck.compareTo(Integer.parseInt(""+request.getParameter("all"))) == 0) {
				zoneList = mZoneDao.findAll();
			} else {
				/*zoneList = mZonePagination.findAll(PageRequest.of(offset, 3)).getContent();*/
				zoneList = mZoneDao.getZoneListWithOffset(offset);
			}
			for(M_Zone zone : zoneList) {
				zone.setActionForList("");
				if((session.getAttribute("admin") != null && activenessCheck.compareTo(Integer.parseInt(""+session.getAttribute("admin"))) == 0)
					|| (session.getAttribute("itAdmin") != null && activenessCheck.compareTo(Integer.parseInt(""+session.getAttribute("itAdmin"))) == 0)) {
					System.out.println("1");
					zone.setActionForList("<a href='#' title='Edit Zone' onclick='editZone("+zone.getmZoneId()+");'><i class='fas fa-edit'></i></a>");
				}
				finalZoneList.add(zone);
			}
			activenessCheck = null;
			zoneList.clear(); zoneList = null;
			Collections.sort(finalZoneList);
			System.out.println(finalZoneList.size());
			session = null;
		} catch(Exception e) {
			e.printStackTrace();
			finalZoneList.clear(); finalZoneList = null;
		}
		return finalZoneList;
	}

	@Override
	public List<M_Zone> getZoneByActiveStatus(Integer zoneActive) {
		List<M_Zone> zoneList = null;
		try {
			zoneList = mZoneDao.findByZoneActive(zoneActive);
			Collections.sort(zoneList);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return zoneList;
	}

	@Override
	@Transactional
	public String saveZoneDetails(HttpServletRequest request, M_Zone zone) {
		StringBuilder response = new StringBuilder();
		M_User user = mUserDao.findByUserLoginId(SecurityContextHolder.getContext().getAuthentication().getName());
		Date currDate = new Date();
		if(zone.getmZoneId() != null) {
			Optional<M_Zone> zoneOptional = mZoneDao.findById(Long.parseLong(""+zone.getmZoneId()));
			M_Zone currZone = zoneOptional.get();
			/*M_Zone currZone = mZoneDao.findById(zone.getmZoneId());*/
			Integer proceedFlag = 0;
			List<M_Zone> zoneExists = mZoneDao.findByZoneName(zone.getZoneName());
			if(zoneExists != null && zoneExists.size() != 0) {
				for(M_Zone zoneDetails : zoneExists) {
					if(zone.getZoneName().equalsIgnoreCase(zoneDetails.getZoneName()) && currZone.getmZoneId().compareTo(zoneDetails.getmZoneId()) != 0) {
						proceedFlag = 1;
					}
				}
			}
			zoneExists = null;
			if(proceedFlag.compareTo(0) == 0) {
				M_Zone_History zoneHistory = new M_Zone_History();
				zoneHistory.setmZoneId(currZone);
				zoneHistory.setZoneActive(currZone.getZoneActive());
				zoneHistory.setZoneName(currZone.getZoneName());
				zoneHistory.setmUserId(user);
				zoneHistory.setCreatedOn(currDate);
				mZoneHistoryDao.save(zoneHistory);
				zoneHistory = null;

				currZone.setZoneName(zone.getZoneName());
				currZone.setZoneActive(zone.getZoneActive());
				currZone.setmUserIdUpdated(user);
				currZone.setUpdatedOn(currDate);
				mZoneDao.save(currZone);
				currZone = null;
				response.append("edit");
			} else {
				response.append("nameExists");
			}
			currZone = null; zoneOptional = null;
			proceedFlag = null;
		} else {
			List<M_Zone> zoneExists = mZoneDao.findByZoneName(zone.getZoneName());
			if(zoneExists != null && zoneExists.size() != 0) {
				System.out.println("name exists");
				response.append("nameExists");
			} else {
				zone.setmUserId(user);
				zone.setCreatedOn(currDate);
				mZoneDao.save(zone);
				
				response.append("add");
			}
			zoneExists = null;
		}
		currDate = null; user = null;
		return response.toString();
	}

	@Override
	public String getZoneDetails(HttpServletRequest request) {
		String response = "";
		Map<String, String> zoneDetails = new HashMap<String, String>();
		try {
			/*M_Zone zone1 = mZoneDao.getOne(Integer.parseInt(""+request.getParameter("mZoneId")));*/
			Optional<M_Zone> zoneOptional = mZoneDao.findById(Long.parseLong(""+request.getParameter("mZoneId")));
			M_Zone zone = zoneOptional.get();

			zoneDetails.put("zoneName", zone.getZoneName());
			zoneDetails.put("zoneActive", ""+zone.getZoneActive());
			Gson gson = new Gson();
			response = gson.toJson(zoneDetails);
			gson = null; zoneOptional = null; zone = null; zoneDetails = null;
		} catch(Exception e) {
			e.printStackTrace();
			response = "error";
		}
		return response;
	}
}