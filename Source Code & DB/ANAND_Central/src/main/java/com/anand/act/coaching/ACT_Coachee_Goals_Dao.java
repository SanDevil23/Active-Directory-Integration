/**
 * *******************************************************************************************
 * Copyright © 2021 Anand Group India. All rights reserved.
 * No part of this product may be reproduced in any form by any means without prior
 * written authorization of Anand Automotive Private Limited and its licensors, if any.
 * *******************************************************************************************
 * Author - Anand Group India - R S Iyer
 */
package com.anand.act.coaching;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.anand.act.batch.ACT_Coach_Coachee_Map;

@Repository
public interface ACT_Coachee_Goals_Dao extends JpaRepository<ACT_Coachee_Goals, Long> {
	@Query(value="select * from act_coachee_goals order by act_coachee_goals_id desc limit 20 offset ?", nativeQuery = true)
	List<ACT_Coachee_Goals> getCoacheeGoalsWithOffset(Integer offset);

	List<ACT_Coachee_Goals> findByCoachingGoalActive(Integer coachingGoalActive);

	List<ACT_Coachee_Goals> findByCoachingGoal(String coachingGoal);

	List<ACT_Coachee_Goals> findByCoachingGoalAndCoacheeGoalsSet(String coachingGoal, ACT_Coach_Coachee_Map coacheeGoalsSet);

	List<ACT_Coachee_Goals> findByCoacheeGoalsSet(ACT_Coach_Coachee_Map coacheeGoalsSet);

	List<ACT_Coachee_Goals> findByCoachingGoalAndCoachingGoalActive(String coachingGoal, Integer coachingGoalActive);
}
