$(".form-control").change(function() {
	var mf_date = $(this).val();
	//alert(mf_date);
	
	$.ajax({
		url : '/ManagementFeeTableJSONList'+mf_date,
		type : 'post',
		dataType : 'json',
		success : function(json) {
			/*alert(json);
			alert(json[0].mf_waterFee);
			alert(json[1].mf_waterFee-json[0].mf_waterFee);
			alert((json[1].mf_waterFee-json[0].mf_waterFee)>0);*/
			
			//json[0] : 이번달, json[1]: 지난달
			var totalThisMntFee = json[0].mf_waterFee+json[0].mf_gasFee+json[0].mf_electricFee;
			var totalLastMntFee	= json[1].mf_waterFee+json[1].mf_gasFee+json[1].mf_electricFee;;
			
			var totalThisPubMntFee = json[2].pm_clean+json[2].pm_general+json[2].pm_maintain+json[2].pm_liftMaintain
			+json[2].pm_security+json[2].pm_foodWaste+json[2].pm_fireInsurance+json[2].pm_commission+json[2].pm_meeting
			+json[2].pm_publicElectric+json[2].pm_liftElectric+json[2].pm_TVFee+json[2].pm_disinfection;
			
			var totalLastPubMntFee = json[3].pm_clean+json[3].pm_general+json[3].pm_maintain+json[3].pm_liftMaintain
			+json[3].pm_security+json[3].pm_foodWaste+json[3].pm_fireInsurance+json[3].pm_commission+json[3].pm_meeting
			+json[3].pm_publicElectric+json[3].pm_liftElectric+json[3].pm_TVFee+json[3].pm_disinfection;
			
			var thisTotal = totalThisMntFee+totalThisPubMntFee;
			var lastTotal = totalLastMntFee+totalLastPubMntFee;
					

			$('#mnt').empty();
			// 수도요금
			var html = '<tr>';
				html += '<td>수도요금</td><td>'+json[1].mf_waterFee+'</td>';
				html += '<td>'+json[0].mf_waterFee+'</td>';
				html += '<c:choose>';
				if(json[0].mf_waterFee-json[1].mf_waterFee>0){
				html += '<td style="color: red;">▲&nbsp;'+(json[0].mf_waterFee-json[1].mf_waterFee)+'</td>';
				}
				else{
				html += '<td style="color: blue;">▼&nbsp;'+(json[1].mf_waterFee-json[0].mf_waterFee)+'</td>';
				}
				html += '</tr>';
				
				//가스요금
				html += '<tr>';
				html += '<td>가스요금</td><td>'+json[1].mf_gasFee+'</td>';
				html += '<td>'+json[0].mf_gasFee+'</td>';
				html += '<c:choose>';
				if(json[0].mf_gasFee-json[1].mf_gasFee>0){
				html += '<td style="color: red;">▲&nbsp;'+(json[0].mf_gasFee-json[1].mf_gasFee)+'</td>';
				}
				else{
				html += '<td style="color: blue;">▼&nbsp;'+(json[1].mf_gasFee-json[0].mf_gasFee)+'</td>';
				}
				html += '</tr>';
				
				//전기요금
				html += '<tr>';
				html += '<td>전기요금</td><td>'+json[1].mf_electricFee+'</td>';
				html += '<td>'+json[0].mf_electricFee+'</td>';
				html += '<c:choose>';
				if(json[0].mf_electricFee-json[1].mf_electricFee>0){
				html += '<td style="color: red;">▲&nbsp;'+(json[0].mf_electricFee-json[1].mf_electricFee)+'</td>';
				}
				else{
				html += '<td style="color: blue;">▼&nbsp;'+(json[1].mf_electricFee-json[0].mf_electricFee)+'</td>';
				}
				html += '</tr>';
				
				//관리비 종합
				html += '<tr style="background-color: #e4e4e4;">';
				html += '<td>관리비종합</td><td>'+totalLastMntFee+'</td>';
				html += '<td>'+totalThisMntFee+'</td>';
				html += '<c:choose>';
				if(totalThisMntFee-totalLastMntFee>0){
				html += '<td style="color: red;">▲&nbsp;'+(totalThisMntFee-totalLastMntFee)+'</td>';
				}
				else{
				html += '<td style="color: blue;">▼&nbsp;'+(totalLastMntFee-totalThisMntFee)+'</td>';
				}
				html += '</tr>';
				

				//공동 관리비 종합
				html += '<tr style="background-color: #e4e4e4;">';
				html += '<td>공동 관리비 종합</td><td>'+totalLastPubMntFee+'</td>';
				html += '<td>'+totalThisPubMntFee+'</td>';
				html += '<c:choose>';
				if(totalThisPubMntFee-totalLastPubMntFee>0){
				html += '<td style="color: red;">▲&nbsp;'+(totalThisPubMntFee-totalLastPubMntFee)+'</td>';
				}
				else{
				html += '<td style="color: blue;">▼&nbsp;'+(totalLastPubMntFee-totalThisPubMntFee)+'</td>';
				}
				html += '</tr>';
				
				//관리비+공동관리				
				html += '<tr style="background-color: skyblue;">';
				html += '<td>총계</td><td>'+lastTotal+'</td>';
				html += '<td>'+thisTotal+'</td>';
				html += '<c:choose>';
				if(thisTotal-lastTotal>0){
				html += '<td style="color: red;">▲&nbsp;'+(thisTotal-lastTotal)+'</td>';
				}
				else{
				html += '<td style="color: blue;">▼&nbsp;'+(lastTotal-thisTotal)+'</td>';
				}
				html += '</tr>';
				
				
				$('#mnt').append(html);
		}
	})
});


$(function() {
	/* $("#mngtable").; */

	//alert($(".form-control option:selected").val());
	var areaChartCanvas = $("#waterChart").get(0).getContext("2d");
	var areaChart = new Chart(areaChartCanvas);

	var areaChartCanvas2 = $("#gasChart").get(0).getContext("2d");
	var areaChart2 = new Chart(areaChartCanvas2);

	var areaChartCanvas3 = $("#electricChart").get(0).getContext("2d");
	var areaChart3 = new Chart(areaChartCanvas3);

	var areaChartCanvas4 = $("#allChart").get(0).getContext("2d");
	var areaChart4 = new Chart(areaChartCanvas4);

	var waterList          = []; // 월별 수도요금
	var gasList            = []; // 월별 가스요금 
	var electricList       = []; // 월별 전기요금
 	var waterAmountList    = []; // 월별 수도 사용량
	var gasAmountList      = []; // 월별 가스 사용량
	var electricAmountList = []; // 월별 전기사용량
	var publicFeeList 	   = []; // 월별 공동관리비 
	var waterFeeAvg    	   = [];
	var gasFeeAvg          = [];
	var electricFeeAvg     = [];
	var mngAvgSumList      = []; // 나의 단지 평균 요금 총합
	
	
	var date1 = [];
	
	var thisPayAmount = [];
	var afterThisPayAmount = null;
	var subdate = null;
	
	$.ajax({
		url : '/ManagementFeeJSONList',
		type : 'post',
		dataType : 'json',
		success : function(json) {
			$.each(json, function(index, data) {
				waterList.push(json[index].mf_waterFee);
				gasList.push(json[index].mf_gasFee);
				electricList.push(json[index].mf_electricFee);
				
				waterAmountList.push(json[index].mf_waterAmount);
				gasAmountList.push(json[index].mf_gasAmount);
				electricAmountList.push(json[index].mf_electricAmount);
				
				date1.push(json[index].mf_date);
				if(index==6){
					return false;
				}
			})
			
			// json 데이터 추가로 담음.
			for(var i=0;i<7;i++){
				publicFeeList[i] = json[7+i];
				waterFeeAvg.push(json[14+i].mf_waterFeeAvg);
				gasFeeAvg.push(json[14+i].mf_gasFeeAvg);
				electricFeeAvg.push(json[14+i].mf_electricFeeAvg);
				mngAvgSumList[i]=waterFeeAvg[i]+gasFeeAvg[i]+electricFeeAvg[i]+publicFeeList[i];
				thisPayAmount[i] =  waterList[i]+gasList[i]+electricList[i]+publicFeeList[i];
			}
			
			
			alert(waterFeeAvg);
			
			afterThisPayAmount = thisPayAmount[6]*1.05;
			//alert(thisPayAmount);
			subdate = date1[6].substr(4,2);
			alert(subdate);
			
			var html = '<div>'+subdate+'월의 납부금액은'+thisPayAmount[6]+'원 입니다.';
//			var html = '<div>월의 납부금액은'+thisPayAmount+'원 입니다.';
			$('#thisPayAmount').append(html);
			
			html = waterList[6]+'원';
			$('.detailWaterFee').append(html);
			
			html = gasList[6]+'원';
			$('.detailGasFee').append(html);
			
			html = electricList[6]+'원';
			$('.detailElectricFee').append(html);
		
			html = waterAmountList[6]+'&nbsp;L';
			$('.detailWaterAmount').append(html);
			
			html = gasAmountList[6]+'&nbsp;L';
			$('.detailGasAmount').append(html);
			
			html = electricAmountList[6]+'&nbsp;KW';
			$('.detailElectricAmount').append(html);
			
			html = publicFeeList[6]+'원';
			$('.detailPublicFee').append(html);
			
			html = '<div>납기내 금액 &nbsp;: <font color="blue">'+thisPayAmount[6]+'</font>원</div>';
			html += '<div>납기후 금액 &nbsp;: <font color="red">'+Math.round(afterThisPayAmount)+'</font>원</div>';
			//var html = "<div>지랄</div>";
			$('#MntFeedetail').append(html);
			
			var areaChartData = {

				labels : date1,
				datasets : [ {
					label : "평균요금",
					fillColor : "rgba(210, 214, 222, 1)",
					strokeColor : "rgba(210, 214, 222, 1)",
					pointColor : "rgba(210, 214, 222, 1)",
					pointStrokeColor : "#c1c7d1",
					pointHighlightFill : "#fff",
					pointHighlightStroke : "rgba(220,220,220,1)",
					data : waterFeeAvg
				}, {
					label : "우리집요금",
					fillColor : "rgba(60,141,188,0.9)",
					strokeColor : "rgba(60,141,188,0.8)",
					pointColor : "#3b8bba",
					pointStrokeColor : "rgba(60,141,188,1)",
					pointHighlightFill : "#fff",
					pointHighlightStroke : "rgba(60,141,188,1)",
					data : waterList
				} ]
			};

			// 가스요금
			var areaChartData2 = {
				labels : date1,
				datasets : [ {
					label : "평균요금",
					fillColor : "rgba(210, 214, 222, 1)",
					strokeColor : "rgba(210, 214, 222, 1)",
					pointColor : "rgba(210, 214, 222, 1)",
					pointStrokeColor : "#c1c7d1",
					pointHighlightFill : "#fff",
					pointHighlightStroke : "rgba(220,220,220,1)",
					data : gasFeeAvg
				}, {
					label : "우리집요금",
					fillColor : "rgba(60,141,188,0.9)",
					strokeColor : "rgba(60,141,188,0.8)",
					pointColor : "#3b8bba",
					pointStrokeColor : "rgba(60,141,188,1)",
					pointHighlightFill : "#fff",
					pointHighlightStroke : "rgba(60,141,188,1)",
					data : gasList
				} ]
			};

			// 전기요금
			var areaChartData3 = {
				labels : date1,
				datasets : [ {
					label : "평균요금",
					fillColor : "rgba(210, 214, 222, 1)",
					strokeColor : "rgba(210, 214, 222, 1)",
					pointColor : "rgba(210, 214, 222, 1)",
					pointStrokeColor : "#c1c7d1",
					pointHighlightFill : "#fff",
					pointHighlightStroke : "rgba(220,220,220,1)",
					data : electricFeeAvg
				}, {
					label : "우리집요금",
					fillColor : "rgba(60,141,188,0.9)",
					strokeColor : "rgba(60,141,188,0.8)",
					pointColor : "#3b8bba",
					pointStrokeColor : "rgba(60,141,188,1)",
					pointHighlightFill : "#fff",
					pointHighlightStroke : "rgba(60,141,188,1)",
					data : electricList
				} ]
			};

			// 종합
			var areaChartData4 = {
				labels : date1,
				datasets : [ {
					label : "평균요금",
					fillColor : "rgba(210, 214, 222, 1)",
					strokeColor : "rgba(210, 214, 222, 1)",
					pointColor : "rgba(210, 214, 222, 1)",
					pointStrokeColor : "#c1c7d1",
					pointHighlightFill : "#fff",
					pointHighlightStroke : "rgba(220,220,220,1)",
					data : mngAvgSumList
				}, {
					label : "우리집요금",
					fillColor : "rgba(60,141,188,0.9)",
					strokeColor : "rgba(60,141,188,0.8)",
					pointColor : "#3b8bba",
					pointStrokeColor : "rgba(60,141,188,1)",
					pointHighlightFill : "#fff",
					pointHighlightStroke : "rgba(60,141,188,1)",
					data : [ thisPayAmount[0], thisPayAmount[1], thisPayAmount[2], thisPayAmount[3], thisPayAmount[4], thisPayAmount[5], thisPayAmount[6] ]
				} ]
			};

			var areaChartOptions = {
				// Boolean - If we should show the scale at all
				showScale : true,
				// Boolean - Whether grid lines are shown across the chart
				scaleShowGridLines : false,
				// String - Colour of the grid lines
				scaleGridLineColor : "rgba(0,0,0,.05)",
				// Number - Width of the grid lines
				scaleGridLineWidth : 1,
				// Boolean - Whether to show horizontal lines (except X axis)
				scaleShowHorizontalLines : true,
				// Boolean - Whether to show vertical lines (except Y axis)
				scaleShowVerticalLines : true,
				// Boolean - Whether the line is curved between points
				bezierCurve : true,
				// Number - Tension of the bezier curve between points
				bezierCurveTension : 0.3,
				// Boolean - Whether to show a dot for each point
				pointDot : false,
				// Number - Radius of each point dot in pixels
				pointDotRadius : 4,
				// Number - Pixel width of point dot stroke
				pointDotStrokeWidth : 1,
				// Number - amount extra to add to the radius to cater for hit
				// detection outside the drawn point
				pointHitDetectionRadius : 20,
				// Boolean - Whether to show a stroke for datasets
				datasetStroke : true,
				// Number - Pixel width of dataset stroke
				datasetStrokeWidth : 2,
				// Boolean - Whether to fill the dataset with a color
				datasetFill : true,
				// String - A legend template
				// Boolean - whether to maintain the starting aspect ratio or
				// not when responsive, if set to false, will take up entire
				// container
				maintainAspectRatio : true,
				// Boolean - whether to make the chart responsive to window
				// resizing
				responsive : true
			};

			areaChartData.datasets[1].fillColor = "#00a65a";
			areaChartData.datasets[1].strokeColor = "#00a65a";
			areaChartData.datasets[1].pointColor = "#00a65a";
			
			areaChartData2.datasets[1].fillColor = "#f39c12";
			areaChartData2.datasets[1].strokeColor = "#f39c12";
			areaChartData2.datasets[1].pointColor = "#f39c12";
			
			areaChartData3.datasets[1].fillColor = "#f56954";
			areaChartData3.datasets[1].strokeColor = "#f56954";
			areaChartData3.datasets[1].pointColor = "#f56954";
			
			areaChart.Bar(areaChartData, areaChartOptions);

			var areaChartOptions2 = areaChartOptions;
			// areaChartOptions2.datasetFill = false;
			areaChart2.Bar(areaChartData2, areaChartOptions2);

			var areaChartOptions3 = areaChartOptions;
			// areaChartOptions3.datasetFill = false;
			areaChart3.Bar(areaChartData3, areaChartOptions3);

			var areaChartOptions4 = areaChartOptions;
			areaChartOptions4.datasetFill = false;
			areaChart4.Line(areaChartData4, areaChartOptions4);
			
			// -------------
			// - PIE CHART -
			// -------------
			// Get context with jQuery - using jQuery's .get() method.
			var pieChartCanvas = $("#pieChart").get(0).getContext("2d");
			var pieChart = new Chart(pieChartCanvas);
			var PieData = [ {
				value : electricList[6],
				color : "#f56954",
				highlight : "#f56954",
				label : "전기요금"
			}, {
				value : waterList[6],
				color : "#00a65a",
				highlight : "#00a65a",
				label : "수도요금"
			}, {
				value : gasList[6],
				color : "#f39c12",
				highlight : "#f39c12",
				label : "가스요금"
			}, {
				value : publicFeeList[6],
				color : "#00c0ef",
				highlight : "#00c0ef",
				label : "공동관리비"
			} ];
			var pieOptions = {
				// Boolean - Whether we should show a stroke on each segment
				segmentShowStroke : true,
				// String - The colour of each segment stroke
				segmentStrokeColor : "#fff",
				// Number - The width of each segment stroke
				segmentStrokeWidth : 2,
				// Number - The percentage of the chart that we cut out of the
				// middle
				percentageInnerCutout : 50, // This is 0 for Pie charts
				// Number - Amount of animation steps
				animationSteps : 100,
				// String - Animation easing effect
				animationEasing : "easeOutBounce",
				// Boolean - Whether we animate the rotation of the Doughnut
				animateRotate : true,
				// Boolean - Whether we animate scaling the Doughnut from the
				// centre
				animateScale : false,
				// Boolean - whether to make the chart responsive to window
				// resizing
				responsive : true,
				// Boolean - whether to maintain the starting aspect ratio or
				// not when responsive, if set to false, will take up entire
				// container
				maintainAspectRatio : true,
			// String - A legend template
			};
			// Create pie or douhnut chart
			// You can switch between pie and douhnut using the method below.
			pieChart.Doughnut(PieData, pieOptions);
			// alert('성공');
		},
		error : function() {
			alert('실패');
		}
	});
	
	var mf_date = $(".form-control option:selected").val();
	//alert(mf_date);
	$.ajax({
		url : '/ManagementFeeTableJSONList'+mf_date,
		type : 'post',
		dataType : 'json',
		success : function(json) {
			/*alert(json);
			alert(json[0].mf_waterFee);
			alert(json[1].mf_waterFee-json[0].mf_waterFee);
			alert((json[1].mf_waterFee-json[0].mf_waterFee)>0);*/
			
			//json[0] : 이번달, json[1]: 지난달
			
			var totalThisMntFee = json[0].mf_waterFee+json[0].mf_gasFee+json[0].mf_electricFee;
			var totalLastMntFee	= json[1].mf_waterFee+json[1].mf_gasFee+json[1].mf_electricFee;
			
			var totalThisPubMntFee = json[2].pm_clean+json[2].pm_general+json[2].pm_maintain+json[2].pm_liftMaintain
			+json[2].pm_security+json[2].pm_foodWaste+json[2].pm_fireInsurance+json[2].pm_commission+json[2].pm_meeting
			+json[2].pm_publicElectric+json[2].pm_liftElectric+json[2].pm_TVFee+json[2].pm_disinfection;
			
			var totalLastPubMntFee = json[3].pm_clean+json[3].pm_general+json[3].pm_maintain+json[3].pm_liftMaintain
			+json[3].pm_security+json[3].pm_foodWaste+json[3].pm_fireInsurance+json[3].pm_commission+json[3].pm_meeting
			+json[3].pm_publicElectric+json[3].pm_liftElectric+json[3].pm_TVFee+json[3].pm_disinfection;
			
			var thisTotal = totalThisMntFee+totalThisPubMntFee;
			var lastTotal = totalLastMntFee+totalLastPubMntFee;
			
			$('#mnt').empty();
			// 수도요금
			var html = '<tr>';
				html += '<td>수도요금</td><td>'+json[1].mf_waterFee+'</td>';
				html += '<td>'+json[0].mf_waterFee+'</td>';
				html += '<c:choose>';
				if(json[0].mf_waterFee-json[1].mf_waterFee>0){
				html += '<td style="color: red;">▲&nbsp;'+(json[0].mf_waterFee-json[1].mf_waterFee)+'</td>';
				}
				else{
				html += '<td style="color: blue;">▼&nbsp;'+(json[1].mf_waterFee-json[0].mf_waterFee)+'</td>';
				}
				html += '</tr>';
				
				//가스요금
				html += '<tr>';
				html += '<td>가스요금</td><td>'+json[1].mf_gasFee+'</td>';
				html += '<td>'+json[0].mf_gasFee+'</td>';
				html += '<c:choose>';
				if(json[0].mf_gasFee-json[1].mf_gasFee>0){
				html += '<td style="color: red;">▲&nbsp;'+(json[0].mf_gasFee-json[1].mf_gasFee)+'</td>';
				}
				else{
				html += '<td style="color: blue;">▼&nbsp;'+(json[1].mf_gasFee-json[0].mf_gasFee)+'</td>';
				}
				html += '</tr>';
				
				//전기요금
				html += '<tr>';
				html += '<td>전기요금</td><td>'+json[1].mf_electricFee+'</td>';
				html += '<td>'+json[0].mf_electricFee+'</td>';
				html += '<c:choose>';
				if(json[0].mf_electricFee-json[1].mf_electricFee>0){
				html += '<td style="color: red;">▲&nbsp;'+(json[0].mf_electricFee-json[1].mf_electricFee)+'</td>';
				}
				else{
				html += '<td style="color: blue;">▼&nbsp;'+(json[1].mf_electricFee-json[0].mf_electricFee)+'</td>';
				}
				html += '</tr>';
				
				//관리비 종합
				html += '<tr style="background-color: #e4e4e4;">';
				html += '<td>관리비종합</td><td>'+totalLastMntFee+'</td>';
				html += '<td>'+totalThisMntFee+'</td>';
				html += '<c:choose>';
				if(totalThisMntFee-totalLastMntFee>0){
				html += '<td style="color: red;">▲&nbsp;'+(totalThisMntFee-totalLastMntFee)+'</td>';
				}
				else{
				html += '<td style="color: blue;">▼&nbsp;'+(totalLastMntFee-totalThisMntFee)+'</td>';
				}
				html += '</tr>';
				
				//공동관리비
				html += '<tr style="background-color: #e4e4e4;">';
				html += '<td>공동 관리비 종합</td><td>'+totalLastPubMntFee+'</td>';
				html += '<td>'+totalThisPubMntFee+'</td>';
				html += '<c:choose>';
				if(totalThisPubMntFee-totalLastPubMntFee>0){
				html += '<td style="color: red;">▲&nbsp;'+(totalThisPubMntFee-totalLastPubMntFee)+'</td>';
				}
				else{
				html += '<td style="color: blue;">▼&nbsp;'+(totalLastPubMntFee-totalThisPubMntFee)+'</td>';
				}
				html += '</tr>';

				//관리비+공동관리비
				html += '<tr style="background-color: skyblue;">';
				html += '<td>총계</td><td>'+lastTotal+'</td>';
				html += '<td>'+thisTotal+'</td>';
				html += '<c:choose>';
				if(thisTotal-lastTotal>0){
				html += '<td style="color: red;">▲&nbsp;'+(thisTotal-lastTotal)+'</td>';
				}
				else{
				html += '<td style="color: blue;">▼&nbsp;'+(lastTotal-thisTotal)+'</td>';
				}
				html += '</tr>';
				
				
				$('#mnt').append(html);
		}
	})

});
