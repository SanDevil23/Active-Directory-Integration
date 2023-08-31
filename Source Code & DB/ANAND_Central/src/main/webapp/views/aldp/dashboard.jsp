<!-- ****************************************************************************************
# *******************************************************************************************
# Copyright © 2021 Anand Group India. All rights reserved.									*
# No part of this product may be reproduced in any form by any means without prior			*
# written authorization of Anand Automotive Private Limited and its licensors, if any.		*
# *******************************************************************************************
# Author - Sheshadhri Iyer																	*
# *************************************************************************************** -->
<!DOCTYPE html>
<html lang="en">
  <head>
   <title>DASHBOARD | ACT | ANAND GROUP</title>
   <%@include file="../includeJSP/cssFiles.jsp"%>
  </head>
  <body class="sidebar-mini layout-navbar-fixed sidebar-collapse pace-primary">
    <div class="wrapper">
      <%@include file="../includeJSP/header.jsp"%>
      <%@include file="includeJSP/leftSideBar.jsp"%>
      <div class="content-wrapper">
        <section class="content-header">
               <div class="container-fluid">
                  <div class="row mb-2">
                     <div class="col-sm-6">
                        <h5 class="font-color-anand-one font-weight-bold">DASHBOARD - ACT</h5>
                     </div>
                     <div class="col-sm-6">
                       <ol class="breadcrumb float-sm-right">
                         <li class="breadcrumb-item"><a href="dashboard" title="Dashboard"><strong>Dashboard</strong></a></li>
                         <li class="breadcrumb-item active"><strong>ACT Dashboard</strong></li>
                       </ol>
                     </div>
                  </div>
               </div>
            </section>
        <section class="content content-margin">
					<div class="container-fluid">
						
						<div class="row">
							<div class="col-md-9">
								<div class="card card-primary card-outline">
									<div class="card-header">
										<h3 class="card-title">
											<i class="far fa-chart-bar"></i>&nbsp;Coach Wise Status
										</h3>
									</div>
									<div class="card-body">
										<table class="table table-bordered">
											<thead>
												<tr>
													<th>#</th>
													<th>Coach Name</th>
													<th>Coachee Name</th>
													<th>Yearly Plan</th>
													<th>Planned Till Date</th>
													<th>Actual Till Date</th>
													<th style="width: 40px">Completion Percentage</th>
												</tr>
											</thead>
											<tbody>
												<tr style="vertical-align: middle;text-align: center;">
													<td>1.</td>
													<td>Kalpesh Thacker</td>
													<td>Sampada Inamdar</td>
													<td>20</td>
													<td>15</td>
													<td>12</td>
													<td>
														<input type="text" class="knob" value="30" data-width="40" data-height="40" data-fgColor="#3c8dbc">
													</td>
												</tr>
												<tr style="vertical-align: middle;text-align: center;">
													<td>2.</td>
													<td>Kalpesh Thacker</td>
													<td>Sampada Inamdar</td>
													<td>20</td>
													<td>15</td>
													<td>12</td>
													<!-- <td>
														<div class="progress progress-xs">
															<div class="progress-bar progress-bar-danger" style="width: 55%"></div>
														</div>
													</td> -->
													<td>
														<input type="text" class="knob" value="30" data-width="40" data-height="40" data-fgColor="#3c8dbc">
													</td>
												</tr>
												<tr style="vertical-align: middle;text-align: center;">
													<td>3.</td>
													<td>Kalpesh Thacker</td>
													<td>Sampada Inamdar</td>
													<td>20</td>
													<td>15</td>
													<td>12</td>
													<td>
														<input type="text" class="knob" value="30" data-width="40" data-height="40" data-fgColor="#3c8dbc">
													</td>
												</tr>
												<tr style="vertical-align: middle;text-align: center;">
													<td>4.</td>
													<td>Kalpesh Thacker</td>
													<td>Sampada Inamdar</td>
													<td>20</td>
													<td>15</td>
													<td>12</td>
													<!-- <td>
														<div class="progress progress-xs">
															<div class="progress-bar progress-bar-danger" style="width: 55%"></div>
														</div>
													</td> -->
													<td>
														<input type="text" class="knob" value="30" data-width="40" data-height="40" data-fgColor="#3c8dbc">
													</td>
												</tr>
												<tr style="vertical-align: middle;text-align: center;">
													<td>5.</td>
													<td>Kalpesh Thacker</td>
													<td>Sampada Inamdar</td>
													<td>20</td>
													<td>15</td>
													<td>12</td>
													<td>
														<input type="text" class="knob" value="30" data-width="40" data-height="40" data-fgColor="#3c8dbc">
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							
							
							<div class="col-md-3">
								<div class="card card-primary card-outline">
									<div class="card-header">
										<h3 class="card-title">
											<i class="far fa-chart-bar"></i>&nbsp;Training Coverage Statistics
										</h3>
									</div>
									<div class="card-body">
										<div class="chart">
											<canvas id="observation_tracker" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
										</div>
									</div>
								</div>
							</div>
							
							<div class="col-md-9">
								<div class="card card-primary card-outline">
									<div class="card-header">
										<h3 class="card-title">
											<i class="far fa-chart-bar"></i>&nbsp;Coachee Wise Status
										</h3>
									</div>
									<div class="card-body">
										<table class="table table-bordered">
											<thead>
												<tr>
													<th style="width: 10px">#</th>
													<th>Coach Name</th>
													<th>Coachee Name</th>
													<th>Yearly Plan</th>
													<th>Planned Till Date</th>
													<th>Actual Till Date</th>
													<th style="width: 40px">Completion Percentage</th>
												</tr>
											</thead>
											<tbody>
												<tr style="vertical-align: middle;text-align: center;">
													<td>1.</td>
													<td>Kalpesh Thacker</td>
													<td>Sampada Inamdar</td>
													<td>20</td>
													<td>15</td>
													<td>12</td>
													<td>
														<input type="text" class="knob" value="30" data-width="40" data-height="40" data-fgColor="#3c8dbc">
													</td>
												</tr>
												<tr style="vertical-align: middle;text-align: center;">
													<td>2.</td>
													<td>Kalpesh Thacker</td>
													<td>Sampada Inamdar</td>
													<td>20</td>
													<td>15</td>
													<td>12</td>
													<!-- <td>
														<div class="progress progress-xs">
															<div class="progress-bar progress-bar-danger" style="width: 55%"></div>
														</div>
													</td> -->
													<td>
														<input type="text" class="knob" value="30" data-width="40" data-height="40" data-fgColor="#3c8dbc">
													</td>
												</tr>
												<tr style="vertical-align: middle;text-align: center;">
													<td>3.</td>
													<td>Kalpesh Thacker</td>
													<td>Sampada Inamdar</td>
													<td>20</td>
													<td>15</td>
													<td>12</td>
													<td>
														<input type="text" class="knob" value="30" data-width="40" data-height="40" data-fgColor="#3c8dbc">
													</td>
												</tr>
												<tr style="vertical-align: middle;text-align: center;">
													<td>4.</td>
													<td>Kalpesh Thacker</td>
													<td>Sampada Inamdar</td>
													<td>20</td>
													<td>15</td>
													<td>12</td>
													<!-- <td>
														<div class="progress progress-xs">
															<div class="progress-bar progress-bar-danger" style="width: 55%"></div>
														</div>
													</td> -->
													<td>
														<input type="text" class="knob" value="30" data-width="40" data-height="40" data-fgColor="#3c8dbc">
													</td>
												</tr>
												<tr style="vertical-align: middle;text-align: center;">
													<td>5.</td>
													<td>Kalpesh Thacker</td>
													<td>Sampada Inamdar</td>
													<td>20</td>
													<td>15</td>
													<td>12</td>
													<td>
														<input type="text" class="knob" value="30" data-width="40" data-height="40" data-fgColor="#3c8dbc">
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>

					</div>
				</section>
      </div>
      <%@include file="includeJSP/footer.jsp"%>
    </div>
    <%@include file="../includeJSP/jsFiles.jsp"%>
    <script src="usedStaticFiles/js/generalJs/charts/Chart.min.js"></script>
		
		<script src="usedStaticFiles/js/generalJs/jquery-knob/jquery.knob.min.js"></script>
		
		<script>
			$(function () {

				var observation_tracker = $('#observation_tracker').get(0).getContext('2d');
				var observation_tracker_data = {
					labels: ['Covered > 70%','Covered > 50%','Covered < 50%'],
					datasets: [
						{
							data: [30,30,40],
							backgroundColor: ['#009845', '#FFC000', '#C00000']
						}
					]
				}
				var observation_tracker_options = {
					maintainAspectRatio : false,
					responsive : true,
				}
				var observation_tracker_chart = new Chart(observation_tracker, {
					type: 'doughnut',
					data: observation_tracker_data,
					options: observation_tracker_options
				});
			});
			
			
			
			
			
			
			/* jQueryKnob */

		    $('.knob').knob({
		      /*change : function (value) {
		       //console.log("change : " + value);
		       },
		       release : function (value) {
		       console.log("release : " + value);
		       },
		       cancel : function () {
		       console.log("cancel : " + this.value);
		       },*/
		      draw: function () {

		        // "tron" case
		        if (this.$.data('skin') == 'tron') {

		          var a   = this.angle(this.cv)  // Angle
		            ,
		              sa  = this.startAngle          // Previous start angle
		            ,
		              sat = this.startAngle         // Start angle
		            ,
		              ea                            // Previous end angle
		            ,
		              eat = sat + a                 // End angle
		            ,
		              r   = true

		          this.g.lineWidth = this.lineWidth

		          this.o.cursor
		          && (sat = eat - 0.3)
		          && (eat = eat + 0.3)

		          if (this.o.displayPrevious) {
		            ea = this.startAngle + this.angle(this.value)
		            this.o.cursor
		            && (sa = ea - 0.3)
		            && (ea = ea + 0.3)
		            this.g.beginPath()
		            this.g.strokeStyle = this.previousColor
		            this.g.arc(this.xy, this.xy, this.radius - this.lineWidth, sa, ea, false)
		            this.g.stroke()
		          }

		          this.g.beginPath()
		          this.g.strokeStyle = r ? this.o.fgColor : this.fgColor
		          this.g.arc(this.xy, this.xy, this.radius - this.lineWidth, sat, eat, false)
		          this.g.stroke()

		          this.g.lineWidth = 2
		          this.g.beginPath()
		          this.g.strokeStyle = this.o.fgColor
		          this.g.arc(this.xy, this.xy, this.radius - this.lineWidth + 1 + this.lineWidth * 2 / 3, 0, 2 * Math.PI, false)
		          this.g.stroke()

		          return false
		        }
		      }
		    })
		    /* END JQUERY KNOB */
		</script>
  </body>
</html>