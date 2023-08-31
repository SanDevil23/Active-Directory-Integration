package com.anand.ijp;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface Job_Posting_History_Dao extends JpaRepository<Job_Posting_History, Long> {

	List<Job_Posting_History> findByActive(Integer active);
}
