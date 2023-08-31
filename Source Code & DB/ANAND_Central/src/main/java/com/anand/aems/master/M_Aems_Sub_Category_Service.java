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

import javax.servlet.http.HttpServletRequest;

public interface M_Aems_Sub_Category_Service {

	List<M_Aems_Sub_Category> getAemsSubCategoryList(HttpServletRequest request, Integer offset);

	List<M_Aems_Sub_Category> getAemsSubCategoryByActiveStatus(Integer aemsSubCategoryActive);

	String saveAemsSubCategoryDetails(HttpServletRequest request, M_Aems_Sub_Category aemsSubCategory);

	String getAemsSubCategoryDetails(HttpServletRequest request);

}
