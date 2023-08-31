package com.anand.eim.masters;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface M_Project_Methodology_Dao extends JpaRepository<M_Project_Methodology, Long> {

	public List<M_Project_Methodology> findByProjectMethodologyActive(Integer projectMethodologyActive);
}
