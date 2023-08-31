package com.anand.eim.masters;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class M_Project_Type_Service_Impl implements M_Project_Type_Service {

	@Autowired private M_Project_Type_Dao projectTypeDao;

	public List<M_Project_Type> getProjectTypeList() {
		List<M_Project_Type> typeList = new ArrayList<M_Project_Type>();
		try {
			for(M_Project_Type type : projectTypeDao.findByProjectTypeActive(1)) {
				if(type.getProjectTypeActive().equals(1)) {
					typeList.add(type);
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
			typeList = null;
		}
		System.out.println("***********");
		for(M_Project_Type type : typeList) {
			System.out.println(type.getProjectTypeName());
		}
		System.out.println("***********");
		return typeList;
	}
}
