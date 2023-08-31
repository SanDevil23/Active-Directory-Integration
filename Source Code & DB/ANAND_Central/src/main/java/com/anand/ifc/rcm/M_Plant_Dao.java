package com.anand.ifc.rcm;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.anand.masters.M_Entity;

@Repository
public interface M_Plant_Dao extends JpaRepository<M_Plant, Long> {

	List<M_Plant> findByPlantForRcm(M_Rcm rcm);
	List<M_Plant> findByPlantForRcmAndPlantId(M_Rcm rcm, M_Entity mPlantId);
}