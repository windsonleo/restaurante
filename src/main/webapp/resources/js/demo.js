type = ['primary', 'info', 'success', 'warning', 'danger'];


demo = {
   

		
		initPickColor: function() {
        $('.pick-class-label').click(function() {
            var new_class = $(this).attr('new-class');
            var old_class = $('#display-buttons').attr('data-class');
            var display_div = $('#display-buttons');
            if (display_div.length) {
                var display_buttons = display_div.find('.btn');
                display_buttons.removeClass(old_class);
                display_buttons.addClass(new_class);
                display_div.attr('data-class', new_class);
            }
        });
    },

    initDocumentationCharts: function() {
        /* ----------==========     Daily Sales Chart initialization For Documentation    ==========---------- */
       
    	
    	dataDailySalesChart = {
        		
//            labels: ['M', 'T', 'W', 'T', 'F', 'S', 'S'],
        		labels:	['SEG', 'TER', 'QUAR', 'QUIN', 'SEX', 'SAB', 'DOM'],

//        		 labels: [din],
            series: [
            	[12, 17, 7, 17, 23, 18, 38]
            ]
        };

        optionsDailySalesChart = {
            lineSmooth: Chartist.Interpolation.cardinal({
                tension: 0
            }),
            low: 0,
            high: 50, // creative tim: we recommend you to set the high sa the biggest value + something for a better look
            chartPadding: {
                top: 0,
                right: 0,
                bottom: 0,
                left: 0
            },
        }

        var dailySalesChart = new Chartist.Line('#dailySalesChart', dataDailySalesChart, optionsDailySalesChart);

        md.startAnimationForLineChart(dailySalesChart);
        
    }, 
        
       

    initDashboardPageCharts: function() {

        /* ----------==========     Daily Sales Chart initialization    ==========---------- */
    	
    	
      	var activity_array=[
    		$.ajax({
    		url: "/restaurante/chart/vendasDias/",
    		url: "/chart/vendasDias/",
    		success: function(data) {
    			//add new ajax data to existing array
    			activity_array.push(parseInt(data));
    			
    		}
    	})];
    	
    	
    	var activity_array_dom=[
    		$.ajax({
//    		url: "/restaurante/chart/vendasDias/dom",
    			url: "/chart/vendasDias/dom",
    		success: function(data) {
    			//add new ajax data to existing array
    			activity_array_dom.push(parseInt(data));
    			
    		}
    	})];
    	
    	var activity_array_seg=[
    		$.ajax({
//    		url: "/restaurante/chart/vendasDias/seg",
    			url:"/chart/vendasDias/seg",
    		success: function(data) {
    			//add new ajax data to existing array
    			activity_array_seg.push(parseInt(data));
    			
    		}
    	})];
    	
    	
    	var activity_array_ter=[
    		$.ajax({
//    		url: "/restaurante/chart/vendasDias/ter",
    			url: "/chart/vendasDias/ter",
    		success: function(data) {
    			//add new ajax data to existing array
    			activity_array_ter.push(parseInt(data));
    			
    		}
    	})];
    	
    	var activity_array_quar=[
    		$.ajax({
    		url: "/chart/vendasDias/quar",
    		success: function(data) {
    			//add new ajax data to existing array
    			activity_array_quar.push(parseInt(data));
    			
    		}
    	})];
    	
    	var activity_array_quin=[
    		$.ajax({
    		url: "/chart/vendasDias/quin",
    		success: function(data) {
    			//add new ajax data to existing array
    			activity_array_quin.push(parseInt(data));
    			
    		}
    	})];
    	
    	var activity_array_sex=[
    		$.ajax({
    		url: "/chart/vendasDias/sex",
    		success: function(data) {
    			//add new ajax data to existing array
    			activity_array_sex.push(parseInt(data));
    			
    		}
    	})];
    	
    	var activity_array_sab=[
    		$.ajax({
    		url: "/chart/vendasDias/sab",
    		success: function(data) {
    			//add new ajax data to existing array
    			activity_array_sab.push(parseInt(data));
    			
    		}
    	})];
    	
    	console.log("seg" + activity_array_seg);
    	console.log("ter" + activity_array_ter);
    	console.log("quar" + activity_array_quar);
    	console.log("quin" + activity_array_quin);
    	console.log("sex" + activity_array_sex);
    	console.log("sab" + activity_array_sab);
    	console.log("dom" + activity_array_dom);

        dataDailySalesChart = {
        		
//              labels: ['M', 'T', 'W', 'T', 'F', 'S', 'S'],
//            labels: [din],
        		labels:	['SEG', 'TER', 'QUA', 'QUI', 'SEX', 'SAB', 'DOM'],
            series: [
            	
            	[activity_array_seg,activity_array_ter,activity_array_quar,
            	activity_array_quin,activity_array_sex,activity_array_sab,
            	activity_array_dom]
            	
//            	[activity_array,activity_array_ter,activity_array_dom]
            	
//            	[activity_array_seg],[activity_array_ter],[activity_array_quar],
//                	[activity_array_quin],[activity_array_sex],[activity_array_sab],
//                	[activity_array_dom]
  	
            ]
        };
        
        
        optionsDailySalesChart = {
            lineSmooth: Chartist.Interpolation.cardinal({
                tension: 0
            }),
            low: 0,
            high: 100, // creative tim: we recommend you to set the high sa the biggest value + something for a better look
            chartPadding: {
                top: 0,
                right: 0,
                bottom: 0,
                left: 0
            },
        }

        var dailySalesChart = new Chartist.Line('#dailySalesChart', dataDailySalesChart, optionsDailySalesChart);

        md.startAnimationForLineChart(dailySalesChart);



        /* ----------==========     Completed Tasks Chart initialization    ==========---------- */

        dataCompletedTasksChart = {
            labels: ['15min', '30min', '60min', '120min'],
            series: [
                [01, 02, 03, 04]
            ]
        };

        optionsCompletedTasksChart = {
            lineSmooth: Chartist.Interpolation.cardinal({
                tension: 0
            }),
            low: 0,
            high: 50, // creative tim: we recommend you to set the high sa the biggest value + something for a better look
            chartPadding: {
                top: 0,
                right: 0,
                bottom: 0,
                left: 0
            },
        }

        var completedTasksChart = new Chartist.Line('#completedTasksChart', dataCompletedTasksChart, optionsCompletedTasksChart);

        // start animation for the Completed Tasks Chart - Line Chart
        md.startAnimationForLineChart(completedTasksChart);


        /* ----------==========     Emails Subscription Chart initialization    ==========---------- */

        var dataEmailsSubscriptionChart = {
            labels: ['sushi', 'temaki', 'combo'],
            series: [
                [542, 443, 320]

            ]
        };
        var optionsEmailsSubscriptionChart = {
            axisX: {
                showGrid: false
            },
            low: 0,
            high: 1000,
            chartPadding: {
                top: 0,
                right: 5,
                bottom: 0,
                left: 0
            },
        }
        
        var responsiveOptions = [
            ['screen and (max-width: 640px)', {
                seriesBarDistance: 5,
                axisX: {
                    labelInterpolationFnc: function(value) {
                        return value[0];
                    }
                }
            }]
        ];
        
        var emailsSubscriptionChart = Chartist.Bar('#emailsSubscriptionChart', dataEmailsSubscriptionChart, optionsEmailsSubscriptionChart, responsiveOptions);

        //start animation for the Emails Subscription Chart
        md.startAnimationForBarChart(emailsSubscriptionChart);

    },

    initGoogleMaps: function() {
        var myLatlng = new google.maps.LatLng(-8.207120, -34.926548);
        var mapOptions = {
            zoom: 13,
            center: myLatlng,
            scrollwheel: false, //we disable de scroll over the map, it is a really annoing when you scroll through page
            styles: [{
                "featureType": "water",
                "stylers": [{
                    "saturation": 43
                }, {
                    "lightness": -11
                }, {
                    "hue": "#0088ff"
                }]
            }, {
                "featureType": "road",
                "elementType": "geometry.fill",
                "stylers": [{
                    "hue": "#ff0000"
                }, {
                    "saturation": -100
                }, {
                    "lightness": 99
                }]
            }, {
                "featureType": "road",
                "elementType": "geometry.stroke",
                "stylers": [{
                    "color": "#808080"
                }, {
                    "lightness": 54
                }]
            }, {
                "featureType": "landscape.man_made",
                "elementType": "geometry.fill",
                "stylers": [{
                    "color": "#ece2d9"
                }]
            }, {
                "featureType": "poi.park",
                "elementType": "geometry.fill",
                "stylers": [{
                    "color": "#ccdca1"
                }]
            }, {
                "featureType": "road",
                "elementType": "labels.text.fill",
                "stylers": [{
                    "color": "#767676"
                }]
            }, {
                "featureType": "road",
                "elementType": "labels.text.stroke",
                "stylers": [{
                    "color": "#ffffff"
                }]
            }, {
                "featureType": "poi",
                "stylers": [{
                    "visibility": "off"
                }]
            }, {
                "featureType": "landscape.natural",
                "elementType": "geometry.fill",
                "stylers": [{
                    "visibility": "on"
                }, {
                    "color": "#b8cb93"
                }]
            }, {
                "featureType": "poi.park",
                "stylers": [{
                    "visibility": "on"
                }]
            }, {
                "featureType": "poi.sports_complex",
                "stylers": [{
                    "visibility": "on"
                }]
            }, {
                "featureType": "poi.medical",
                "stylers": [{
                    "visibility": "on"
                }]
            }, {
                "featureType": "poi.business",
                "stylers": [{
                    "visibility": "simplified"
                }]
            }]

        }
        var map = new google.maps.Map(document.getElementById("map"), mapOptions);

        var marker = new google.maps.Marker({
            position: myLatlng,
            title: "Motoqueiro"
        });

        // To add the marker to the map, call setMap();
        marker.setMap(map);
    },

    showNotification: function(from, align,msg) {
        color = Math.floor((Math.random() * 4) + 1);

        $.notify({
            icon: "notifications",
//            message: "Welcome to <b>Material Dashboard</b> - a beautiful freebie for every web developer."
            message: msg

            
        }, {
            type: type[color],
            timer: 4000,
            placement: {
                from: from,
                align: align
            }
        });
    },
    
    Refresh : function() {
    	
    	$.ajax({
    		url: "/restaurante/chart/vendasDias",
    		success: function(data) {
    			//add new ajax data to existing array
    			dataDailySalesChart.series[0].push(parseInt(data));
    			//remove first array entry
    			activity_array.splice(1, 1);
    			//update data object with new array
    			var data = {
    				series: [activity_array],
    			};
    			//update and refresh chart
    			activity.update(data);
    		}
    	});
    }
    
}