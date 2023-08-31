/**
 * *******************************************************************************************
 * Copyright © 2021 Anand Group India. All rights reserved.
 * No part of this product may be reproduced in any form by any means without prior
 * written authorization of Anand Automotive Private Limited and its licensors, if any.
 * *******************************************************************************************
 * Author - Anand Group India - R S Iyer
 */
package com.anand.act.coaching;

import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.anand.act.batch.ACT_Coach_Coachee_Map;

public interface ACT_Coachee_Report_Service {

	List<ACT_Coachee_Report> getCoacheeReportList(HttpServletRequest request);

	String saveCoacheeReportDetails(HttpServletRequest request, ACT_Coach_Coachee_Map actCoachCoacheeMap) throws ParseException;

	String saveCoacheeReportCoachDetails(HttpServletRequest request, ACT_Coach_Coachee_Map actCoachCoacheeMap) throws ParseException;

	String getCoacheeReportDetails(HttpServletRequest request);

	List<ACT_Coachee_Report_Action> getCoacheeGoalActionList(HttpServletRequest request);
}
