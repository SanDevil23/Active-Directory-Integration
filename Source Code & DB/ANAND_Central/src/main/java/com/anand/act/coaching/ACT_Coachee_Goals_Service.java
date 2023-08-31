/**
 * *******************************************************************************************
 * Copyright © 2021 Anand Group India. All rights reserved.
 * No part of this product may be reproduced in any form by any means without prior
 * written authorization of Anand Automotive Private Limited and its licensors, if any.
 * *******************************************************************************************
 * Author - Anand Group India - R S Iyer
 */
package com.anand.act.coaching;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface ACT_Coachee_Goals_Service {

	String checkCoacheeIsAddedInLatestAldp(HttpServletRequest request);

	List<ACT_Coachee_Goals> getCoacheeGoalsList(HttpServletRequest request);

	String saveCoacheeGoalsDetails(HttpServletRequest request, ACT_Coachee_Goals actCoacheeGoals);

	String getCoacheeGoalDetails(HttpServletRequest request);
}
