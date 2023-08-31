package com.anand.ifc.masters;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface M_Process_History_Dao extends JpaRepository<M_Process_History, Long> {
}