package com.anand.ifc.rcm;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


@Repository
public interface M_Transaction_Dao extends JpaRepository<M_Transaction, Long> {
	@Query(value="select * from ifc_rcm_transaction order by rcm_transaction_id desc limit 30 offset ?", nativeQuery = true)
	List<M_Transaction> getTransactionListWithOffset(Integer offset);

	@Query(value="SELECT * FROM ifc_rcm_transaction WHERE created_on >= ? AND created_on <= ?  order by rcm_transaction_id desc", nativeQuery = true)
	List<M_Transaction> getAllPurchaseIdForSpecificPeriod(Date purchaseDateFrom, Date purchaseDateTo);
}