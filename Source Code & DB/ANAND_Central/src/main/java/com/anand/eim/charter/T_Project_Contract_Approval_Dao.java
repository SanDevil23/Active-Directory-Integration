package com.anand.eim.charter;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface T_Project_Contract_Approval_Dao extends JpaRepository<T_Project_Contract_Approval,Integer> {

	List<T_Project_Contract_Approval> findByProjectContractApprovalAndActive(T_Project_Charter projectCharter, Integer active);

	@Query(value="SELECT * FROM eim_t_project_contract_approval WHERE approver_id = ? AND approval_status = ? AND active = ? ORDER BY t_project_contract_approval_id DESC LIMIT 20 OFFSET ?",nativeQuery = true)
	List<T_Project_Contract_Approval> getApprovalList(Long approverId, Integer approvalStatus, Integer active, Integer offSet);
}
