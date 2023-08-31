package com.anand.eim.hopper;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface T_Project_Hopper_History_Dao extends JpaRepository<T_Project_Hopper_History, Long> {

	List<T_Project_Hopper_History> findByProjectHopperHistory(T_Project_Hopper projectHopperHistory);
}
