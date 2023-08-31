$('#yearId').select2({
	theme: 'bootstrap4'
});
$('#parentEntityId').select2({
	theme: 'bootstrap4'
});
$('#childEntityId').select2({
	theme: 'bootstrap4'
});
$(function() {
	var pieChartCanvas=$('#pieChart').get(0).getContext('2d')
	var pieData={
		labels:['Open','Approval Waiting','Rejected','Closed'],
		datasets:[
			{
				data:[60,60,60,60],
				backgroundColor:['#63666A','#E06000','#C00000','#009845']
			}
		]
	}
	var pieOptions={legend:{display:true}}
	var pieChart=new Chart(pieChartCanvas,{type:'doughnut',data:pieData,options:pieOptions})
});