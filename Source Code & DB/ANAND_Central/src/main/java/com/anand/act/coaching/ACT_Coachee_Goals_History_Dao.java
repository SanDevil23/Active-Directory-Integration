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

@Repository
public interface ACT_Coachee_Goals_History_Dao extends JpaRepository<ACT_Coachee_Goals_History, Long> {
	@Query(value="select * from act_coachee_goals_history order by act_coachee_goals_history_id desc limit 20 offset ?", nativeQuery = true)
	List<ACT_Coachee_Goals_History> getCoacheeGoalsWithOffset(Integer offset);

	List<ACT_Coachee_Goals_History> findByCoachingGoalActive(Integer coachingGoalActive);

	List<ACT_Coachee_Goals_History> findByCoachingGoal(String coachingGoal);

	List<ACT_Coachee_Goals_History> findByCoachingGoalAndCoachingGoalActive(String coachingGoal, Integer coachingGoalActive);

	List<ACT_Coachee_Goals_History> findByParentCoachingGoal(ACT_Coachee_Goals parentCoachingGoal);
}
