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
public interface M_Aems_Sub_Category_Dao extends JpaRepository<M_Aems_Sub_Category, Long> {

	@Query(value="select * from aems_m_sub_category order by m_aems_sub_category_id desc limit 20 offset ?", nativeQuery = true)
	List<M_Aems_Sub_Category> getAemsSubCategoryWithOffset(Integer offset);

	List<M_Aems_Sub_Category> findByAemsSubCategoryActive(Integer aemsSubCategoryActive);

	List<M_Aems_Sub_Category> findByAemsSubCategoryName(String aemsSubCategoryName);
}
