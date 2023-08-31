/**
 * *******************************************************************************************
 * Copyright © 2021 Anand Group India. All rights reserved.
 * No part of this product may be reproduced in any form by any means without prior
 * written authorization of Anand Automotive Private Limited and its licensors, if any.
 * *******************************************************************************************
 * Author - Anand Group India - R S Iyer
 */
package com.anand.act.batch;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ACT_Coaching_Batch_Dao extends JpaRepository<ACT_Coaching_Batch, Long> {
	@Query(value="select * from act_coaching_batch order by act_coaching_batch_id desc limit 20 offset ?", nativeQuery = true)
	List<ACT_Coaching_Batch> getBatchWithOffset(Integer offset);

	List<ACT_Coaching_Batch> findByBatchActive(Integer batchActive);

	List<ACT_Coaching_Batch> findByBatchName(String batchName);

	List<ACT_Coaching_Batch> findByBatchNameAndBatchActive(String batchName, Integer batchActice);
}
