package com.anand.masters;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface M_Qualification_Dao extends JpaRepository<M_Qualification, Long> {
	@Query(value="select * from m_qualification order by qualification_id desc limit 20 offset ?", nativeQuery = true)
	List<M_Qualification> getQualificationListWithOffset(Integer offset);

	List<M_Qualification> findByActive(Integer active);

	List<M_Qualification> findByQualificationName(String qualificationName);
}