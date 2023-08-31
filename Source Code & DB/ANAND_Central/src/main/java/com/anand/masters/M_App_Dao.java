/**
 * *******************************************************************************************
 * Copyright © 2021 Anand Group India. All rights reserved.
 * No part of this product may be reproduced in any form by any means without prior
 * written authorization of Anand Automotive Private Limited and its licensors, if any.
 * *******************************************************************************************
 * Author - Anand Group India - R S Iyer
 */
package com.anand.masters;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface M_App_Dao extends JpaRepository<M_App, Long> {

	@Query(value="select * from m_app order by m_app_id desc limit 20 offset ?", nativeQuery = true)
	List<M_App> getAppWithOffset(Integer offset);

	List<M_App> findByAppActive(Integer appActive);

	List<M_App> findByAppName(String appName);
}
