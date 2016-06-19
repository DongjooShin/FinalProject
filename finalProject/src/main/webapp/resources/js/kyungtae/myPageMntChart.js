$(function() {
	/* $("#mngtable").; */
	
	$('')

	//alert($(".form-control option:selected").val());
	var areaChartCanvas = $("#waterChart").get(0).getContext("2d");
	var areaChart = new Chart(areaChartCanvas);

	var areaChartCanvas2 = $("#gasChart").get(0).getContext("2d");
	var areaChart2 = new Chart(areaChartCanvas2);

	var areaChartCanvas3 = $("#electricChart").get(0).getContext("2d");
	var areaChart3 = new Chart(areaChartCanvas3);

	var waterList = [];
	var gasList = [];
	var electricList = [];
	var waterAmountList = [];
	var gasAmountList = [];
	var electricAmountList = [];
	var publicFeeList = [];
	
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
			
			for(var i=0;i<7;i++){
				publicFeeList[i] = json[7+i];
				thisPayAmount[i] =  waterList[i]+gasList[i]+electricList[i]+publicFeeList[i];
			}
			var waterFeeAvg    = json[14].mf_waterFeeAvg;
			var gasFeeAvg      = json[14].mf_gasFeeAvg;
			var electricFeeAvg = json[14].mf_electricFeeAvg;
		
			afterThisPayAmount = thisPayAmount[6]*1.05;
			//alert(thisPayAmount);
			subdate = date1[6].substr(4,2);
			//alert(subdadte);
			
			
			var html = '<div>'+subdate+'월의 납부금액은 '+thisPayAmount[6]+' 원 입니다.';
//			var html = '<div>월의 납부금액은'+thisPayAmount+'원 입니다.';
			$('#mntEx').append(html);
			
			html = subdate+'월 우리집 관리비 ';
			$('.box-title2').append(html);
			
			html = waterList[6]+'원';
			$('.detailWaterFee').append(html);
			$('#waterFee').append(html);
			
			html = gasList[6]+'원';
			$('.detailGasFee').append(html);
			$('#gasFee').append(html);
			
			html = electricList[6]+'원';
			$('.detailElectricFee').append(html);
			$('#electricFee').append(html);
		
			html = publicFeeList[6]+'원';
			$('.detailPublicFee').append(html);
			$('#publicFee').append(html);
			
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
					pointHighlightFill : "#eaeaea",
					pointHighlightStroke : "rgba(220,220,220,1)",
					data : [0,0,0,0,0,0,0]
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
					data : [0,0,0,0,0,0,0]
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
					data : [ 0,0,0,0,0,0,0]
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

		},
		error : function() {
			alert('실패');
		}
	});
	
	function clickBox(){
		
	}
	

});
