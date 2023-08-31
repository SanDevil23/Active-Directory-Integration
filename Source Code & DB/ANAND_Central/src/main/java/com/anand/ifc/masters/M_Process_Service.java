/**
 * *******************************************************************************************
 * Copyright © 2021 Anand Group India. All rights reserved.
 * No part of this product may be reproduced in any form by any means without prior
 * written authorization of Anand Automotive Private Limited and its licensors, if any.
 * *******************************************************************************************
 * Author - Anand Group India - R S Iyer
 */
package com.anand.ifc.masters;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface M_Process_Service {

	List<M_Process> getProcessList(HttpServletRequest request, Integer offset);

	List<M_Process> getProcessByActiveStatus(Integer processActive);

	String saveProcessDetails(HttpServletRequest request, M_Process process);

	String getProcessDetails(HttpServletRequest request);

}
