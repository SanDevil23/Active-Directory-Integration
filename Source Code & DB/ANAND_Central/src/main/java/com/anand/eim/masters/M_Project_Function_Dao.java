package com.anand.eim.masters;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface M_Project_Function_Dao extends JpaRepository<M_Project_Function, Long> {

	public List<M_Project_Function> findByProjectFunctionActive(Integer projectFunctionActive);
}
