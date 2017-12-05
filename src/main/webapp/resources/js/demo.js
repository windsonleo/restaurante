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
            labels: ['M', 'T', 'W', 'T', 'F', 'S', 'S'],
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

        dataDailySalesChart = {
            labels: ['S', 'T', 'Q', 'QT', 'SX', 'SB', 'D'],
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

       
        dataDailySalesChartbicho = {
                labels: [ 'Galo', 'Porco',  'Borboleta', 'Veado'],
                series: [
                    [45, 32, 26, 21]
                ]
            };

            optionsDailySalesChartbicho = {
                lineSmooth: Chartist.Interpolation.cardinal({
                    tension: 0
                }),
                low: 0,
                high: 100, // creative tim: we recommend you to set the high sa the biggest value + something for a better look
                chartPadding: {
                    top: 0,
                    right: 28,
                    bottom: 0,
                    left: 0
                },
            }

            var dailySalesChartbicho = new Chartist.Line('#dailySalesChartbicho', dataDailySalesChartbicho, optionsDailySalesChartbicho);

            md.startAnimationForLineChart(dailySalesChartbicho);

        /* ----------==========     Completed Tasks Chart initialization    ==========---------- */

        dataCompletedTasksChart = {
            labels: ['15min', '30min', '45min', '90min', '120min'],
            series: [
                [1, 2, 3, 4, 5]
            ]
        };

        optionsCompletedTasksChart = {
            lineSmooth: Chartist.Interpolation.cardinal({
                tension: 0
            }),
            low: 0,
            high: 10, // creative tim: we recommend you to set the high sa the biggest value + something for a better look
            chartPadding: {
                top: 0,
                right: 0,
                bottom: 0,
                left: 0
            }
        }

        var completedTasksChart = new Chartist.Line('#completedTasksChart', dataCompletedTasksChart, optionsCompletedTasksChart);

        // start animation for the Completed Tasks Chart - Line Chart
        md.startAnimationForLineChart(completedTasksChart);


        /* ----------==========     Emails Subscription Chart initialization    ==========---------- */
        var colunas;
        var graf ;
        var grafs = new Array();
        
        $('#incidencia tbody tr').each(function () {
            // Recuperar todas as colunas da linha percorida
            var colunas = $(this).children();

            // Criar objeto para armazenar os dados (com JSON essa tarefa fica mais simples)
            var graf = {
                'numero': $(colunas[0]).text(), // valor da coluna Produto
                'quantidades': $(colunas[1]).text() // Valor da coluna Quantidade
            };

            // Adicionar o objeto pedido no array
            grafs.push(graf);
        });

        // listando os pedidos (teste)
        console.info(grafs);
        var pos = 15;
        var reduzido = grafs.splice(pos,85);
//        grafs.join(' ');
        
//        foreach( $grafs as $k => $v ) {
//
//        	   $grafs[ $k ] = "'" . $v . "'";
//        	};
//        explode( ',', sprintf( "'%s'", implode( "','", $grafs ) ) )
        
//         var valores = implode("','",grafs);
//        valores = "'"+ valores + "'";
        
//        var json = JSON.parse(grafs);
        
        
        
//        var final = str_replace("\"", "'", grafs);

        var dataEmailsSubscriptionChart = {
            
//        	var key = document.getElementById("incidencia");
//        		Object.keys(grafs)
        		 labels: ['S', 'T', 'Q', 'QT', 'SX', 'SB', 'D'],
        		 //            labels: [Object.keys(grafs)],

            series: [
                [230, 750, 450, 300, 280, 240, 200]
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
                right: 10,
                bottom: 0,
                left: 0
            }
        };
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
        var emailsSubscriptionChart = Chartist.Bar('#emailsSubscriptionChart', dataEmailsSubscriptionChart, optionsEmailsSubscriptionChart,responsiveOptions);

        //start animation for the Emails Subscription Chart
        md.startAnimationForBarChart(emailsSubscriptionChart);

    
        var dataEmailsSubscriptionChartlotofacil = {
            

        		labels: ['S', 'T', 'Q', 'QT', 'SX', 'SB', 'D'],
            series: [
                [210, 720, 40, 30, 230, 290, 200]
            ]
        };
        var optionsEmailsSubscriptionChartlotofacil = {
            axisX: {
                showGrid: false
            },
            low: 0,
            high: 1000,
            chartPadding: {
                top: 0,
                right: 10,
                bottom: 0,
                left: 0
            }
        };
        var responsiveOptionslotofacil = [
            ['screen and (max-width: 640px)', {
                seriesBarDistance: 5,
                axisX: {
                    labelInterpolationFnc: function(value) {
                        return value[0];
                    }
                }
            }]
        ];
        var emailsSubscriptionChartlotofacil = Chartist.Bar('#emailsSubscriptionChartlotofacil', dataEmailsSubscriptionChartlotofacil, optionsEmailsSubscriptionChartlotofacil,responsiveOptionslotofacil);

        //start animation for the Emails Subscription Chart
        md.startAnimationForBarChart(emailsSubscriptionChartlotofacil);

        var dataEmailsSubscriptionChartlotomania = {
                

            	labels: ['0','1','2','3','4','5','6','7','8','9','10','11','12','13','14'],
                series: [
                    [210, 720, 40, 30, 230, 290, 200, 190, 330, 580, 430, 70, 655,159,890]
                ]
            };
            var optionsEmailsSubscriptionChartlotomania = {
                axisX: {
                    showGrid: false
                },
                low: 0,
                high: 1000,
                chartPadding: {
                    top: 0,
                    right: 10,
                    bottom: 0,
                    left: 0
                }
            };
            var responsiveOptionslotomania = [
                ['screen and (max-width: 640px)', {
                    seriesBarDistance: 5,
                    axisX: {
                        labelInterpolationFnc: function(value) {
                            return value[0];
                        }
                    }
                }]
            ];
            var emailsSubscriptionChartlotomania = Chartist.Bar('#emailsSubscriptionChartlotomania', dataEmailsSubscriptionChartlotomania, optionsEmailsSubscriptionChartlotomania,responsiveOptionslotomania);

            //start animation for the Emails Subscription Chart
            md.startAnimationForBarChart(emailsSubscriptionChartlotomania);

            var dataEmailsSubscriptionChartbicho = {
                    

                	labels: ['0','1','2','3','4','5','6','7','8','9','10','11','12','13','14'],
                    series: [
                        [10, 70, 400, 310, 235, 490, 100, 590, 730, 480, 330, 170, 650,359,290]
                    ]
                };
                var optionsEmailsSubscriptionChartbicho = {
                    axisX: {
                        showGrid: false
                    },
                    low: 0,
                    high: 1000,
                    chartPadding: {
                        top: 0,
                        right: 10,
                        bottom: 0,
                        left: 0
                    }
                };
                var responsiveOptionsbicho = [
                    ['screen and (max-width: 640px)', {
                        seriesBarDistance: 5,
                        axisX: {
                            labelInterpolationFnc: function(value) {
                                return value[0];
                            }
                        }
                    }]
                ];
                var emailsSubscriptionChartbicho = Chartist.Bar('#emailsSubscriptionChartbicho', dataEmailsSubscriptionChartbicho, optionsEmailsSubscriptionChartbicho,responsiveOptionsbicho);

                //start animation for the Emails Subscription Chart
                md.startAnimationForBarChart(emailsSubscriptionChartbicho);

            },

    initGoogleMaps: function() {
        var myLatlng = new google.maps.LatLng(40.748817, -73.985428);
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
            title: "Hello World!"
        });

        // To add the marker to the map, call setMap();
        marker.setMap(map);
    },

    showNotification: function(from, align) {
        color = Math.floor((Math.random() * 4) + 1);

        $.notify({
            icon: "notifications",
            message: "Welcome to <b>Material Dashboard</b> - a beautiful freebie for every web developer."

        }, {
            type: type[color],
            timer: 4000,
            placement: {
                from: from,
                align: align
            }
        });
    }


}