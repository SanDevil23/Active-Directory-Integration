<!-- ****************************************************************************************
# *******************************************************************************************
# Copyright © 2021 Anand Group India. All rights reserved.									*
# No part of this product may be reproduced in any form by any means without prior			*
# written authorization of Anand Automotive Private Limited and its licensors, if any.				*
# *******************************************************************************************
# Author - Sheshadhri Iyer																	*
# *************************************************************************************** -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<%@include file="includeJSP/cssFiles.jsp"%>
		<title>Forgot Password | EMC Tracker | AAPL</title>
		<link rel="stylesheet" href="usedStaticFiles/css/generalCss/icheck-bootstrap.css">
	</head>
	<body class="hold-transition layout-top-nav">
		<div class="wrapper">
			<nav class="main-header navbar navbar-expand-md navbar-light navbar-white">
				<div class="container" style="width='100%'">
					<!-- <a href="login" class="navbar-brand">
						<img src="usedStaticFiles/images/logo.png" alt="AdminLTE Logo" class="brand-image" style="opacity: .8">
					</a> -->
					<h4>Internal Audit Tool</h4>
				</div>
				<ul class="order-1 order-md-3 navbar-nav navbar-no-expand ml-auto">
					<!-- <li class="nav-item">
						<h4>Internal&nbsp;</h4>
					</li>
					<li class="nav-item">
						<h4>Audit&nbsp;</h4>
					</li>
					<li class="nav-item">
						<h4>Tool</h4>
					</li> -->
					<li class="nav-item">
						<img src="usedStaticFiles/images/logo.png" alt="AdminLTE Logo" class="brand-image" style="opacity: .8">
					</li>
				</ul>
			</nav>
			<div class="content-wrapper bg-image">
			<!-- <div class="content-wrapper"> -->
				<div class="content-header">
					<div class="container">
						<!-- <div class="row mb-2">
							<div class="col-sm-4"></div>
							<div class="col-sm-4">
								<h1 class="m-0"> Login <small>Internal Audit</small></h1>
							</div>
							<div class="col-sm-4"></div>
						</div> -->
					</div>
				</div>
				<form action="tes" method="post" id="loginForm">
					<div class="content">
						<div class="container">
							<br><br>
							<div class="row">
								<div class="col-md-4"></div>
								<div class="col-md-4">
									<div class="card card-primary">
										<div class="card-header" align="center" style="background-color:#00aeef">
											<h3 class="m-0">Forgot Password</h3>
										</div>
										<div class="card-body">
											<div class="input-group mb-3">
												<input id="email" name="email" type="email" class="form-control" placeholder="Email">
												<div class="input-group-append">
													<div class="input-group-text">
														<span class="fas fa-envelope"></span>
													</div>
												</div>
												<span class="error invalid-feedback" id="emailError" style="display:block"></span>
											</div>
											<div class="row">
												<div class="col-6">
												</div>
												<div class="col-6">
													<button id="submitLogin" type="submit" class="btn btn-primary btn-block">Request Password</button>
												</div>
											</div>
											<p class="mb-0">
												<a href="login" title="Go to login" class="text-center">Login</a>
											</p>
										</div>
									</div>
								</div>
								<div class="col-md-4"></div>
							</div>
						</div>
					</div>
				</form>
			</div>

			<%@include file="includeJSP/footer.jsp"%>
		</div>

		<%@include file="includeJSP/jsFiles.jsp"%>
		<script type="text/javascript" src="usedStaticFiles/js/jsp_js_files/login_page.js"></script>
	</body>
</html>