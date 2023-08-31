package com.anand.ifc.rcm;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


@Repository
public interface M_Tracker_Dao extends JpaRepository<M_Tracker, Long> {
	@Query(value="select * from ifc_rcm_tracker order by rcm_tracker_id desc limit 30 offset ?", nativeQuery = true)
	List<M_Tracker> getTrackerListWithOffset(Integer offset);
}