/**
 * ******************************************************************************************
 * Copyright © 2021-2022 ANAND Automotive Private Limited. All rights reserved.				*
 * No part of this product may be reproduced in any form by any means without prior			*
 * written authorization of ANAND Automotive Private Limited and its licensors, if any.		*
 * ******************************************************************************************
 * Author - ANAND Automotive Private Limited - Corporate IT - R S Iyer						*
 * ******************************************************************************************
 */
package com.anand.common;

public class Common_Constants {

	public static String toMailIdTesting = "sheshadhri.iyer@anandgroupindia.com";

	public static String ccMailIdTesting = "sheshadhri.iyer@anandgroupindia.com";

	public static String applicationUrl = "https://ijp.anandgroupindia.com/IJP/login.htm";

	public static String toolNotificationMailID = "hr@anandgroupindia.net.in";

	public static final String emailHead = "<!DOCTYPE html>" + 
			"<html xmlns='http://www.w3.org/1999/xhtml' lang='en-US'>" + 
			"	<head>" + 
			"		<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />" + 
			"		<title></title>" + 
			"		<meta name='viewport' content='width=device-width, initial-scale=1.0'/>" + 
			"		<style text='css'>" + 
			"			.stable1 {" + 
			"				font-family: Helvetica;" + 
			"				border: 1px solid #000;" + 
			"				border-collapse: collapse;" + 
			"			}" + 
			"		</style>" + 
			"	</head>" + 
			"	<body style='margin: 0; padding: 0;'>" + 
			"		<table align='center' width='600px' class='stable1'>" + 
			"			<tr>" + 
			"				<td>" + 
			"					<br><img class='' width='600' height='35' style='padding-right:30px;padding-top:10px;float:right' src='cid:logoImage' alt='Anand Group IJP.' /><br><br>" + 
			"				</td>" + 
			"			</tr>";

	public static final String emailFooter = "<tr>" + 
			"				<td style='padding: 10px 10px 10px 10px;'>" + 
			"					<p class='namenow' style='margin: 0;'>" + 
			"						Warm Regards,<br>" + 
			"						Corporate Internal Audit Team.<br>" + 
			"						<a style='color:#00AEEF;' href='"+applicationUrl+"'><strong>IAMS Login</strong></a>" + 
			"					</p>" + 
			"				</td>" + 
			"			</tr>" + 
			"			<tr>" + 
			"				<td style='padding-top:20px'>" + 
			"					<a title='Anand Group India' href='https://www.anandgroupindia.com/'><img class='' style='' width='620'  height='' src='cid:footerImage' alt='Anand Group IJP.' /></a>" + 
			"				</td>" + 
			"			</tr>" + 
			"		</table>" + 
			"	</body>" + 
			"</html>";
}