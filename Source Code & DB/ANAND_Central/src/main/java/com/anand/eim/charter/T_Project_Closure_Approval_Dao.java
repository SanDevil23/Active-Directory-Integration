package com.anand.eim.charter;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface T_Project_Closure_Approval_Dao extends JpaRepository<T_Project_Closure_Approval,Integer> {

	List<T_Project_Closure_Approval> findByProjectClosureApprovalAndActive(T_Project_Charter projectCharter, Integer active);

	@Query(value="SELECT * FROM eim_t_project_closure_approval WHERE approver_id = ? AND approval_status = ? AND active = ? ORDER BY t_project_closure_approval_id DESC LIMIT 20 OFFSET ?",nativeQuery = true)
	List<T_Project_Closure_Approval> getApprovalList(Long approverId, Integer approvalStatus, Integer active, Integer offSet);
}
