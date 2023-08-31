package com.anand.eim.charter;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface T_Project_Charter_Dao extends JpaRepository<T_Project_Charter, Long> {

	@Query(value="select * from eim_t_project_charter order by t_project_charter_id desc limit 20 offset ?", nativeQuery = true)
	List<T_Project_Charter> getCharterProjectList(Integer offSet);

	List<T_Project_Charter> findByCharterActiveAndCharterCreatedOnBetween(Integer charterActive, Date fromDate, Date toDate);

	@Query(value="select * from eim_t_project_charter where m_entity_id = ? AND charter_active = ? order by t_project_charter_id desc limit 20 offset ?", nativeQuery = true)
	List<T_Project_Charter> getCompanySpecificAccessAndActiveStatus(Long companyId, Integer activeStatus, Integer offSet);

	@Query(value="select * from eim_t_project_charter where m_entity_id = ? AND charter_active = ? order by t_project_charter_id desc", nativeQuery = true)
	List<T_Project_Charter> getAllCompanySpecificAccessAndActiveStatus(Long companyId, Integer activeStatus);
	
	@Query(value="SELECT * FROM eim_t_project_charter WHERE charter_created_on >= ? AND charter_created_on <= ?  order by t_project_charter_id desc limit 20 offset ?", nativeQuery = true)
	List<T_Project_Charter> getCharterProjectListForSpecificPeriod(Date createdDateFrom, Date createdDateTo,Integer offSet);
}
