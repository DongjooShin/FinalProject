// Morris.js Charts sample data for SB Admin template

$(function() {
		"use strict";


			$('#excel').on('click', function() {
				window.open('/publicmana/getExcel', '엑셀파일');

			});
			
			
			$('#excel2').on('click', function() {
				alert('dd')
				window.open('/publicmana/getMonthExcel', '엑셀파일');
				
			});

	

		
		$.ajax({
			url: '/countryGraph',
			type: 'post',
			dataType: 'json',
			success: successHandler2});
		$.ajax({
			url: '/CityGraph',
			type: 'post',
			dataType: 'json',
			success: successHandler3});
		$.ajax({
			url: '/monthManageFee',
			type: 'post',
			dataType: 'json',
			success: successHandler4});
		$.ajax({
			url: '/publicdata',
			type: 'post',
			dataType: 'json',
			success: successHandler1});
		// AREA CHART
		



	
	
	function successHandler2(data) {

			var area = new Morris.Area({
				element : 'revenue-chart',
				resize : true,
				data : data,
				xkey : 'd',
				ykeys : [ 'manageFee', 'manageFee2' ],
				labels : [ '전국평균관리비', '나의관리비' ],
				lineColors : [ '#a0d0e0', '#3c8dbc' ],
				hideHover : 'auto'
			});
	};
	function successHandler3(data) {
		
		//BAR CHART
		var bar = new Morris.Bar({
			element : 'bar-chart',
			resize : true,
			data : data,
			barColors : [ '#00a65a', '#f56954' ],
			xkey : 'd',
			ykeys : [ 'manageFee', 'manageFee2' ],
			labels : [ '도시별평균관리비', '나의관리비' ],
			lineColors : [ '#a0d0e0', '#3c8dbc' ],
			hideHover : 'auto'
		});
	};
	function successHandler4(data) {
		
        var line = new Morris.Line({
            element: 'line-chart',
            resize: true,
            data: data,
            xkey: 'd',
            ykeys: ['manageFee'],
            labels: ['월별관리비'],
            lineColors: ['#3c8dbc'],
            hideHover: 'auto'
          });
	};
	function successHandler1(data) {
		
		var line = new Morris.Line({
			element: 'line-chart2',
			resize: true,
			data: data,
			xkey: 'd',
			ykeys: ['manageFee'],
			labels: ['연도별관리비'],
			lineColors: ['#3c8dbc'],
			hideHover: 'auto'
		});
	};



});
