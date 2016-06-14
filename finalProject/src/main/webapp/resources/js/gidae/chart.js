	$(function() {
		var areaChartCanvas = $("#waterChart").get(0).getContext("2d");
		var areaChart = new Chart(areaChartCanvas);
		
		var areaChartCanvas2 = $("#gasChart").get(0).getContext("2d");
		var areaChart2 = new Chart(areaChartCanvas2);
		
		var areaChartCanvas3 = $("#electricChart").get(0).getContext("2d");
		var areaChart3 = new Chart(areaChartCanvas3);
		
		var date = ${date };
		var mnt_list = ${mnt_list.size()};
		
		//for(var i=0;i<mnt_list)
		
		alert('나와');
		alert(mnt_list); 
		
		//수도요금
		var areaChartData = {
			
			labels : [ (date-6)+"월", (date-5)+"월", (date-4)+"월", (date-3)+"월", (date-2)+"월", (date-1)+"월", date+"월" ],
			datasets : [ {
				label : "평균요금",
				fillColor : "rgba(210, 214, 222, 1)",
				strokeColor : "rgba(210, 214, 222, 1)",
				pointColor : "rgba(210, 214, 222, 1)",
				pointStrokeColor : "#c1c7d1",
				pointHighlightFill : "#fff",
				pointHighlightStroke : "rgba(220,220,220,1)",
				data : [ 100, 59, 80, 81, 56, 55, mnt_list ]
			}, {
				label : "우리집요금",
				fillColor : "rgba(60,141,188,0.9)",
				strokeColor : "rgba(60,141,188,0.8)",
				pointColor : "#3b8bba",
				pointStrokeColor : "rgba(60,141,188,1)",
				pointHighlightFill : "#fff",
				pointHighlightStroke : "rgba(60,141,188,1)",
				data : [ 28, 48, 40, 19, 86, 27, 90 ]
			} ]
		};

		//가스요금
		var areaChartData2 = {
			labels : [(date-6)+"월", (date-5)+"월", (date-4)+"월", (date-3)+"월", (date-2)+"월", (date-1)+"월", date+"월" ],
			datasets : [ {
				label : "평균요금",
				fillColor : "rgba(210, 214, 222, 1)",
				strokeColor : "rgba(210, 214, 222, 1)",
				pointColor : "rgba(210, 214, 222, 1)",
				pointStrokeColor : "#c1c7d1",
				pointHighlightFill : "#fff",
				pointHighlightStroke : "rgba(220,220,220,1)",
				data : [ 65, 59, 80, 81, 56, 55, 100 ]
			}, {
				label : "우리집요금",
				fillColor : "rgba(60,141,188,0.9)",
				strokeColor : "rgba(60,141,188,0.8)",
				pointColor : "#3b8bba",
				pointStrokeColor : "rgba(60,141,188,1)",
				pointHighlightFill : "#fff",
				pointHighlightStroke : "rgba(60,141,188,1)",
				data : [ 28, 48, 40, 19, 86, 27, 1000 ]
			} ]
		};

		
		//전기요금
		var areaChartData3 = {
				labels : [ (date-6)+"월", (date-5)+"월", (date-4)+"월", (date-3)+"월", (date-2)+"월", (date-1)+"월", date+"월" ],
				datasets : [ {
					label : "평균요금",
					fillColor : "rgba(210, 214, 222, 1)",
					strokeColor : "rgba(210, 214, 222, 1)",
					pointColor : "rgba(210, 214, 222, 1)",
					pointStrokeColor : "#c1c7d1",
					pointHighlightFill : "#fff",
					pointHighlightStroke : "rgba(220,220,220,1)",
					data : [ 65, 59, 80, 81, 56, 55, 100 ]
				}, {
					label : "우리집요금",
					fillColor : "rgba(60,141,188,0.9)",
					strokeColor : "rgba(60,141,188,0.8)",
					pointColor : "#3b8bba",
					pointStrokeColor : "rgba(60,141,188,1)",
					pointHighlightFill : "#fff",
					pointHighlightStroke : "rgba(60,141,188,1)",
					data : [ 28, 48, 40, 90, 86, 27, 100 ]
				} ]
			};

		
		var areaChartOptions = {
			//Boolean - If we should show the scale at all
			showScale : true,
			//Boolean - Whether grid lines are shown across the chart
			scaleShowGridLines : false,
			//String - Colour of the grid lines
			scaleGridLineColor : "rgba(0,0,0,.05)",
			//Number - Width of the grid lines
			scaleGridLineWidth : 1,
			//Boolean - Whether to show horizontal lines (except X axis)
			scaleShowHorizontalLines : true,
			//Boolean - Whether to show vertical lines (except Y axis)
			scaleShowVerticalLines : true,
			//Boolean - Whether the line is curved between points
			bezierCurve : true,
			//Number - Tension of the bezier curve between points
			bezierCurveTension : 0.3,
			//Boolean - Whether to show a dot for each point
			pointDot : false,
			//Number - Radius of each point dot in pixels
			pointDotRadius : 4,
			//Number - Pixel width of point dot stroke
			pointDotStrokeWidth : 1,
			//Number - amount extra to add to the radius to cater for hit detection outside the drawn point
			pointHitDetectionRadius : 20,
			//Boolean - Whether to show a stroke for datasets
			datasetStroke : true,
			//Number - Pixel width of dataset stroke
			datasetStrokeWidth : 2,
			//Boolean - Whether to fill the dataset with a color
			datasetFill : false,
			//String - A legend template
			//Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
			maintainAspectRatio : true,
			//Boolean - whether to make the chart responsive to window resizing
			responsive : true
		};

		areaChart.Line(areaChartData, areaChartOptions);

		var areaChartOptions2 = areaChartOptions;
		//areaChartOptions2.datasetFill = false;
		areaChart2.Line(areaChartData2, areaChartOptions2);
		
		
		var areaChartOptions3 = areaChartOptions;
		//areaChartOptions3.datasetFill = false;
		areaChart3.Line(areaChartData3, areaChartOptions3);

		//-------------
		//- PIE CHART -
		//-------------
		// Get context with jQuery - using jQuery's .get() method.
		var pieChartCanvas = $("#pieChart").get(0).getContext("2d");
		var pieChart = new Chart(pieChartCanvas);
		var PieData = [ {
			value : 100,
			color : "#f56954",
			highlight : "#f56954",
			label : "전기요금"
		}, {
			value : 500,
			color : "#00a65a",
			highlight : "#00a65a",
			label : "수도요금"
		}, {
			value : 400,
			color : "#f39c12",
			highlight : "#f39c12",
			label : "가스요금"
		}, {
			value : 600,
			color : "#00c0ef",
			highlight : "#00c0ef",
			label : "공동관리비"
		}
		];
		var pieOptions = {
			//Boolean - Whether we should show a stroke on each segment
			segmentShowStroke : true,
			//String - The colour of each segment stroke
			segmentStrokeColor : "#fff",
			//Number - The width of each segment stroke
			segmentStrokeWidth : 2,
			//Number - The percentage of the chart that we cut out of the middle
			percentageInnerCutout : 50, // This is 0 for Pie charts
			//Number - Amount of animation steps
			animationSteps : 100,
			//String - Animation easing effect
			animationEasing : "easeOutBounce",
			//Boolean - Whether we animate the rotation of the Doughnut
			animateRotate : true,
			//Boolean - Whether we animate scaling the Doughnut from the centre
			animateScale : false,
			//Boolean - whether to make the chart responsive to window resizing
			responsive : true,
			// Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
			maintainAspectRatio : true,
			//String - A legend template
		};
		//Create pie or douhnut chart
		// You can switch between pie and douhnut using the method below.
		pieChart.Doughnut(PieData, pieOptions);

	});