/**
 * *******************************************************************************************
 * Copyright © 2021 Anand Group India. All rights reserved.
 * No part of this product may be reproduced in any form by any means without prior
 * written authorization of Anand Automotive Private Limited and its licensors, if any.
 * *******************************************************************************************
 * Author - Anand Group India - R S Iyer
 */
package com.anand.ifc.masters;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface M_Process_Dao extends JpaRepository<M_Process, Long> {

	@Query(value="select * from ifc_m_process order by m_process_id desc limit 20 offset ?", nativeQuery = true)
	List<M_Process> getProcessWithOffset(Integer offset);

	List<M_Process> findByProcessActive(Integer processActive);

	List<M_Process> findByProcessName(String processName);
}
