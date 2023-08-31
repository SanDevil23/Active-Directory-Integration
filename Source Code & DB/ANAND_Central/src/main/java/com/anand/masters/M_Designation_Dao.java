package com.anand.masters;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface M_Designation_Dao extends JpaRepository<M_Designation, Long> {
	@Query(value="select * from m_designation order by m_designation_id desc limit 20 offset ?", nativeQuery = true)
	List<M_Designation> getDesignationWithOffset(Integer offset);

	List<M_Designation> findByDesignationActive(Integer designationActive);

	List<M_Designation> findByDesignationName(String designationName);
}