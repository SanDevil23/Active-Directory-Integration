$(function() {
	var pieChartCanvas=$('#pieChart').get(0).getContext('2d')
	var pieData={
		labels:['Pending','Waiting @ Manager','Waiting @ PRAAC','Rejected by Manager','Rejected by PRAAC','Completed'],
		datasets:[
			{
				data:[700,500,400,600,300,100],
				backgroundColor:['#9A0000','#e06000','#ffc000','#00AEEF','#002E6D','#009845']
			}
		]
	}
	var pieOptions={legend:{display:true}}
	var pieChart=new Chart(pieChartCanvas,{type:'doughnut',data:pieData,options:pieOptions})
});