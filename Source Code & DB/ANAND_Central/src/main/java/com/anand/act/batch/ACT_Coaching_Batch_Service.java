/**
 * *******************************************************************************************
 * Copyright © 2021 Anand Group India. All rights reserved.
 * No part of this product may be reproduced in any form by any means without prior
 * written authorization of Anand Automotive Private Limited and its licensors, if any.
 * *******************************************************************************************
 * Author - Anand Group India - R S Iyer
 */
package com.anand.act.batch;

import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface ACT_Coaching_Batch_Service {

	List<ACT_Coaching_Batch> getBatchList(HttpServletRequest request, Integer offset);

	ACT_Coaching_Batch getCurrentBatch();

	List<ACT_Coaching_Batch> getBatchByActiveStatus(Integer batchActive);

	String saveBatchDetails(HttpServletRequest request, ACT_Coaching_Batch batch) throws ParseException;

	String getBatchDetails(HttpServletRequest request);

	ACT_Coach_Coachee_Map getCoachCoacheeMapInformation(HttpServletRequest request);
}
