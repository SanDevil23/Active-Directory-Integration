package com.anand.ifc.rcm;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface M_Rcm_Dao extends JpaRepository<M_Rcm,Long> {

	@Query(value="select * from ifc_rcm_master order by rcm_id desc limit 30 offset ?", nativeQuery = true)
	List<M_Rcm> getRcmListWithOffset(Integer offset);
}