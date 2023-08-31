/**
 * *******************************************************************************************
 * Copyright © 2021 Anand Group India. All rights reserved.
 * No part of this product may be reproduced in any form by any means without prior
 * written authorization of Anand Automotive Private Limited and its licensors, if any.
 * *******************************************************************************************
 * Author - Anand Group India - R S Iyer
 */
package com.anand.aems.master;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface M_Aems_Category_Dao extends JpaRepository<M_Aems_Category, Long> {

	@Query(value="select * from m_aems_category order by m_aems_category_id desc limit 20 offset ?", nativeQuery = true)
	List<M_Aems_Category> getAemsCategoryWithOffset(Integer offset);

	List<M_Aems_Category> findByAemsCategoryActive(Integer aemsCategoryActive);

	List<M_Aems_Category> findByAemsCategoryName(String aemsCategoryName);
}
