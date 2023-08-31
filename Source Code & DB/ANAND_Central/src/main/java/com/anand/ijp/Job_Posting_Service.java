/**
 * *******************************************************************************************
 * Copyright © 2021 Anand Group India. All rights reserved.
 * No part of this product may be reproduced in any form by any means without prior
 * written authorization of Anand Automotive Private Limited and its licensors, if any.
 * *******************************************************************************************
 * Author - Anand Group India - R S Iyer
 */
package com.anand.ijp;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface Job_Posting_Service {

	List<Job_Posting> getJobsListOpenForEmployees(HttpServletRequest request);

	List<Job_Posting> getactiveJobsList(HttpServletRequest request, Integer offset);

	String saveJobPostingDetails(HttpServletRequest request, Job_Posting jobPosting);

	Job_Posting getJobPostingDetails(HttpServletRequest request);
}
