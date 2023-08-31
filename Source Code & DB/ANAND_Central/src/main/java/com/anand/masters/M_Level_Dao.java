package com.anand.masters;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface M_Level_Dao extends JpaRepository<M_Level, Long> {
	@Query(value="select * from m_level order by m_level_id desc limit 20 offset ?", nativeQuery = true)
	List<M_Level> getLevelListWithOffset(Integer offset);

	List<M_Level> findByActive(Integer active);

	List<M_Level> findByLevelName(String levelName);
}