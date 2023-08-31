package com.anand.eim.hopper;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface M_Project_Hopper_Dao extends JpaRepository<T_Project_Hopper, Long> {

	@Query(value="select * from eim_t_project_hopper order by t_project_hopper_id desc limit 10 offset ?", nativeQuery = true)
	List<T_Project_Hopper> getHopperProjectList(Integer offSet);

	List<T_Project_Hopper> findByHopperActiveAndHopperCreatedOnBetween(Integer hopperActive, Date fromDate, Date toDate);
}
