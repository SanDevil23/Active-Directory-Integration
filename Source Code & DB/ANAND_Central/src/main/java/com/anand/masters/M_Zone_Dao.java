package com.anand.masters;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface M_Zone_Dao extends JpaRepository<M_Zone, Long> {
	@Query(value="select * from m_zone order by m_zone_id desc limit 20 offset ?", nativeQuery = true)
	List<M_Zone> getZoneListWithOffset(Integer offset);

	List<M_Zone> findByZoneActive(Integer zoneActive);

	List<M_Zone> findByZoneName(String zoneName);
}