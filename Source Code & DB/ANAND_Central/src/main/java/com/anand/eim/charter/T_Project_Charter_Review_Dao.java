package com.anand.eim.charter;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface T_Project_Charter_Review_Dao extends JpaRepository<T_Project_Charter_Review, Long> {

	List<T_Project_Charter_Review> findByProjectCharterReviewAndActive(T_Project_Charter_Review projectCharterReview, Integer active);

	@Query(value="SELECT * FROM eim_t_project_charter_review WHERE t_project_charter_id = ? AND active = ? ORDER BY t_project_charter_review_id DESC LIMIT 20 OFFSET ?",nativeQuery = true)
	List<T_Project_Charter_Review> getReviewList(Long projectCharterId, Integer active, Integer offSet);
}