package com.anand.ijp;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface Job_Posting_Dao extends JpaRepository<Job_Posting, Long> {

	@Query(value="select * from ijp_job_posting order by job_posting_id desc limit 20 offset ?", nativeQuery = true)
	List<Job_Posting> getJobPostingListWiOffset(Integer offset);

	List<Job_Posting> findByActive(Integer active);

	List<Job_Posting> findByLastApplicationDateNotNullAndActive(Integer active);

	List<Job_Posting> findByLastApplicationDateNotNullAndActiveAndJobStatus(Integer active, Integer jobStatus);

	List<Job_Posting> findByManpowerRequisitioNoAndActive(String manpowerRequisitioNo, Integer active);

	List<Job_Posting> findByManpowerRequisitioNoAndActiveAndJobPostingIdNot(String manpowerRequisitioNo, Integer active, Long jobPostingId);
}
