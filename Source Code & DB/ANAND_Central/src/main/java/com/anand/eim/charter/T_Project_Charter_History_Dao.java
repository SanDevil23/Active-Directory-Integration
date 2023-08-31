package com.anand.eim.charter;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface T_Project_Charter_History_Dao extends JpaRepository<T_Project_Charter_History,Integer> {

	List<T_Project_Charter_History> findByProjectCharterHistory(T_Project_Charter projectCharterHistory);
}
