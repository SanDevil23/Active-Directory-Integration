$(function() {
	$(".hopperProjectCountDiv").show();
	console.log("Hopper Count & Savings");
	$.ajax({
		url:'getHopperCount',
		type:'GET',
		async: true,
		data:{},
		dataType : 'json',
		success: function(result) {
			console.log("Hopper Count & Savings - Response");
			if(Object.keys(result).length != 0) {
				var hopperProjectCountGraph = $('#hopperProjectCountGraph');
				var hopperProjectCountGraphChart = new Chart(hopperProjectCountGraph, {
					type: 'bar',
					data: {
						labels: ['Productivity','Quality','Cost','Delivery','Safety'],
						datasets: [ {
							data: [result[1],result[2],result[3],result[4],result[5]],
							backgroundColor: ["#00AEEF", "#002E6D", "#63666A", "#D1F0FC", "#B9C6D7"],
							/* datalabels: {
							 * anchor: 'end',
							 * align: 'top'
							 * } */
						 }]
					},
					plugins: [ChartDataLabels],
					options: {
						indexAxis: 'y',
						plugins: {
							legend: {
								display: false
							},
							datalabels: {
								color:"#000000"
							}
						},
						scales: {
							y: {
								beginAtZero: true,
								grid: {
									display: false
								}
							},
							x: {
								beginAtZero: true,
								grid: {
									display: false
								}
							}
						}
					},
				});
				
				$("#hopperProjectCount").hide();
				$(".hopperProjectCountDiv").remove();
				$("#hopperProjectCount").show();
			} else {
				$(".hopperProjectCountDiv").remove();
				$("#hopperProjectCount").html("");
				$("#hopperProjectCount").html("<p style='text-align: center;color: #0E4273;'><strong>No statistics available now.<strong> </p>");
			}
		},
		error:function() {}
	});
	$(".hopperProjectSavingsDiv").show();
	$.ajax({
		url:'getHopperCumulativeSaving',
		type:'GET',
		async: true,
		data:{},
		dataType : 'json',
		success: function(result) {
			console.log("Hopper Count & Savings - Response");
			if(Object.keys(result).length != 0) {
				var hopperProjectSavingsGraph = $('#hopperProjectSavingsGraph');
				var hopperProjectSavingsGraphChart = new Chart(hopperProjectSavingsGraph, {
					type: 'bar',
					data: {
						labels: ['Productivity','Quality','Cost','Delivery','Safety'],
						datasets: [ {
							/* backgroundColor: '#00AEEF',
							borderColor: '#00AEEF', */
							data: [result[1],result[2],result[3],result[4],result[5]],
							backgroundColor: ["#00AEEF", "#002E6D", "#63666A", "#D1F0FC", "#B9C6D7"],
							datalabels: {
								anchor: 'end',
								align: 'top'
							}
						}]
					},
					plugins: [ChartDataLabels],
					options: {
						plugins: {
							legend: {
								display: false
							},
							datalabels: {
								color:"#000000"
							}
						},
						scales: {
							y: {
								beginAtZero: true,
								grid: {
									display: false
								}
							},
							x: {
								beginAtZero: true,
								grid: {
									display: false
								}
							}
						}
					},
				});
				$("#hopperProjectCount").hide();
				$(".hopperProjectSavingsDiv").remove();
				$("#hopperProjectCount").show();
			} else {
				$(".hopperProjectCountDiv").remove();
				$("#hopperProjectCount").html("");
				$("#hopperProjectCount").html("<p style='text-align: center;color: #0E4273;'><strong>No statistics available now.<strong> </p>");
			}
		},
		error:function() {}
	});
	
	var activeProjectCountGraph = $('#activeProjectCountGraph');
	 var activeProjectCountGraphChart = new Chart(activeProjectCountGraph, {
		 type: 'bar',
		 data: {
			 labels: ['Productivity','Quality','Cost','Delivery','Safety'],
			 datasets: [ {
				 /* backgroundColor: '#00AEEF',
				 borderColor: '#00AEEF', */
				 data: [2,7,2,12,10],
				 backgroundColor: ["#00AEEF", "#002E6D", "#63666A", "#D1F0FC", "#B9C6D7"],
			 datalabels: {
				 anchor: 'end',
				 align: 'top'
			 }
			 }]
		},
		plugins: [ChartDataLabels],
		options: {
			plugins: {
				legend: {
					display: false
				},
				datalabels: {
					color:"#000000"
				}
			},
			scales: {
				y: {
					beginAtZero: true,
					grid: {
						display: false
					}
				},
				x: {
					beginAtZero: true,
					grid: {
						display: false
					}
				}
			}
		},
	});
	 
	var activeProjectSavingsGraph = $('#activeProjectSavingsGraph');
 var activeProjectSavingsGraphChart = new Chart(activeProjectSavingsGraph, {
	 type: 'bar',
	 data: {
		 /* labels: fullMonth, */
		 /* datasets: [{ backgroundColor: '#00AEEF', borderColor: '#00AEEF', data: fullOriginalCount },
			 { backgroundColor: '#002E6D', borderColor: '#002E6D', data: fullExecutionCount }
		 ] */
		 labels: ['Productivity','Quality','Cost','Delivery','Safety'],
		 datasets: [ {
			 /* backgroundColor: '#00AEEF',
			 borderColor: '#00AEEF', */
			 data: [2,7,2,12,10],
			 backgroundColor: ["#00AEEF", "#002E6D", "#63666A", "#D1F0FC", "#B9C6D7"],
			 datalabels: {
				 anchor: 'end',
				 align: 'top'
			 }
		 }]
	},
	plugins: [ChartDataLabels],
	options: {
		plugins: {
			legend: {
				display: false
			},
			datalabels: {
				color:"#000000"
			}
		},
		scales: {
			y: {
				beginAtZero: true,
				grid: {
					display: false
				}
			},
			x: {
				beginAtZero: true,
				grid: {
					display: false
				}
			}
		}
	},
});
});