package com.anand.act.batch;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ACT_Coaching_Batch_History_Dao extends JpaRepository<ACT_Coaching_Batch_History, Long> {
}