package com.anand.act.batch;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ACT_Coach_Coachee_Map_History_Dao extends JpaRepository<ACT_Coach_Coachee_Map_History, Long> {
}