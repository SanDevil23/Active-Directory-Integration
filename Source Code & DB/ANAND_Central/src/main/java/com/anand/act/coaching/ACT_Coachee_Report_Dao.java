/**
 * *******************************************************************************************
 * Copyright © 2021 Anand Group India. All rights reserved.
 * No part of this product may be reproduced in any form by any means without prior
 * written authorization of Anand Automotive Private Limited and its licensors, if any.
 * *******************************************************************************************
 * Author - Anand Group India - R S Iyer
 */
package com.anand.act.coaching;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.anand.act.batch.ACT_Coach_Coachee_Map;

@Repository
public interface ACT_Coachee_Report_Dao extends JpaRepository<ACT_Coachee_Report, Long> {
	@Query(value="select * from act_coachee_report order by act_coachee_report_id desc limit 20 offset ?", nativeQuery = true)
	List<ACT_Coachee_Report> getCoacheeGoalsWithOffset(Integer offset);

	List<ACT_Coachee_Report> findByReportActive(Integer reportActive);

	List<ACT_Coachee_Report> findByCoacheeReportSet(ACT_Coach_Coachee_Map coacheeReportSet);

	List<ACT_Coachee_Report> findBySessionDate(Date sessionDate);

	List<ACT_Coachee_Report> findBySessionDateAndCoacheeReportSet(Date sessionDate, ACT_Coach_Coachee_Map coacheeReportSet);
}
