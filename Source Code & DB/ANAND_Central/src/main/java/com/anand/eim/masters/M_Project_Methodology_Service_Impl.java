package com.anand.eim.masters;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class M_Project_Methodology_Service_Impl implements M_Project_Methodology_Service {

	@Autowired private M_Project_Methodology_Dao projectMethodologyDao;

	public List<M_Project_Methodology> getProjectMethodologyList() {
		List<M_Project_Methodology> methodologyList = new ArrayList<M_Project_Methodology>();
		try {
			for(M_Project_Methodology methodology : projectMethodologyDao.findByProjectMethodologyActive(1)) {
				if(methodology.getProjectMethodologyActive().equals(1)) {
					methodologyList.add(methodology);
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
			methodologyList = null;
		}
		System.out.println("***********");
		for(M_Project_Methodology methodology : methodologyList) {
			System.out.println(methodology.getProjectMethodologyName());
		}
		System.out.println("***********");
		return methodologyList;
	}
}
