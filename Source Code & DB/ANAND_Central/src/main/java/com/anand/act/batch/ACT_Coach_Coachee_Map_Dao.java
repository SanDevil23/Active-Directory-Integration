package com.anand.act.batch;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.anand.masters.M_User;

@Repository
public interface ACT_Coach_Coachee_Map_Dao extends JpaRepository<ACT_Coach_Coachee_Map, Long> {

	List<ACT_Coach_Coachee_Map> findByCoachCoacheeMappingSetAndCoachUserIdAndCoacheeUserIdAndSupervisorUserId
		(ACT_Coaching_Batch coachCoacheeMappingSet, M_User coachUserId, M_User coacheeUserId, M_User supervisorUserId);

	List<ACT_Coach_Coachee_Map> findByCoachCoacheeMappingSetAndCoacheeUserId(ACT_Coaching_Batch coachCoacheeMappingSet, M_User coacheeUserId);
}