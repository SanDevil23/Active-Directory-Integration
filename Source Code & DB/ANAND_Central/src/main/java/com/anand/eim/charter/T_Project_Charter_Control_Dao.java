package com.anand.eim.charter;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface T_Project_Charter_Control_Dao extends JpaRepository<T_Project_Charter_Control, Long> {

	List<T_Project_Charter_Control> findByProjectCharterControlAndActive(T_Project_Charter_Control projectCharterControl, Integer active);

	@Query(value="SELECT * FROM eim_t_project_charter_control WHERE t_project_charter_id = ? AND active = ? ORDER BY t_project_charter_control_id DESC LIMIT 20 OFFSET ?",nativeQuery = true)
	List<T_Project_Charter_Control> getControlList(Long projectCharterId, Integer active, Integer offSet);
}