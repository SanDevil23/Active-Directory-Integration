package com.anand.eim.masters;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class M_Project_Function_Service_Impl implements M_Project_Function_Service {

	@Autowired private M_Project_Function_Dao projectFunctionDao;

	public List<M_Project_Function> getProjectFunctionList() {
		List<M_Project_Function> functionList = new ArrayList<M_Project_Function>();
		try {
			for(M_Project_Function function : projectFunctionDao.findByProjectFunctionActive(1)) {
				if(function.getProjectFunctionActive().equals(1)) {
					functionList.add(function);
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
			functionList = null;
		}
		System.out.println("***********");
		for(M_Project_Function function : functionList) {
			System.out.println(function.getProjectFunctionName());
		}
		System.out.println("***********");
		return functionList;
	}
}
